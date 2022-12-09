//
//  AppInfoViewController.swift
//  VeganVision
//
//  Created by Ben Gabay on 12/9/22.
//

import UIKit
import SwiftUI
import Combine

class AppInfoViewController: UIHostingController<AppInfoView> {

    let viewModel: AppInfoViewModel
    private var cancellables = [AnyCancellable]()
    init(viewModel: AppInfoViewModel = AppInfoViewModel()) {
        self.viewModel = viewModel
        super.init(rootView: AppInfoView(viewModel: viewModel))
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
