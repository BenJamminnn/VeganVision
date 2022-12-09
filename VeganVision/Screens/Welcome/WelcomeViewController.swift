//
//  WelcomeViewController.swift
//  VeganVision
//
//  Created by Ben Gabay on 11/19/22.
//

import UIKit
import Combine
import SwiftUI

class WelcomeViewController: UIHostingController<WelcomeView> {

    let viewModel: WelcomeViewModel
    
    private var cancellables = [AnyCancellable]()
    
    init(viewModel: WelcomeViewModel = WelcomeViewModel()) {
        self.viewModel = viewModel
        super.init(rootView: WelcomeView(viewModel: viewModel))
    }
    
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupObservables()
    }
    
    private func setupObservables() {
        viewModel.getStartedPressed
            .receive(on: RunLoop.main)
            .sink { [weak self] in
                guard let self = self else { return }
                let mainViewController = UIViewController()
                self.navigationController?.pushViewController(mainViewController, animated: true)
            }
            .store(in: &cancellables)
    }
    
}
