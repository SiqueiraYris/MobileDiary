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
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var entriesTableView: UITableView! {
        didSet {
            setupTableView()
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
        setupBinds()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        viewModel.fetchDiaries()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
    }

    // MARK: - Functions
    private func setupUI() {
        title = "Diary"

        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAddEntry))
        navigationItem.rightBarButtonItem = add
        navigationItem.rightBarButtonItem?.isEnabled = false
    }
    
    private func setupBinds() {
        viewModel.diaries.bind { [weak self] _ in
            self?.entriesTableView.reloadData()
        }
    }

    private func setBiometry() {
        viewModel.setBiometry { [weak self] status in
            guard let self = self, let status = status else { return }
            if status {
                DispatchQueue.main.async {
                    self.entriesTableView.isHidden = false
                    self.loginButton.isHidden = true
                    self.navigationItem.rightBarButtonItem?.isEnabled = true
                }
            }
        }
    }

    private func setupTableView() {
        entriesTableView.dataSource = self
        entriesTableView.delegate = self

        entriesTableView.isHidden = true

        entriesTableView.register(UINib(nibName: DiaryTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DiaryTableViewCell.identifier)
    }

    // MARK: - Actions
    @objc private func didTapAddEntry() {
        viewModel.tapAddEntry()
    }

    @IBAction private func didTapLoginButton(_ sender: UIButton) {
        setBiometry()
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: DiaryTableViewCell.identifier, for: indexPath) as? DiaryTableViewCell {
            let cellViewModel = DiaryCellViewModel(with: viewModel.diaries.value[indexPath.row])
            cell.selectionStyle = .none
            cell.setup(with: cellViewModel)

            return cell
        } else {
            return UITableViewCell()
        }
    }
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        112
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectItemAt(indexPath: indexPath)
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        UIView()
    }
}
