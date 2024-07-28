//
//  MessageListPresenter.swift
//  ChatErrorNill
//
//  Created by Abubakar Bibulatov on 19.07.2024.
//

import UIKit

protocol MessageListPresenterProtocol: AnyObject {
    var chatList: [ChatItem] { get set }
}


class MessageListPresenter: MessageListPresenterProtocol {
    weak var view: MessageListViewProtocol?
    var chatList: [ChatItem]
    private let messageListManager = MessageListManager()
    
    init(view: MessageListViewProtocol?) {
        print("Iniir")
        
        self.view = view
        self.chatList = []
        getChatList()
    }
    
    func getChatList() {
        messageListManager.getChatList { [weak self] chatList in
            guard let self = self else { return }
            
            self.chatList = chatList
            self.view?.reloadTableView()
        }
    }
}
