//
//  TravelTalkViewController.swift
//  TravelTalk
//
//  Created by Jisoo HAM on 6/1/24.
//

import UIKit

class TravelTalkViewController: UIViewController {

    let chatList = mockChatList
    @IBOutlet var chatListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
    }
    
    func configureTableView() {
        let xib = UINib(
            nibName: ChatListTableViewCell.identifier,
            bundle: nil
        )
        chatListTableView.register(
            xib,
            forCellReuseIdentifier: ChatListTableViewCell.identifier
        )
        
        chatListTableView.delegate = self
        chatListTableView.dataSource = self
        chatListTableView.rowHeight = 80
    }
}

extension TravelTalkViewController
: UITableViewDelegate, UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return chatList.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ChatListTableViewCell.identifier,
            for: indexPath
        ) as? ChatListTableViewCell
        else { return UITableViewCell() }
        
        cell.configureUI(chat: chatList[indexPath.row])
        
        return cell
    }
    
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        let sb = UIStoryboard(name: "ChatDetail", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: ChatDetailViewController.identifier) as? ChatDetailViewController else { return }
        
        vc.chatting = chatList[indexPath.row].chatList
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
