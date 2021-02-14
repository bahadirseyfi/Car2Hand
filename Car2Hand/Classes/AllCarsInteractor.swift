//
//  AllCarsInteractor.swift
//  Car2Hand
//
//  Created by bahadir on 14.02.2021.
//

import Foundation

class AllCarsInteractor {
    var cars: [Cars] = []
    
    
    func fetchCars(page:Int, completion: (()->Void)?){
        CarsWebServices.service.loadAllCars(page: page, success: { cars in
            self.cars = cars
            completion?()
        }, fail: { error in
            completion?()
        })
    }
}
