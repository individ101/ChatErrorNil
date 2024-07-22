//
//  UserListViewPresenter.swift
//  ChatErrorNill
//
//  Created by Abubakar Bibulatov on 19.07.2024.
//

import UIKit
protocol UserListViewPresenterProtocol: AnyObject {
//    init(view: UserListViewProtocol)
    var users: [ChatUser] { get set }
}

class UserListViewPresenter: UserListViewPresenterProtocol {
    var users: [ChatUser]
    
    weak var view: UserListViewProtocol?
    
    required init(view: UserListViewProtocol) {
        self.view = view
        self.users = ChatUser.mockData()
    }
}
