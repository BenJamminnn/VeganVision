//
//  VeganVisionApp.swift
//  VeganVision
//
//  Created by Ben Gabay on 11/19/22.
//

import SwiftUI

@main
struct VeganVisionApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            let viewModel = WelcomeViewModel()
            WelcomeView(viewModel: viewModel)
        }
    }
}
