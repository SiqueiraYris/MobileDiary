//
//  DiaryCellViewModel.swift
//  MobileDiary
//
//  Created by Siqueira on 25/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import Foundation

// MARK: - DiaryCellViewModelProtocol
protocol DiaryCellViewModelProtocol {
    func getDiaryTitle() -> String
    func getDiaryDate() -> String
    func getDiaryText() -> String
}

final class DiaryCellViewModel: DiaryCellViewModelProtocol {
    // MARK: - Attributes
    let diary: Diary

    // MARK: - Initializer
    init(with diary: Diary) {
        self.diary = diary
    }

    // MARK: - Functions
    func getDiaryTitle() -> String {
        if let diaryTitle = diary.title, !diaryTitle.isEmpty {
            return diaryTitle
        } else {
            return String.localized(by: "Untitled")
        }
    }

    func getDiaryDate() -> String {
        diary.date
    }

    func getDiaryText() -> String {
        if !diary.text.isEmpty {
            return diary.text
        } else {
            return String.localized(by: "NoText")
        }
    }
}
