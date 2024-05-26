//
//  SettingTableViewController.swift
//  SettingTableView
//
//  Created by Jisoo Ham on 5/23/24.
//

import UIKit

/*  
 MARK: section의 textColor 변경은 어디서 해야하지 ?
 
 데이터 구성 이런 형식으로 되면 안되는거였던건가 ?
 
 let tryData: [String] = [
     "전체 설정","공지사항","실험실","버전정보","개인 설정","개인/보안","알림","채팅","멀티프로필","기타","고객센터/도움말"
 ]
 
 조건문 통해서 최대한 UI 비슷하게 만든건 SettingsTableViewController
 */
class SettingTableViewController: UITableViewController {
    
    let data: [Setting] = [
        Setting(section: "전체 설정", row: ["공지사항", "실험실", "버전정보"]),
        Setting(section: "개인 설정", row: ["개인/보안", "알림", "채팅", "멀티 프로필"]),
        Setting(section: "기타", row: ["고객센터/도움말"])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableViewlBackground()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return data[section].row.count
    }
    
    override func tableView(
        _ tableView: UITableView
        , heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        return 60
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell")!
        
        cell.backgroundColor = .black
        cell.textLabel?.text = data[indexPath.section].row[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = .systemFont(ofSize: 13)
        
        return cell
    }
    
    override func tableView(
        _ tableView: UITableView,
        titleForHeaderInSection section: Int
    ) -> String? {
        
        let text = data[section].section
        return text
    }
    
    override func tableView(
        _ tableView: UITableView,
        titleForFooterInSection section: Int
    ) -> String? {
        return ""
    }
    
}

extension UITableViewController {
    func setTableViewlBackground() {
        view.backgroundColor = .black
        tableView.backgroundColor = .black
    }
}

struct Setting {
    var section: String
    var row: [String]
}
