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
        case details = "detail?"
    }
    
    func loadAllCars(page: Int, success: (([Cars])->Void)?, fail: ((Error?)->Void)?) {
        let request = createAllCarsRequest(for: page)
        WebService.service.sendRequestBy(urlRequest: request, success: { json in
            let response = CarsResponse(dictionary: json)
           
            success?(response?.cars ?? [] )
            
        }, failure: fail)
    }
    
    func loadCarDetail(of car: Cars, success: ((CarDetail?)->Void)?, fail: ((Error?)->Void)?){
        let detailRequest = CarDetailRequest()
        guard let carID = car.ID else { return }
        
        detailRequest.cars = String(carID)
        
        let request = createCarDetailRequest(by: detailRequest.dictionary())
       
        WebService.service.sendRequestBy(urlRequest: request, success: { json in
            
            let response = CarDetailResponse(dictionary: json)
            success?((response?.cars))
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
    
    func createCarDetailRequest(by parameters: [String:Any]) -> URLRequest {
        let string =  baseURL + Path.details.rawValue
        return createRequest(by: string, parameters: parameters)
    }
    
    private func createRequest(by string: String, parameters: [String:Any]) -> URLRequest {
       var components = URLComponents(string: string)!
        components.queryItems = []
        parameters.forEach({
            let query = URLQueryItem(name: $0.key, value: $0.value as? String ?? "\($0)")
            components.queryItems?.append(query)
        })
        let url: URL = components.url!
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 20)
        request.httpMethod = HTTPMethods.get.rawValue
        return request
    }
}
