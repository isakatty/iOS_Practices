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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
    }
    
    func configureTableView() {
        chatTableView.delegate = self
        chatTableView.dataSource = self
        
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
}

extension ChatDetailViewController
: UITableViewDelegate, UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        guard let chatting else { return 0 }
        return chatting.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        // chatting의 user에 따라 cell 달라짐
        
        guard let chatting else { return UITableViewCell() }
        
        if chatting[indexPath.row].user == .user {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: ChatDetailFromTableViewCell.identifier,
                for: indexPath
            ) as? ChatDetailFromTableViewCell
            else { return UITableViewCell() }
            
            cell.configureCell(msg: chatting[indexPath.row])
            
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: ChatDetailToTableViewCell.identifier,
                for: indexPath
            ) as? ChatDetailToTableViewCell
            else { return UITableViewCell() }
            
            cell.configureCell(msg: chatting[indexPath.row])
            
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
