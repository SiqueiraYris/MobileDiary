//
//  NewEntryViewController.swift
//  MobileDiary
//
//  Created by Siqueira on 25/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import UIKit

final class NewEntryViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet private weak var titleTextField: UITextField! {
        didSet {
            titleTextField.placeholder = "Title"
        }
    }
    @IBOutlet private weak var textTextView: UITextView! {
        didSet {
            textTextView.layer.borderWidth = 1
            textTextView.layer.cornerRadius = 5.0
            textTextView.layer.borderColor = UIColor.lightGray.cgColor
        }
    }

    // MARK: - Attributes
    private var viewModel: NewEntryViewModelProtocol

    // MARK: - Initializer
    init(viewModel: NewEntryViewModelProtocol) {
        self.viewModel = viewModel

        super.init(nibName: "NewEntryViewController", bundle: .main)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    // MARK: - Functions
    private func setupUI() {
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didTapDoneEntry))
        navigationItem.rightBarButtonItem = done
    }

    // MARK: - Actions
    @objc private func didTapDoneEntry() {
        viewModel.addEntry(text: textTextView.text, title: titleTextField.text)
    }
}
