//
//  AppInfoViewModel.swift
//  VeganVision
//
//  Created by Ben Gabay on 12/9/22.
//

import UIKit
import Combine

class AppInfoViewModel: ObservableObject {

    var backAction = PassthroughSubject<Void, Never>()
    var addEntryAction = PassthroughSubject<String, Never>()
    var resetEntriesAction = PassthroughSubject<Void, Never>()
    var deleteEntryAction = PassthroughSubject<String, Never>()
    
    private let veganRepository: VeganListRepository
    private var cancellables = [AnyCancellable]()
    
    init(veganListRepository: VeganListRepository = VeganListRepository()) {
        self.veganRepository = veganListRepository
        setupObservables()
    }
    
    private func setupObservables() {
        addEntryAction
            .sink { [weak self] newIngredient in
                guard let self = self else { return }
                self.veganRepository.addEntry(entry: newIngredient)
            }
            .store(in: &cancellables)
        deleteEntryAction
            .sink { [weak self] deadIngredient in
                guard let self = self else { return }
                self.veganRepository.removeEntry(entry: deadIngredient)
            }
            .store(in: &cancellables)
        resetEntriesAction
            .sink { [weak self] in
                guard let self = self else { return }
                self.veganRepository.resetEntries()
            }
            .store(in: &cancellables)
    }
}
