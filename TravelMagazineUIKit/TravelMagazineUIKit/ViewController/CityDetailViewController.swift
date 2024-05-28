//
//  CityDetailViewController.swift
//  TravelMagazineUIKit
//
//  Created by Jisoo HAM on 5/27/24.
//

import UIKit

class CityDetailViewController
: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let list = TravelInfo().travel
    var result = [Travel]()
    
    @IBOutlet var cityTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        result = list
        
        cityTableView.rowHeight = 140
        cityTableView.delegate = self
        cityTableView.dataSource = self
        cityTableView.register(
            UINib(nibName: AdTableViewCell.identifier, bundle: nil),
            forCellReuseIdentifier: AdTableViewCell.identifier
        )
        cityTableView.register(
            UINib(nibName: CityDetailTableViewCell.identifier, bundle: nil),
            forCellReuseIdentifier: CityDetailTableViewCell.identifier
        )
    }
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return result.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        if result[indexPath.row].ad {
            guard let cell = cityTableView.dequeueReusableCell(
                withIdentifier: AdTableViewCell.identifier,
                for: indexPath
            ) as? AdTableViewCell
            else { return UITableViewCell() }
            
            cell.configureData(data: result[indexPath.row])
            
            let randomInt = Int.random(in: 0...7)
            cell.backgroundColor = cell.color[randomInt]
            cell.alpha = 0.6
            
            return cell
        } else {
            guard let cell = cityTableView.dequeueReusableCell(
                withIdentifier: CityDetailTableViewCell.identifier,
                for: indexPath
            ) as? CityDetailTableViewCell
            else { return UITableViewCell() }
            
            cell.configureUI()
            cell.configureData(data: result[indexPath.row], tag: indexPath.row)
            
            cell.favBtn.addTarget(
                self,
                action: #selector(favBtnTapped),
                for: .touchUpInside
            )
            return cell
        }
        
    }
    
    @objc func favBtnTapped(sender: UIButton) {
        result[sender.tag].like = !result[sender.tag].like!
        cityTableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .automatic)
    }
}
