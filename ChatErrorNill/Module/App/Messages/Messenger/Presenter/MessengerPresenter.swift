//
//  MessengerPresenter.swift
//  ChatErrorNill
//
//  Created by Abubakar Bibulatov on 22.07.2024.
//

import UIKit
import MessageKit

protocol MessengerPresenterProtocol: AnyObject {
    var title: String { get set }
    var selfSender: Sender { get set }
    var messages: [Message] { get set }
    func sendMessage(message: Message)
}

class MessengerPresenter: MessengerPresenterProtocol {
    var messages: [Message]
    var title: String
    
    weak var view: MessangerViewProtocol?
    private var convoId: String?
    private var otherId: String
    private let sendMessageManager = MessageSendManager()
    private let getMessagemanager = GetMessageManager()
    
    var selfSender: Sender
    private lazy var otherSender = Sender(senderId: otherId, displayName: title)
    init(view: MessangerViewProtocol?, convoId: String?, otherId: String, name: String) {
        self.view = view
        self.convoId = convoId
        self.title = name
        self.otherId = otherId
        self.messages = []
        
        self.selfSender = Sender(senderId: (FirebaseManager.shared.getUser()?.uid)!, displayName: UserDefaults.standard.string(forKey: "selfName") ?? "")
        
        if convoId != nil {
            getMessages(convoId: convoId!)
           loadLastMessage(convoId: convoId!)
        }
    }
    
    func sendMessage(message: Message) {
        switch message.kind {
        case .text(let string):
            sendMessageManager.sendMessage(convoId: convoId, message: string, otherUser: otherSender) { [weak self] convoId in
                guard let self = self else { return }
                guard let convoId else { return }
                self.convoId = convoId
            }
        default:
            break
        }
    }
    
    func getMessages(convoId: String) {
        getMessagemanager.getAllMessage(convoId: convoId) { [weak self] message in
            guard let self = self else { return }
            
            self.messages = message
            self.view?.reloadCollection()
        }
    }
    
    private func loadLastMessage(convoId: String) {
        getMessagemanager.loadOneMessage(convoId: convoId) { [weak self] message in
            guard let self = self else { return }
            
            if message.sender.senderId != selfSender.senderId {
                self.messages.append(message)
                self.view?.reloadCollection()
            }
        }
    }
}


