//
//  EntryTableViewCell.swift
//  MobileDiary
//
//  Created by Siqueira on 25/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import UIKit

final class EntryTableViewCell: UITableViewCell {
    // MARK: - IBOutlets
    @IBOutlet private weak var diaryTitle: UILabel!
    @IBOutlet private weak var diaryText: UILabel!
    @IBOutlet private weak var diaryDate: UILabel!
    
    // MARK: - Attributes
    static let identifier = "EntryTableViewCell"

    // MARK: - Functions
    func setup(with viewModel: EntryCellViewModelProtocol) {
        diaryTitle.text = viewModel.title
        diaryText.text = viewModel.text
        diaryDate.text = viewModel.date
    }
}
