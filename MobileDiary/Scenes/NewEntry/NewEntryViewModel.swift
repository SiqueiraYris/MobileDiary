//
//  NewEntryViewModel.swift
//  MobileDiary
//
//  Created by Siqueira on 25/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import Foundation

// MARK: - NewEntryViewModelProtocol
protocol NewEntryViewModelProtocol {
    func addEntry(text: String, title: String?)
}

final class NewEntryViewModel: NewEntryViewModelProtocol {
    // MARK: - Attributes
    private var coordinator: NewEntryCoordinator?

    // MARK: - Initializer
    init(coordinator: NewEntryCoordinator? = nil) {
        self.coordinator = coordinator
    }

    // MARK: - Functions
    func addEntry(text: String, title: String?) {
        // TODO: save in user defaults the structure with text, title and data
        coordinator?.closeNewEntry()
    }
}
