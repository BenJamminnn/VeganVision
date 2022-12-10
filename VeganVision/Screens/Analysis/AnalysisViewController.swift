//
//  AnalysisViewController.swift
//  VeganVision
//
//  Created by Ben Gabay on 11/19/22.
//

import UIKit
import SwiftUI
import Combine

class AnalysisViewController: UIHostingController<AnalysisView> {
    
    private var cancellables = [AnyCancellable]()
    
    let viewModel: AnalysisViewModel
    
    init(viewModel: AnalysisViewModel) {
        self.viewModel = viewModel
        super.init(rootView: AnalysisView(viewModel: viewModel))
    }
    
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupObservables()
    }

    private func setupObservables() {
        viewModel.backAction
            .receive(on: RunLoop.main)
            .sink { [weak self] in
                guard let self = self else { return }
                self.navigationController?.popViewController(animated: true)
            }
            .store(in: &cancellables)
    }
}
