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
    private let userListManager = UserListManager()
    weak var view: UserListViewProtocol?
    var users: [ChatUser] = []
    
    required init(view: UserListViewProtocol) {
        self.view = view
        
        
        userListManager.getAllUsers { [weak self] user in
            guard let self = self else { return }
            self.users = user
            self.view?.reloadTable()
        }
    }
    
}
