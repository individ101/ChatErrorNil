//
//  TabBarPresenter.swift
//  ChatErrorNill
//
//  Created by Abubakar Bibulatov on 19.07.2024.
//

import UIKit

protocol TabBarPresenterProtocol: AnyObject {
    init(view: TabBarViewProtocol)
}

class TabBarPresenter: TabBarPresenterProtocol {
    weak var view: TabBarViewProtocol?
    
    required init(view: TabBarViewProtocol) {
        self.view = view
        setupControllers()
    }
    private func setupControllers() {
        let userList = Builder.getUserListView()
        userList.title = .localize("userList")
        userList.tabBarItem.image = UIImage(systemName: "house")
        
        let messageList = Builder.getMessageListView()
        messageList.title = .localize("messageList")
        messageList.tabBarItem.image = UIImage(systemName: "house")
        
        view?.setControllers(views: [userList, messageList])
    }
}
