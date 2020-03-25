//
//  ApplicationCoordinator.swift
//  MobileDiary
//
//  Created by Siqueira on 25/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import UIKit

final class ApplicationCoordinator: Coordinator {
    // MARK: - Attributes
    private static var window: UIWindow? = {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
        return sceneDelegate?.window
    }()

    // MARK: - Life Cycle
    static func start() {
        startApp()
    }

    private static func startApp() {
       let navigation = UINavigationController()

        let homeCoordinator = HomeCoordinator(presenter: navigation)
        homeCoordinator.start()

        window?.rootViewController = navigation
    }
}
