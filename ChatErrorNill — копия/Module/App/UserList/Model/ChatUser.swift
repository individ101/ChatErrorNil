//
//  User.swift
//  ChatErrorNill
//
//  Created by Abubakar Bibulatov on 19.07.2024.
//

import UIKit

struct ChatUser {
    var id: String
    var name: String
    
    static func mockData() -> [ChatUser] {
        [
            ChatUser(id: UUID().uuidString, name: "User1"),
            ChatUser(id: UUID().uuidString, name: "User2"),
            ChatUser(id: UUID().uuidString, name: "User3"),
            ChatUser(id: UUID().uuidString, name: "User4"),
            ChatUser(id: UUID().uuidString, name: "User5"),
            ChatUser(id: UUID().uuidString, name: "User6"),
        ]
    }
}
