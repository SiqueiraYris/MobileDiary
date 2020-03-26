//
//  DiaryDetailViewModel.swift
//  MobileDiary
//
//  Created by Siqueira on 25/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import Foundation

// MARK: - DiaryDetailViewModelProtocol
protocol DiaryDetailViewModelProtocol {
    var diary: Diary { get }

    func getDiaryTitle() -> String
    func getDiaryDate() -> String
    func getDiaryText() -> String
}

final class DiaryDetailViewModel: DiaryDetailViewModelProtocol {
    // MARK: - Attributes
    private let coordinator: DiaryDetailCoordinator?
    var diary: Diary

    // MARK: - Initializer
    init(coordinator: DiaryDetailCoordinator? = nil, diary: Diary) {
        self.coordinator = coordinator
        self.diary = diary
    }

    func getDiaryTitle() -> String {
        if let diaryTitle = diary.title, !diaryTitle.isEmpty {
            return diaryTitle
        } else {
            return "Sem titulo"
        }
    }

    func getDiaryDate() -> String {
        diary.date
    }

    func getDiaryText() -> String {
        diary.text
    }
}
