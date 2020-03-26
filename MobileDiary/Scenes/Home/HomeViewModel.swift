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
    var diaries: Dynamic<[Diary]> { get }

    func fetchDiaries()
    func setBiometry(completion: @escaping(Bool?) -> Void)
    func tapAddEntry()
    func numberOfRows() -> Int
    func didSelectItemAt(indexPath: IndexPath)
}

final class HomeViewModel: HomeViewModelProtocol {
    // MARK: - Attributes
    private var coordinator: HomeCoordinator?
    var diaries: Dynamic<[Diary]> = Dynamic([])

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

    func fetchDiaries() {
        if let data = UserDefaults.standard.data(forKey: UserDefaultsKey.diaries.rawValue) {
            do {
                let decoder = JSONDecoder()
                self.diaries.value = try decoder.decode([Diary].self, from: data).reversed()
            } catch {
                print("Unable to Decode Note (\(error))")
            }
        }
    }

    func tapAddEntry() {
        coordinator?.tapAddEntry()
    }

    func numberOfRows() -> Int {
        diaries.value.count
    }

    func didSelectItemAt(indexPath: IndexPath) {
        coordinator?.showDiaryDetail(diary: diaries.value[indexPath.row])
    }
}
