//
//  Builder.swift
//  ChatErrorNill
//
//  Created by Abubakar Bibulatov on 18.07.2024.
//

import UIKit

class Builder {
    static func getAuthView() -> UIViewController {
        let view = AuthView()
        let presenter = AuthViewPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
    static func getRegView() -> UIViewController {
        let view = RegView()
        let presenter = RegViewPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
    static func getTabView() -> UIViewController {
        let view = TabBarView()
        let presenter = TabBarPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
    static func getUserListView() -> UIViewController {
        let view = UserListView()
        let presenter = UserListViewPresenter(view: view)
        view.presenter = presenter
        return UINavigationController(rootViewController: view)
    }
    
    static func getMessageListView() -> UIViewController {
        let view = MessageListView()
        let presenter = MessageListPresenter(view: view)
        view.presenter = presenter
        return UINavigationController(rootViewController: view)
    }
    
    static func getMessangerView(chatItem: ChatItem) -> UIViewController {
        let view = MessangerView()
        let presenter = MessengerPresenter(view: view, convoId: chatItem.convoId, otherId: chatItem.otherUserId, name: chatItem.name)
        view.presenter = presenter
        return view
    }
}
