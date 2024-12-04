//
//  MessangerView.swift
//  ChatErrorNill
//
//  Created by Abubakar Bibulatov on 22.07.2024.
//

import UIKit
import MessageKit
import InputBarAccessoryView

protocol MessangerViewProtocol: AnyObject {
    func reloadCollection()
}

class MessangerView: MessagesViewController, MessangerViewProtocol {
    var presenter: MessengerPresenterProtocol!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = presenter.title
        showMessageTimestampOnSwipeLeft = true
        setupMessenger()
        
     
    }
    
    override func viewDidAppear(_ animated: Bool) {
        messagesCollectionView.scrollToLastItem(animated: true)
    }
    
    private func setupMessenger() {
        messagesCollectionView.messagesDisplayDelegate = self
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.reloadDataAndKeepOffset()
        messageInputBar.delegate = self
    }
    
    func reloadCollection() {
        messagesCollectionView.reloadDataAndKeepOffset()
    }
}

extension MessangerView: MessagesDataSource {
    var currentSender: SenderType {
        presenter.selfSender
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessageKit.MessagesCollectionView) -> MessageType {
        presenter.messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessageKit.MessagesCollectionView) -> Int {
        presenter.messages.count
    }
    
    private func insertMessage(_ message: Message) {
        presenter.messages.append(message)
        messagesCollectionView.performBatchUpdates ({
            messagesCollectionView.insertSections([presenter.messages.count - 1])
            if presenter.messages.count >= 2 {
                messagesCollectionView.reloadSections([presenter.messages.count - 2])
            }
        }, completion: { [ weak self ] _ in
            self?.messagesCollectionView.scrollToLastItem(animated: true)
        })
    }
}

extension MessangerView: MessagesDisplayDelegate, MessagesLayoutDelegate {
//    func headerViewSize(for section: Int, in messagesCollectionView: MessagesCollectionView) -> CGSize {
//        CGSize(width: 50, height: 50)
//    }
    
    func cellTopLabelHeight(for message: any MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        20
    }
    
//    func cellTopLabelAttributedText(for message: any MessageType, at indexPath: IndexPath) -> NSAttributedString? {
//        let name = message.sender.displayName
//        return NSAttributedString(string: name, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.blue])
//    }
    
    func messageTopLabelHeight(for message: any MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        20
    }
    
    
    
    func messageTopLabelAttributedText(for message: any MessageType, at indexPath: IndexPath) -> NSAttributedString? {
        let name = message.sender.displayName
        return NSAttributedString(string: name, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.blue])
    }
    
    func messageBottomLabelHeight(for message: any MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        40
    }
    
    func messageBottomLabelAttributedText(for message: any MessageType, at indexPath: IndexPath) -> NSAttributedString? {
        let name = message.sentDate.formatted()
        return NSAttributedString(string: name, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.blue])
    }
    
    func backgroundColor(for message: any MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
        message.sender.senderId == presenter.selfSender.senderId ? .black : .gray
    }
    
    
    func configureAvatarView(_ avatarView: AvatarView, for message: any MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) {
        avatarView.initials = String(message.sender.displayName.first ?? "0")
        avatarView.backgroundColor = .blue
    }
}

extension MessangerView: InputBarAccessoryViewDelegate {
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        let message: Message = Message(sender: presenter.selfSender, messageId: UUID().uuidString, sentDate: Date(), kind: .text(text))
        
        self.presenter.sendMessage(message: message)
        self.insertMessage(message)
        inputBar.inputTextView.text = ""
    }
    
    
}
