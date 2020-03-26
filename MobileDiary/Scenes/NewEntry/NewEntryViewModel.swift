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
        let diary = Diary(title: title, date: Date().getCurrentDate(), text: text)
        saveDiary(diary: diary)

        coordinator?.closeNewEntry()
    }

    private func saveDiary(diary: Diary) {
        var diaries: [Diary] = []
        if let data = UserDefaults.standard.data(forKey: UserDefaultsKey.diaries.rawValue) {
            do {
                let decoder = JSONDecoder()
                diaries = try decoder.decode([Diary].self, from: data)
                diaries.append(diary)
            } catch {
                print("Unable to Decode Note (\(error))")
            }
        }

        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(diaries)

            UserDefaults.standard.set(data, forKey: UserDefaultsKey.diaries.rawValue)
        } catch {
            print("Unable to Encode Note (\(error))")
        }
    }
}
