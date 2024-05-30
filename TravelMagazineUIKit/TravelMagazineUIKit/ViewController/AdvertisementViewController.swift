//
//  AdvertisementViewController.swift
//  TravelMagazineUIKit
//
//  Created by Jisoo HAM on 5/29/24.
//

import UIKit

class AdvertisementViewController: UIViewController {
    static let identifier = "AdvertisementViewController"
    
    var data: Travel?
    @IBOutlet var adLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "광고 화면"
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "xmark"),
            style: .done,
            target: self,
            action: #selector(leftBarBtnTapped)
        )
        navigationItem.leftBarButtonItem?.tintColor = .black
        
        configureUI()
    }
    
    @objc func leftBarBtnTapped() {
        dismiss(animated: true)
    }
    
    func configureUI() {
        guard let data else { return }
        adLabel.text = data.title
        adLabel.textAlignment = .center
        adLabel.textColor = .darkGray
    }

}
