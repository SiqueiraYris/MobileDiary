//
//  HomeViewController.swift
//  MobileDiary
//
//  Created by Siqueira on 25/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet private weak var entriesTableView: UITableView! {
        didSet {
            entriesTableView.isHidden = true
        }
    }
    // MARK: - Attributes
    private var viewModel: HomeViewModelProtocol

    // MARK: - Initializer
    init(viewModel: HomeViewModelProtocol) {
        self.viewModel = viewModel

        super.init(nibName: "HomeViewController", bundle: .main)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setBiometry()
        setupUI()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
    }

    // MARK: - Functions
    private func setupUI() {
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAddEntry))
        navigationItem.rightBarButtonItem = add
        navigationItem.rightBarButtonItem?.isEnabled = false
    }

    private func setBiometry() {
        viewModel.setBiometry { [weak self] status in
            guard let self = self, let status = status else { return }
            if status {
                DispatchQueue.main.async {
                    self.entriesTableView.isHidden = false
                    self.navigationItem.rightBarButtonItem?.isEnabled = true
                }
            }
        }
    }

    // MARK: - Actions
    @objc private func didTapAddEntry() {
        viewModel.tapAddEntry()
    }
}
