//
//  AllCarsInteractor.swift
//  Car2Hand
//
//  Created by bahadir on 14.02.2021.
//

import Foundation

class AllCarsInteractor {
    
    private var cars: [Cars] = []
    var filteredCar: [Cars] = []
    
    private var filterText: String?
    
    func fetchCars(page:Int, completion: (()->Void)?){
        CarsWebServices.service.loadAllCars(page: page, success: { cars in
            self.cars = cars
            self.filteredCar = cars
            completion?()
        }, fail: { error in
            completion?()
        })
    }
    
    func filterAllCars(by text: String?, completion: (()->Void)?){
        
        guard let text = text?.lowercased(), !text.isEmpty else {
            filteredCar = cars
            completion?()
            return
        }
        filteredCar = cars.filter({ $0.baslik?.lowercased().contains(text) ?? false})
        completion?()
    }
}
