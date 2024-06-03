//
//  SettingsTableViewController.swift
//  SettingTableView
//
//  Created by Jisoo Ham on 5/23/24.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    let tryData: [String] = [
        "공지사항","실험실","버전정보","개인/보안","알림","채팅","멀티프로필","고객센터/도움말"
    ]
    // "전체 설정" "개인 설정" "기타"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "설정"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
//        view.backgroundColor = .black
//        tableView.backgroundColor = .black
    }
    
    override func tableView(
        _ tableView: UITableView
        , numberOfRowsInSection section: Int
    ) -> Int {
        return tryData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell")!
        
        cell.backgroundColor = .black
        cell.textLabel?.text = tryData[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = .systemFont(ofSize: 13, weight: .light)
        
        return cell
    }
    
    override func tableView(
        _ tableView: UITableView
        , heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        return 60
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(
        _ tableView: UITableView,
        titleForHeaderInSection section: Int
    ) -> String? {
        if section == 0 {
            return "전체 설정"
        } else if section == 1 {
            return "즐겨찾기"
        } else if section == 2 {
            return "기타"
        } else {
            return "섹션"
        }
    }
    
    
}
