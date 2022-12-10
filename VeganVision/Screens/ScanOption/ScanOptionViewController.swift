//
//  ScanOptionViewController.swift
//  VeganVision
//
//  Created by Ben Gabay on 12/8/22.
//

import UIKit
import PhotosUI
import SwiftUI
import Combine

class ScanOptionViewController: UIHostingController<ScanOptionView> , PHPickerViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let viewModel: ScanOptionViewModel
    var cancellables = [AnyCancellable]()

    var chosenImportedImage: UIImage?
    var imagePicker = UIImagePickerController()

    let nonVeganRepository: VeganListRepository
    
    init(viewModel: ScanOptionViewModel = ScanOptionViewModel(),
         nonVeganRepository: VeganListRepository = VeganListRepository()) {
        self.viewModel = viewModel
        self.nonVeganRepository = nonVeganRepository
        super.init(rootView: ScanOptionView(viewModel: viewModel))
    }
    
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        setupObservables()
    }
    
    private func setupObservables() {
        viewModel.scanAction
            .receive(on: RunLoop.main)
            .sink { [weak self] in
                // Present Camera
                guard let self = self else { return }
                self.imagePicker.delegate = self
                self.imagePicker.sourceType = .camera
                self.present(self.imagePicker, animated: true, completion: nil)
            }
            .store(in: &cancellables)
        viewModel.importAction
            .receive(on: RunLoop.main)
            .sink { [weak self] in
                guard let self = self else { return }
                var config = PHPickerConfiguration()
                config.filter = .images
                let picker = PHPickerViewController(configuration: config)
                picker.delegate = self
                self.present(picker, animated: true)
            }
            .store(in: &cancellables)
        viewModel.appInfoAction
            .receive(on: RunLoop.main)
            .sink { [weak self] in
                guard let self = self else { return }
                let appInfoViewController = AppInfoViewController()
                self.navigationController?.pushViewController(appInfoViewController, animated: true)
            }
            .store(in: &cancellables)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            imagePicker.dismiss(animated: true, completion: {
                self.analyzeImage(image: image)
            })
        }
    }

    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        guard let provider = results.first?.itemProvider else { return }

        if provider.canLoadObject(ofClass: UIImage.self) {
            provider.loadObject(ofClass: UIImage.self) { image, _ in
                if let chosenImage = image as? UIImage {
                    DispatchQueue.main.async {
                        picker.dismiss(animated: true) {
                            self.analyzeImage(image: chosenImage)
                        }
                    }
                }
            }
        }
    }
    
    private func analyzeImage(image: UIImage) {
        OCRUtil.recognizeText(image: image) { [weak self] result, error in
            guard let self = self else { return }
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                guard let result = result,
                      error == nil else {
                    // Process Error
                    return
                }

                // Returns offending words
                let results = self.processResult(wordResult: result)
                let analysisViewModel = AnalysisViewModel(offendingWords: results)
                let analysisViewController = AnalysisViewController(viewModel: analysisViewModel)
                self.navigationController?.pushViewController(analysisViewController, animated: true)
            }
        }
    }
    
    private func processResult(wordResult: [String]) -> [String] {
        var offendingWords = [String: String]()
        for ingredient in wordResult {
            for nonVeganIngredient in nonVeganRepository.currentEntries() {
                if ingredient.lowercased().contains(nonVeganIngredient.lowercased()) {
                    if !excludedList.contains(ingredient.lowercased()) {
                        offendingWords[ingredient] = nonVeganIngredient
                    }
                }
            }
        }
        let violations = Set(offendingWords.compactMap {
            $0.value
        })
        return Array(violations)
    }
}
