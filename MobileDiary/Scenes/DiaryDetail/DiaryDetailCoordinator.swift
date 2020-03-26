//
//  DiaryDetailCoordinator.swift
//  MobileDiary
//
//  Created by Siqueira on 25/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import UIKit

final class DiaryDetailCoordinator: Coordinator {
    // MARK: - Attributes
    private var presenter: UINavigationController?
    private var diary: Diary

    // MARK: - Initializer
    init(presenter: UINavigationController?, diary: Diary) {
        self.presenter = presenter
        self.diary = diary
    }

    // MARK: - Life Cycle
    func start() {
        let viewModel = DiaryDetailViewModel(coordinator: self, diary: diary)
        let viewController = DiaryDetailViewController(viewModel: viewModel)

        presenter?.pushViewController(viewController, animated: true)
    }
}
