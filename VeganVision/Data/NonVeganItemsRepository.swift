//
//  NonVeganItemsRepository.swift
//  VeganVision
//
//  Created by Ben Gabay on 12/9/22.
//

import Foundation

protocol VeganListRepositoryable {
    func addEntry(entry: String)
    func removeEntry(entry: String)
    func resetEntries()
    func currentEntries() -> [String]
}

// Since its just 1 list of ingredients, use user defaults instead of Core Data
class VeganListRepository: VeganListRepositoryable {

    private let listKey = "veganListKey"
    private let defaults = UserDefaults.standard

    func addEntry(entry: String) {
        guard entry.isEmpty else { return }
        var currentList = defaults.object(forKey: listKey) as? [String] ?? [String]()
        currentList.append(entry)
        defaults.set(currentList, forKey: listKey)
    }
    
    func removeEntry(entry: String) {
        guard entry.isEmpty else { return }
        var existingList = defaults.object(forKey: listKey) as? [String] ?? [String]()
        if !existingList.contains(entry) {
            // TODO: throw error
        }
        let editedList = existingList.filter { $0 != entry }
        defaults.set(editedList, forKey: listKey)
    }
    
    func resetEntries() {
        defaults.set(nonVeganIngredients, forKey: listKey)
    }
    
    func currentEntries() -> [String] {
        var currentEntries = defaults.object(forKey: listKey) as? [String] ?? [String]()
        if currentEntries.isEmpty {
            resetEntries()
            currentEntries = defaults.object(forKey: listKey) as? [String] ?? [String]()
        }
        return currentEntries
    }
}
