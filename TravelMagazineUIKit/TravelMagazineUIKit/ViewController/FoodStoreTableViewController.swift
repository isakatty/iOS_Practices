//
//  FoodStoreTableViewController.swift
//  TravelMagazineUIKit
//
//  Created by Jisoo Ham on 5/26/24.
//

import UIKit

class FoodStoreTableViewController: UITableViewController {
    
    let restaurant = RestaurantList()
    var favoriteList = [Restaurant]()
    var searchedList = [Restaurant]()
    var isSearching: Bool = false
    
    @IBOutlet var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 190
        configureUI()
        
    }
    
    @IBAction func tfEnterTapped(_ sender: UITextField) {
        guard let text = searchTextField.text else { return }
        
        if !text.isEmpty {
            isSearching = true
            
            searchedList = restaurant.restaurantArray.filter({ res in
                res.category.contains(text)
            })
            
            tableView.reloadData()
        }
    }
    
    func configureUI() {
        searchTextField.placeholder = "음식 카테고리로 검색해주세요 !"
        searchTextField.layer.borderColor = UIColor.black.cgColor
        searchTextField.layer.cornerRadius = 5
        searchTextField.layer.borderWidth = 3
    }
    
    
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return isSearching
        ? searchedList.count
        : restaurant.restaurantArray.count
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "FoodStoreTableViewCell",
            for: indexPath
        ) as? FoodStoreTableViewCell
        else { return UITableViewCell() }
        
        let data = isSearching
        ? searchedList
        : restaurant.restaurantArray
        
        let url = URL(string: data[indexPath.row].image)
        cell.storeImageView.kf.setImage(with: url)
        cell.storeImageView.contentMode = .scaleToFill
        cell.storeImageView.layer.cornerRadius = 10
        cell.storeImageView.layer.borderWidth = 3
        cell.storeImageView.layer.borderColor = UIColor.black.cgColor
        
        cell.configureLabel(
            label: cell.storeNameLabel,
            text: data[indexPath.row].name,
            textColor: .black,
            textAlignment: .left,
            fontSize: 17,
            fontWeight: .bold
        )
        cell.configureLabel(
            label: cell.storeAddressLabel,
            text: data[indexPath.row].address,
            textColor: .darkGray,
            textAlignment: .left,
            fontSize: 14,
            fontWeight: .regular
        )
        cell.configureLabel(
            label: cell.storeNumberLabel,
            text: data[indexPath.row].phoneNumber,
            textColor: .darkGray,
            textAlignment: .left,
            fontSize: 14,
            fontWeight: .regular
        )
        cell.configureLabel(
            label: cell.foodCategoryLabel,
            text: data[indexPath.row].category,
            textColor: .darkGray,
            textAlignment: .right,
            fontSize: 14,
            fontWeight: .regular
        )
        
        
        if favoriteList.firstIndex(where: { res in
            res.name == data[indexPath.row].name
        }) != nil {
            cell.favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            cell.favoriteButton.setImage(
                UIImage(systemName: "heart"), for: .normal)
        }
        
        cell.favoriteButton.setTitle(
            "",
            for: .normal
        )
        cell.favoriteButton.addTarget(
            self,
            action: #selector(favoriteBtnTapped),
            for: .touchUpInside
        )
        cell.favoriteButton.tag = indexPath.row
        
        return cell
        
    }
    
    @objc func favoriteBtnTapped(sender: UIButton) {
        
        let data = isSearching
        ? searchedList[sender.tag]
        : restaurant.restaurantArray[sender.tag]
        
        // 즐겨찾기 목록에 등록 여부를 따짐 + index 찾기
        if let index = favoriteList.firstIndex(where: { $0.name == data.name }) {
            // O -> 배열 삭제 및 이미지 변경
            favoriteList.remove(at: index)
            
            sender.setImage(
                UIImage(systemName: "heart"),
                for: .normal
            )
            
            print("=======")
            print("있다 : \(favoriteList)")
            print("=======")
        } else {
            // X -> 배열 추가 및 이미지 변경
            favoriteList.append(data)
            
            print("=======")
            print("없다 : \(favoriteList)")
            print("=======")
            
            sender.setImage(
                UIImage(systemName: "heart.fill"),
                for: .normal
            )
        }
        
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .automatic)
    }


}
