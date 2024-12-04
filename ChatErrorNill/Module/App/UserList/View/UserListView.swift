//
//  UserListView.swift
//  ChatErrorNill
//
//  Created by Abubakar Bibulatov on 19.07.2024.
//

import UIKit
protocol UserListViewProtocol: AnyObject {
    func reloadTable()
}

class UserListView: UIViewController, UserListViewProtocol {
    var presenter: UserListViewPresenter!
    
    lazy var tableView: UITableView = {
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        $0.dataSource = self
        $0.delegate = self
        return $0
    }(UITableView(frame: view.bounds, style: .insetGrouped))
    
    lazy var signOutButton: UIBarButtonItem = UIBarButtonItem(image: .actions, style: .done, target: self, action: #selector(signOut))
   

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = .localize("userList")
        view.addSubview(tableView)
        navigationItem.rightBarButtonItem = signOutButton
    }
    
    @objc func signOut() {
        FirebaseManager.shared.signOut()
    }
    
    func reloadTable() {
        tableView.reloadData()
    }
}

extension UserListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(presenter.users[indexPath.row].id)
        
        let chatItem = ChatItem(convoId: nil, name: presenter.users[indexPath.row].name, otherUserId: presenter.users[indexPath.row].id, date: Date(), lastMessage: nil )
        
        let message = Builder.getMessangerView(chatItem: chatItem)
        
        navigationController?.pushViewController(message, animated: true)
    }
}

extension UserListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let cellItems = presenter.users[indexPath.row]
        var config = cell.defaultContentConfiguration()
        config.text = cellItems.name
        config.image = UIImage(systemName: "person.circle.fill")
        cell.contentConfiguration = config
        
        return cell
    }
    
    
}
