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
    let offendingWordsText: String
    
    init(offendingWords: [String]) {
        self.offendingWords = offendingWords
        let ingredientsText = offendingWords.count == 1 ? "ingredient" : "ingredients"
        self.offendingWordsText = "\(offendingWords.count) non vegan \(ingredientsText)"
    }
}
