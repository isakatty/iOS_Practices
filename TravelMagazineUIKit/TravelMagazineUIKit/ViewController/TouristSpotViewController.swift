//
//  TouristSpotViewController.swift
//  TravelMagazineUIKit
//
//  Created by Jisoo HAM on 5/29/24.
//

import UIKit

import Kingfisher

class TouristSpotViewController: UIViewController {
    var data: Travel?
    
    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureBaseView("관광지 화면")
        
        configureUI()
    }
    
    func configureUI() {
        guard let data else { return }
        
        let url = URL(string: data.travel_image ?? "")
        cityImageView.kf.setImage(with: url)
        cityImageView.contentMode = .scaleAspectFill
        
        cityNameLabel.text = data.title
        descriptionLabel.text = data.description
        
        cityNameLabel.textAlignment = .center
        descriptionLabel.textAlignment = .center
    }

}
