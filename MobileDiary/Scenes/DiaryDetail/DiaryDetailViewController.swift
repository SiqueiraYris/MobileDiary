//
//  DiaryDetailViewController.swift
//  MobileDiary
//
//  Created by Siqueira on 26/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import UIKit

final class DiaryDetailViewController: UIViewController {
    @IBOutlet private weak var diaryTitle: UILabel!
    @IBOutlet private weak var diaryText: UITextView!
    @IBOutlet private weak var diaryDate: UILabel!

    // MARK: - Attributes
    private var viewModel: DiaryDetailViewModelProtocol

    // MARK: - Initializer
    init(viewModel: DiaryDetailViewModelProtocol) {
        self.viewModel = viewModel

        super.init(nibName: "DiaryDetailViewController", bundle: .main)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupBinds()
    }

    private func setupUI() {
        title = "Diary"
    }

    private func setupBinds() {
        diaryTitle.text = viewModel.getDiaryTitle()
        diaryDate.text  = viewModel.getDiaryDate()
        diaryText.text = viewModel.getDiaryText()
    }
}
