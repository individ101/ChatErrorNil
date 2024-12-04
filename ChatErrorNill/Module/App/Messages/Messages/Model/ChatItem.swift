//
//  ChatItem.swift
//  ChatErrorNill
//
//  Created by Abubakar Bibulatov on 22.07.2024.
//

import UIKit
import Firebase

struct ChatItem {
    var convoId: String?
    var name: String
    var otherUserId: String
    var date: Date
    var lastMessage: String?
    
    init(convoId: String?, name: String, otherUserId: String, date: Date, lastMessage: String?) {
        self.name = name
        self.otherUserId = otherUserId
        self.date = date
        self.lastMessage = lastMessage
    }
    
    init(convoId: String, data: [String: Any]) {
        self.convoId = convoId
        self.name = data["name"] as? String ?? ""
        self.otherUserId = data["otherId"] as? String ?? ""
        self.date = {
            let timeStamp = data["date"] as? Timestamp
            return timeStamp?.dateValue() ?? Date()
        }()
        self.lastMessage = data["lastMessage"] as? String ?? ""
    }
}
