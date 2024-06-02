//
//  TravelTalkViewController.swift
//  TravelTalk
//
//  Created by Jisoo HAM on 6/1/24.
//

import UIKit

class TravelTalkViewController: UIViewController {

    let chatList = mockChatList
    var filteredChatList = mockChatList {
        didSet {
            chatListTableView.reloadData()
        }
    }
    let placeholder = "채팅방을 검색해보세요"
    @IBOutlet var chatListTableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "TRAVEL TALK"
        
        configureTableView()
        configureSearchBar()
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
    func configureSearchBar() {
        searchBar.delegate = self
        searchBar.placeholder = placeholder
    }
    
    // MARK: '채팅 리스트 -> 검색 -> 채팅방 -> 채팅 리스트' flow로 돌아왔을 때, 필터링된 리스트로 유지되는게 좋은지, 전체 리스트를 보여주는게 좋을지 판단이 어려움. 당연하게 전체 리스트를 보여주는게 익숙한 플로우인가 ? 에 대한 의문 . .
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        filteredChatList = mockChatList
        searchBar.text = nil
    }
}

extension TravelTalkViewController: UISearchBarDelegate {
    /// search bar의 enter tap event
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        
        searchBar.resignFirstResponder()
        
        if text != "" {
            filteredChatList = filteredChatList.filter {
                $0.chatroomImage.contains { image in
                    image.lowercased() == text.lowercased()
                }
            }
            
        } else {
            // MARK: 1차 검색 -> 빈text enter일 때 전체 리스트로 돌아가고 싶음.
            filteredChatList = mockChatList
        }
        
    }
}

extension TravelTalkViewController
: UITableViewDelegate, UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return filteredChatList.count
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
        
        cell.configureUI(chat: filteredChatList[indexPath.row])
        
        return cell
    }
    
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        let sb = UIStoryboard(name: "ChatDetail", bundle: nil)
        guard let vc = sb.instantiateViewController(
            withIdentifier: ChatDetailViewController.identifier
        ) as? ChatDetailViewController else { return }
        
        vc.chatting = filteredChatList[indexPath.row].chatList
        vc.chatroomName = filteredChatList[indexPath.row].chatroomName
        
        navigationController?.pushViewController(vc, animated: true)
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
