//
//  EntryCellViewModel.swift
//  MobileDiary
//
//  Created by Siqueira on 25/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import Foundation

// MARK: - EntryCellViewModelProtocol
protocol EntryCellViewModelProtocol {
    var title: String? { get }
    var text: String { get }
    var date: String { get }
}

final class EntryCellViewModel: EntryCellViewModelProtocol {
    // MARK: - Attributes
    let title: String?
    let text: String
    let date: String

    // MARK: - Initializer
    init(with diary: Diary) {
        title = diary.title
        text = diary.text
        date = diary.date
    }
}
