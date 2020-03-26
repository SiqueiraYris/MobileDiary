//
//  Diary.swift
//  MobileDiary
//
//  Created by Siqueira on 26/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import Foundation

// MARK: - Diary
struct Diary: Codable {
    let title: String?
    let date: String
    let text: String
}
