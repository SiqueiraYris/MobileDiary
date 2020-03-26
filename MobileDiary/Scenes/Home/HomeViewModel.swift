//
//  HomeViewModel.swift
//  MobileDiary
//
//  Created by Siqueira on 25/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import Foundation

// MARK: - HomeViewModelProtocol
protocol HomeViewModelProtocol {
    func setBiometry(completion: @escaping(Bool?) -> Void)
    func tapAddEntry()
}

final class HomeViewModel: HomeViewModelProtocol {
    // MARK: - Attributes
    private var coordinator: HomeCoordinator?

    // MARK: - Initializer
    init(coordinator: HomeCoordinator? = nil) {
        self.coordinator = coordinator
    }

    // MARK: - Functions
    func setBiometry(completion: @escaping(Bool?) -> Void) {
        let biometry = BiometryAuthorization()
        biometry.authenticateUserUsingTouchId { status in
            completion(status)
        }
    }

    func tapAddEntry() {
        coordinator?.tapAddEntry()
    }
}
