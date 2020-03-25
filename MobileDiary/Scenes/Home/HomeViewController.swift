//
//  HomeViewController.swift
//  MobileDiary
//
//  Created by Siqueira on 25/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    // MARK: - Attributes
    private var viewModel: HomeViewModelProtocol

    // MARK: - Initializer
    init(viewModel: HomeViewModelProtocol) {
        self.viewModel = viewModel

        super.init(nibName: "HomeViewController", bundle: Bundle.main)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
