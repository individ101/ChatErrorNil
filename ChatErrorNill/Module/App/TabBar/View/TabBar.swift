//
//  TabBar.swift
//  ChatErrorNill
//
//  Created by Abubakar Bibulatov on 19.07.2024.
//

import UIKit

protocol TabBarViewProtocol: AnyObject {
    func setControllers(views: [UIViewController])
}

class TabBarView: UITabBarController, TabBarViewProtocol{
    var presenter: TabBarPresenter!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
    }
    func setControllers(views: [UIViewController]) {
        setViewControllers(views, animated: true)
        
    }
}
