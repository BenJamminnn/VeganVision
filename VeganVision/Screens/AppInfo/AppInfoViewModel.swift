//
//  AppInfoViewModel.swift
//  VeganVision
//
//  Created by Ben Gabay on 12/9/22.
//

import UIKit
import Combine

enum ListError: Error {
    case emptyStringAddedError
    case alreadyAvailableError(ingredient: String)
    
    var description: String {
        switch self {
        case .emptyStringAddedError:
            return "Empty Entry not allowed"
        case .alreadyAvailableError(let ingredient):
            return "\(ingredient) is already available in this list!"
        }
    }
}

class AppInfoViewModel: ObservableObject {

    var backAction = PassthroughSubject<Void, Never>()
    var addEntryAction = PassthroughSubject<String, Never>()
    var resetEntriesAction = PassthroughSubject<Void, Never>()
    var deleteEntryAction = PassthroughSubject<String, Never>()
    
    private let veganRepository: VeganListRepository
    private var cancellables = [AnyCancellable]()
    
    @Published var currentNonVeganList: [String]
    @Published var error: ListError?
    
    init(veganListRepository: VeganListRepository = VeganListRepository()) {
        self.veganRepository = veganListRepository
        self.currentNonVeganList = veganRepository.currentEntries()
        setupObservables()
    }
    
    private func setupObservables() {
        addEntryAction
            .receive(on: RunLoop.main)
            .sink { [weak self] newIngredient in
                guard let self = self else { return }
                if newIngredient.isEmpty {
                    self.error = ListError.emptyStringAddedError
                    return
                } else if self.currentNonVeganList.contains(newIngredient) {
                    self.error = ListError.alreadyAvailableError(ingredient: newIngredient)
                    return
                }
                self.error = nil
                self.veganRepository.addEntry(entry: newIngredient)
                self.currentNonVeganList = self.veganRepository.currentEntries().sorted()
            }
            .store(in: &cancellables)
        deleteEntryAction
            .receive(on: RunLoop.main)
            .sink { [weak self] deadIngredient in
                guard let self = self else { return }
                self.veganRepository.removeEntry(entry: deadIngredient)
                self.currentNonVeganList = self.veganRepository.currentEntries().sorted()
            }
            .store(in: &cancellables)
        resetEntriesAction
            .receive(on: RunLoop.main)
            .sink { [weak self] in
                guard let self = self else { return }
                self.veganRepository.resetEntries()
                self.currentNonVeganList = self.veganRepository.currentEntries().sorted()
            }
            .store(in: &cancellables)
    }
}
