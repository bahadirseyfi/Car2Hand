//
//  CarsDetailInteractor.swift
//  Car2Hand
//
//  Created by bahadir on 15.02.2021.
//

import Foundation

class CarsDetailInteractor {
    
    var detail: CarDetail?
    
    func fetchDetails(of car: Cars, completion: (()->Void)?){
        CarsWebServices.service.loadCarDetail(of: car, success: { details in
            self.detail = details
            completion?()
           
        }, fail:{ error in
            completion?()
            })
        }
}
