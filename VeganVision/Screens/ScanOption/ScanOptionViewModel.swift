//
//  ScanOptionViewModel.swift
//  VeganVision
//
//  Created by Ben Gabay on 12/8/22.
//

import UIKit
import Combine

class ScanOptionViewModel: ObservableObject {

    let scanAction = PassthroughSubject<Void, Never>()
    let importAction = PassthroughSubject<Void, Never>()
    let appInfoAction = PassthroughSubject<Void, Never>()
}
