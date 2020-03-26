//
//  DiaryTableViewCell.swift
//  MobileDiary
//
//  Created by Siqueira on 25/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import UIKit

final class DiaryTableViewCell: UITableViewCell {
    // MARK: - IBOutlets
    @IBOutlet private weak var diaryTitle: UILabel!
    @IBOutlet private weak var diaryText: UILabel!
    @IBOutlet private weak var diaryDate: UILabel!
    
    // MARK: - Attributes
    static let identifier = "DiaryTableViewCell"

    // MARK: - Functions
    func setup(with viewModel: DiaryCellViewModelProtocol) {
        diaryTitle.text = viewModel.getDiaryTitle()
        diaryText.text = viewModel.getDiaryText()
        diaryDate.text = viewModel.getDiaryDate()
    }
}
