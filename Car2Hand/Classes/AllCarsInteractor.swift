//
//  AllCarsInteractor.swift
//  Car2Hand
//
//  Created by bahadir on 14.02.2021.
//

import Foundation

class AllCarsInteractor {
    var cars: [Cars] = []
    
    func fetchCars(completion: (()->Void)?){
        CarsWebServices.service.loadAllCars(success: { cars in
            print(cars)
            self.cars = cars
            completion?()
        }, fail: { error in
            completion?()
        })
    }
}
