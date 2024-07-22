//
//  String+Extensions.swift
//  ChatErrorNill
//
//  Created by Abubakar Bibulatov on 18.07.2024.
//

import Foundation

extension String {
    static func localize(_ text: String.LocalizationValue) -> String {
        String(localized: text)
    }
}

extension String {
    static let state = "state"
}
