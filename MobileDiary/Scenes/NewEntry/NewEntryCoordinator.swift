//
//  NewEntryCoordinator.swift
//  MobileDiary
//
//  Created by Siqueira on 25/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import UIKit

final class NewEntryCoordinator: Coordinator {
    // MARK: - Attributes
    var presenter: UINavigationController?

    // MARK: - Initializer
    init(presenter: UINavigationController?) {
        self.presenter = presenter
    }

    // MARK: - Life Cycle
    func start() {
        let viewModel = NewEntryViewModel(coordinator: self)
        let viewController = NewEntryViewController(viewModel: viewModel)

        presenter?.pushViewController(viewController, animated: true)
    }

    // MARK: - Navigations
    func closeNewEntry() {
        presenter?.popViewController(animated: true)
    }
}
