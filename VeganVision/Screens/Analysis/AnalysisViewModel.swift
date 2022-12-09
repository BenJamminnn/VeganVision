//
//  AnalysisViewModel.swift
//  VeganVision
//
//  Created by Ben Gabay on 11/19/22.
//

import UIKit
import Combine

class AnalysisViewModel: ObservableObject {

    let backAction = PassthroughSubject<Void, Never>()
    
    let offendingWords: [String]
    
    init(offendingWords: [String]) {
        self.offendingWords = offendingWords
    }
}
