//
//  CarsWebServices.swift
//  Car2Hand
//
//  Created by bahadir on 14.02.2021.
//

import Foundation

class CarsWebServices {
    
    enum HTTPMethods: String {
        case get
        case post
        case put
        case delete
        case head
    }
    
    static let service: CarsWebServices = CarsWebServices()
    init(){}
    
    var baseURL: String { "https://sandbox.arabamd.com/api/v1/" }
    enum Path: String {
        case cars = "listing?"
        case details
    }
    
    func loadAllCars(page: Int, success: (([Cars])->Void)?, fail: ((Error?)->Void)?) {
        let request = createAllCarsRequest(for: page)
        WebService.service.sendByRequestBy(urlRequest: request, success: { json in
            let response = CarsResponse(dictionary: json)
            success?(response?.cars ?? [] )
        }, failure: fail)
    }
}

extension CarsWebServices {
    func createAllCarsRequest(for page: Int)->URLRequest {
        
        //let eventRequest = CarsRequest()
        let intPage = String(page)
        let urlString = baseURL + Path.cars.rawValue + "take=" + intPage
        let url = URL(string: urlString)!
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 20)
        request.httpMethod = HTTPMethods.get.rawValue
        return request
    }
}
