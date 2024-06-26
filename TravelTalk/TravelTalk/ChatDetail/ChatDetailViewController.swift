//
//  ChatDetailViewController.swift
//  TravelTalk
//
//  Created by Jisoo HAM on 6/1/24.
//

import UIKit

/*
 MARK: cell에 날짜 구분하는 라벨, 뷰가 있고 데이터 비교를 통해서 clear 처리
 컴포넌트를 clear color로 줘서 눈속임 ..
 */
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
        configureNavigationBar()
        hideKeyboard()
        
        guard let chatting else { return }
        realtimeChat = chatting
        
        configureTableView()
        configureTextSendView()
    }
    func configureNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "chevron.backward"),
            style: .plain,
            target: self,
            action: #selector(backBtnTapped)
        )
        navigationItem.leftBarButtonItem?.tintColor = UIColor.darkGray
        
        guard let chatroomName else { return }
        navigationItem.title = chatroomName
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
    @objc func backBtnTapped() {
        navigationController?.popViewController(animated: true)
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
        // while
        
        
        
        if realtimeChat[indexPath.row].user == .user {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: ChatDetailFromTableViewCell.identifier,
                for: indexPath
            ) as? ChatDetailFromTableViewCell
            else { return UITableViewCell() }
            
            cell.configureCell(msg: realtimeChat[indexPath.row])
            
            if realtimeChat.startIndex != indexPath.row {
                let result2 = realtimeChat[indexPath.row].changedDate.dateCompare(fromDate: realtimeChat[indexPath.row - 1].changedDate)
                
                cell.configureHideDate(hide: result2)
            }
            
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: ChatDetailToTableViewCell.identifier,
                for: indexPath
            ) as? ChatDetailToTableViewCell
            else { return UITableViewCell() }
            
            cell.configureCell(msg: realtimeChat[indexPath.row])
            
            if realtimeChat.startIndex != indexPath.row {
                let result2 = realtimeChat[indexPath.row].changedDate.dateCompare(fromDate: realtimeChat[indexPath.row - 1].changedDate)
                cell.configureHideDate(hide: result2)
            }
            
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
