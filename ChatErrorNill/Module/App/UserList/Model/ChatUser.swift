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
  
    init(uid: String, userInfo: [String: Any]) {
        self.id = uid
        self.name = userInfo["name"] as? String ?? ""
    }
}
