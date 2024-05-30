//
//  TravelMagazineTableViewController.swift
//  TravelMagazineUIKit
//
//  Created by Jisoo Ham on 5/26/24.
//

import UIKit

import Kingfisher

class TravelMagazineTableViewController: UITableViewController {

    let magazineInfo = MagazineInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 410
        configureBaseView("Travel")
    }
    
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return magazineInfo.magazine.count
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyMMdd"
        
        let changedDateFormatter = DateFormatter()
        changedDateFormatter.dateFormat = "yy년 MM월 dd일"
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: TravelMagazineTableViewCell.identifier,
            for: indexPath
        ) as? TravelMagazineTableViewCell
        else { return UITableViewCell() }
        
        cell.configureLabel(
            label: cell.titleLabel,
            text: magazineInfo.magazine[indexPath.row].title
        )
        
        cell.configureLabel(
            label: cell.subtitleLabel,
            text: magazineInfo.magazine[indexPath.row].subtitle
        )
        
        cell.configureLabel(
            label: cell.dateLabel,
            text: magazineInfo.magazine[indexPath.row].dateStr
        )
        

        let url = URL(string: magazineInfo.magazine[indexPath.row].photo_image)
        cell.travelImageView.kf.setImage(with: url)
        cell.travelImageView.contentMode = .scaleAspectFill
        cell.travelImageView.layer.cornerRadius = 10
        
        return cell
    }
    
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        print("??")
        print("🩶" + magazineInfo.magazine[indexPath.row].dateStr)
    }
    

}
