//
//  CityDetailViewController.swift
//  TravelMagazineUIKit
//
//  Created by Jisoo HAM on 5/27/24.
//

import UIKit

class CityDetailViewController
: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var list = TravelInfo().travel
    
    @IBOutlet var cityTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityTableView.delegate = self
        cityTableView.dataSource = self
        
        cityTableView.register(
            UINib(nibName: "AdTableViewCell", bundle: nil),
            forCellReuseIdentifier: "AdTableViewCell"
        )
        cityTableView.register(
            UINib(nibName: "CityDetailTableViewCell", bundle: nil),
            forCellReuseIdentifier: "CityDetailTableViewCell"
        )
        
        cityTableView.rowHeight = 180
    }
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return list.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        
        // [indexPath.row].ad 가 true면 adCell, false면 basicCell
        // Cell마다 property가 다른데 ?
        
        if list[indexPath.row].ad {
            guard let cell = cityTableView.dequeueReusableCell(
                withIdentifier: "AdTableViewCell",
                for: indexPath
            ) as? AdTableViewCell
            else { return UITableViewCell() }
            
            cell.configureData(data: list[indexPath.row])
            
            return cell
        } else {
            guard let cell = cityTableView.dequeueReusableCell(
                withIdentifier: "CityDetailTableViewCell",
                for: indexPath
            ) as? CityDetailTableViewCell
            else { return UITableViewCell() }
            
            cell.configureData(data: list[indexPath.row])
            
            return cell
        }
        
    }

}
