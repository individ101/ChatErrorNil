//
//  MessageListManager.swift
//  ChatErrorNill
//
//  Created by Abubakar Bibulatov on 27.07.2024.
//

import UIKit
import Firebase

class MessageListManager {
    func getChatList(completion: @escaping ([ChatItem]) -> ()) {
        guard let uid = FirebaseManager.shared.getUser()?.uid else { return }
        
        Firestore.firestore()
            .collection(.users)
            .document(uid)
            .collection(.conversation)
            .order(by: "date", descending: true)
            .addSnapshotListener { snap, error in
                guard error == nil else { return }
                
                guard let docs = snap?.documents else { return }
                var chatItems: [ChatItem] = []
                
                docs.forEach {
                    let chatItem = ChatItem(convoId: $0.documentID, data: $0.data())
                    chatItems.append(chatItem)
                }
                completion(chatItems)
            }
    }
}
