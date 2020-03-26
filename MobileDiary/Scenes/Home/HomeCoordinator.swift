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
    private var presenter: UINavigationController?

    // MARK: - Initializer
    init(presenter: UINavigationController?) {
        self.presenter = presenter
    }

    // MARK: - Life Cycle
    func start() {
        let viewModel = HomeViewModel(coordinator: self)
        let viewController = HomeViewController(viewModel: viewModel)

        presenter?.pushViewController(viewController, animated: true)
    }

    // MARK: - Navigations
    func tapAddEntry() {
        let newEntryCoordinator = NewEntryCoordinator(presenter: presenter)
        newEntryCoordinator.start()
    }

    func showDiaryDetail(diary: Diary) {
        let diaryDetailCoordinator = DiaryDetailCoordinator(presenter: presenter, diary: diary)
        diaryDetailCoordinator.start()
    }
}
