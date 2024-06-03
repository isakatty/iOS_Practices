//
//  SettingTableViewController.swift
//  SettingTableView
//
//  Created by Jisoo Ham on 5/23/24.
//

import UIKit

enum SettingOptions: Int, CaseIterable {
    case total, personal, others
    
    var mainOptions: String {
        switch self {
        case .total:
            return "전체 설정"
        case .personal:
            return "개인 설정"
        case .others:
            return "기타"
        }
    }
    
    var subOptions: [String] {
        switch self {
        case .total:
            return ["공지사항", "실험실", "버전정보"]
        case .personal:
            return ["개인/보안", "알림", "채팅", "멀티 프로필"]
        case .others:
            return ["고객센터/도움말"]
        }
    }
}


class SettingTableViewController: UITableViewController {
    
//    let data: [Setting] = [
//        Setting(section: "전체 설정", row: ["공지사항", "실험실", "버전정보"]),
//        Setting(section: "개인 설정", row: ["개인/보안", "알림", "채팅", "멀티 프로필"]),
//        Setting(section: "기타", row: ["고객센터/도움말"])
//    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return SettingOptions.allCases.count
    }
    
    
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return SettingOptions.allCases[section].subOptions.count
    }
    
    override func tableView(
        _ tableView: UITableView
        , heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        return 120
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell")!
        
        cell.backgroundColor = .black
        cell.textLabel?.text =
        SettingOptions.allCases[indexPath.section].subOptions[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = .systemFont(ofSize: 13)
        
        return cell
    }
    
    override func tableView(
        _ tableView: UITableView,
        titleForHeaderInSection section: Int
    ) -> String? {
        
        let text = SettingOptions.allCases[section].mainOptions
        return text
    }
    
}

struct Setting {
    var section: String
    var row: [String]
}
