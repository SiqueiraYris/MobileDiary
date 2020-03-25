//
//  HomeCoordinator.swift
//  MobileDiary
//
//  Created by Siqueira on 25/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import UIKit

final class HomeCoordinator: Coordinator {
    // MARK: - Attributes
    var rootViewController: UINavigationController?

    // MARK: - Initializer
    init(presenter: UINavigationController?) {
        rootViewController = presenter
    }

    // MARK: - Life Cycle
    func start() {
        let viewModel = HomeViewModel(coordinator: self)
        let viewController = HomeViewController(viewModel: viewModel)
        rootViewController?.pushViewController(viewController, animated: true)
    }
}
    

