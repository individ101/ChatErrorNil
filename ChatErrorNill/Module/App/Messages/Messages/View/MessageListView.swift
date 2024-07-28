//
//  MessageListView.swift
//  ChatErrorNill
//
//  Created by Abubakar Bibulatov on 19.07.2024.
//

import UIKit

protocol MessageListViewProtocol: AnyObject {
    func reloadTableView()
}

class MessageListView: UIViewController, MessageListViewProtocol {
    var presenter: MessageListPresenter!
    lazy var tableview: UITableView = {
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "cell2")
        $0.delegate = self
        $0.dataSource = self
        return $0
    }(UITableView(frame: view.bounds, style: .insetGrouped))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(tableview)
        hidesBottomBarWhenPushed = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        hidesBottomBarWhenPushed = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        hidesBottomBarWhenPushed = false
    }
    
    func reloadTableView() {
        tableview.reloadData()
    }
}

extension MessageListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
        let chatItems = presenter.chatList[indexPath.row]
        
        var config = cell.defaultContentConfiguration()
        config.text = chatItems.name
        config.image = UIImage(systemName: "person.circle.fill")
        config.secondaryText = chatItems.lastMessage?.truncate(to: 80, ellipsis: false)
        cell.contentConfiguration = config
        
        return cell
    }
    
    
}

extension MessageListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let chatItem = presenter.chatList[indexPath.row]
        
        let messagesController = Builder.getMessangerView(chatItem: chatItem)
        
        navigationController?.pushViewController(messagesController, animated: true)
    }
}
