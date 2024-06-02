//
//  ChatDetailViewController.swift
//  TravelTalk
//
//  Created by Jisoo HAM on 6/1/24.
//

import UIKit

class ChatDetailViewController: UIViewController {
    
    @IBOutlet var chatTableView: UITableView!
    @IBOutlet var bgView: UIView!
    @IBOutlet var textView: UITextView!
    @IBOutlet var sendBtn: UIButton!
    
    var chatting: [Chat]?
    var realtimeChat = [Chat]() {
        didSet {
            chatTableView.reloadData()
            chatting = realtimeChat
        }
    }
    var chatroomName: String?
    let placeholder: String = "메세지를 입력하세요"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let chatroomName else { return }
        navigationItem.title = chatroomName
        
        guard let chatting else { return }
        realtimeChat = chatting
        
        configureTableView()
        configureTextSendView()
        
//        if chatTableView.bounds.height > UIScreen().bounds.height {
//            let endIndex = IndexPath(
//                row: realtimeChat.count - 2,
//                section: 0
//            )
//            chatTableView.scrollToRow(at: endIndex, at: .bottom, animated: true)
//        }
    }
    
    func configureTableView() {
        chatTableView.delegate = self
        chatTableView.dataSource = self
        
        chatTableView.allowsSelection = false
        chatTableView.separatorStyle = .none
        
        
        let leftXib = UINib(
            nibName: ChatDetailToTableViewCell.identifier,
            bundle: nil
        )
        let rightXib = UINib(
            nibName: ChatDetailFromTableViewCell.identifier,
            bundle: nil
        )
        
        chatTableView.register(
            leftXib,
            forCellReuseIdentifier: ChatDetailToTableViewCell.identifier
        )
        chatTableView.register(
            rightXib,
            forCellReuseIdentifier: ChatDetailFromTableViewCell.identifier
        )
        
    }
    func configureTextSendView() {
        bgView.backgroundColor = .systemGray5
        bgView.layer.cornerRadius = 10
        
        sendBtn.setTitle("", for: .normal)
        sendBtn.setImage(UIImage(systemName: "paperplane"), for: .normal)
        sendBtn.tintColor = .systemGray4
        sendBtn.addTarget(
            self,
            action: #selector(sendBtnTapped),
            for: .touchUpInside
        )
        
        textView.backgroundColor = .systemGray5
        textView.text = placeholder
        textView.textColor = .lightGray
        
        textView.delegate = self
    }
    
    @objc func sendBtnTapped() {
        if !textView.text.isEmpty || textView.text == placeholder {
            let myChat = Chat(
                user: .user,
                date: "2024-06-13 06:14",
                message: textView.text
            )
            
            realtimeChat.append(myChat)
            textView.text = nil
        }
    }
    
}

extension ChatDetailViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = placeholder
            textView.textColor = .lightGray
        }
    }
}

extension ChatDetailViewController
: UITableViewDelegate, UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return realtimeChat.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        if realtimeChat[indexPath.row].user == .user {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: ChatDetailFromTableViewCell.identifier,
                for: indexPath
            ) as? ChatDetailFromTableViewCell
            else { return UITableViewCell() }
            
            cell.configureCell(msg: realtimeChat[indexPath.row])
            
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: ChatDetailToTableViewCell.identifier,
                for: indexPath
            ) as? ChatDetailToTableViewCell
            else { return UITableViewCell() }
            
            cell.configureCell(msg: realtimeChat[indexPath.row])
            
            return cell
        }
        
    }
    
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        return UITableView.automaticDimension
    }
}
