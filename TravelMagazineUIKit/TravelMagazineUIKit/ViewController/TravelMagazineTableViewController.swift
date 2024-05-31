//
//  TravelMagazineTableViewController.swift
//  TravelMagazineUIKit
//
//  Created by Jisoo Ham on 5/26/24.
//

import UIKit

/// 첫번째 탭
class TravelMagazineTableViewController: UITableViewController {

    let magazineInfo = MagazineInfo().magazine
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 410
        configureBaseView("Travel")
    }
    
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return magazineInfo.count
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: TravelMagazineTableViewCell.identifier,
            for: indexPath
        ) as? TravelMagazineTableViewCell
        else { return UITableViewCell() }
        
        let magazineCellInfo = magazineInfo[indexPath.row]
        
        cell.configureCell(magazineInfo: magazineCellInfo)
        
        return cell
    }
}
