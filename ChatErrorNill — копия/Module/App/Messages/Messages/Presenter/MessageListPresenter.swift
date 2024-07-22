//
//  MessageListPresenter.swift
//  ChatErrorNill
//
//  Created by Abubakar Bibulatov on 19.07.2024.
//

import UIKit

protocol MessageListPresenterProtocol: AnyObject {
    var users: [ChatUser] { get set }
}


class MessageListPresenter: MessageListPresenterProtocol {
    weak var view: MessageListViewProtocol?
    var users: [ChatUser]
    
    init(view: MessageListViewProtocol?) {
        print("Iniir")
        print("Iniir")
        print("Iniir")
        print("Iniir")
        
        
        
        self.view = view
        self.users = ChatUser.mockData()
    }
}
