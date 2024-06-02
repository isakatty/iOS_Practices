//
//  CityDetailViewController.swift
//  TravelMagazineUIKit
//
//  Created by Jisoo HAM on 5/27/24.
//

import UIKit

class CityDetailViewController: UIViewController {
    let list = TravelInfo().travel
    var result = [Travel]()
    
    @IBOutlet var cityTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        result = list
        
        configureTableView()
        configureBaseView("도시 유명 여행지")
    }
    
    func configureTableView() {
        cityTableView.delegate = self
        cityTableView.dataSource = self
        cityTableView.rowHeight = 140
        cityTableView.register(
            UINib(nibName: AdTableViewCell.identifier, bundle: nil),
            forCellReuseIdentifier: AdTableViewCell.identifier
        )
        cityTableView.register(
            UINib(nibName: CityDetailTableViewCell.identifier, bundle: nil),
            forCellReuseIdentifier: CityDetailTableViewCell.identifier
        )
    }
    
    @objc func favBtnTapped(sender: UIButton) {
        result[sender.tag].like = !result[sender.tag].like!
        cityTableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .automatic)
    }
}

extension CityDetailViewController: UITableViewDelegate, UITableViewDataSource {
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
            cell.configureBgColor()
            
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
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        let travelData = result[indexPath.row]
        
        if travelData.ad {
            let sb = UIStoryboard(name: "CityDetail", bundle: nil)
            
            guard let vc = sb.instantiateViewController(
                withIdentifier: AdvertisementViewController.identifier
            ) as? AdvertisementViewController else { return }
            
            vc.data = travelData
            
            let navi = UINavigationController(rootViewController: vc)
            navi.modalPresentationStyle = .fullScreen
            present(navi, animated: true)
        } else {
            let sb = UIStoryboard(name: "CityDetail", bundle: nil)
            guard let vc = sb.instantiateViewController(
                withIdentifier: TouristSpotViewController.identifier
            ) as? TouristSpotViewController else { return }
            
            vc.data = travelData
            
            navigationController?.pushViewController(vc, animated: true)
        }
        
        // cell 선택시 cell 하이라이트 되돌리기 위함.
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
