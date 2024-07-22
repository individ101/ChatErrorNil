//
//  MessageListView.swift
//  ChatErrorNill
//
//  Created by Abubakar Bibulatov on 19.07.2024.
//

import UIKit

protocol MessageListViewProtocol: AnyObject {
    
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
    }
}

extension MessageListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
        let cellItems = presenter.users[indexPath.row]
        
        var config = cell.defaultContentConfiguration()
        config.text = cellItems.name
        config.image = UIImage(systemName: "person.circle.fill")
        
        cell.contentConfiguration = config
        
        return cell
    }
    
    
}

extension MessageListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       print(presenter.users[indexPath.row].id)
    }
}
