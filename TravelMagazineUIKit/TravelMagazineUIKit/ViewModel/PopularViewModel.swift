//
//  PopularViewModel.swift
//  TravelMagazineUIKit
//
//  Created by Jisoo Ham on 7/9/24.
//

import Foundation

final class PopularViewModel {
    let cityList = CityInfo().city
    
    var inputSegTrigger: Observable<Int> = Observable(0)
    var inputSearchBarTrigger = Observable("")
    
    var outputCities: Observable<[City]> = Observable(
        [City(
            city_name: "",
            city_english_name: "",
            city_explain: "",
            city_image: "",
            domestic_travel: true
        )]
    )
    
    init() {
        inputSegTrigger.bind { [weak self] index in
            guard let self else { return }
            guard let region = Region(rawValue: index) else { return }
            
            self.outputCities.value = region.filterData(cityList: cityList)
        }
        
        inputSearchBarTrigger.bind { [weak self] text in
            guard let self else { return }
            
            if !text.isEmpty {
                self.outputCities.value = cityList.filter({
                    $0.city_name.contains(text) || 
                    $0.city_english_name.contains(text) ||
                    $0.city_explain.contains(text)
                })
            }
            
        }
    }
    
}
