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
    var navigationController: UINavigationController?

    // MARK: - Initializer
    init(presenter: UINavigationController?) {
        navigationController = presenter
    }

    // MARK: - Life Cycle
    func start() {
        let viewModel = NewEntryViewModel(coordinator: self)
        let viewController = NewEntryViewController(viewModel: viewModel)

        navigationController?.pushViewController(viewController, animated: true)
    }

    // MARK: - Navigations
    func closeNewEntry() {
        navigationController?.popViewController(animated: true)
    }
}
