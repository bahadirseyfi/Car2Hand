//
//  WebService.swift
//  Car2Hand
//
//  Created by bahadir on 14.02.2021.
//

import Foundation


class WebService {
    static let service: WebService = WebService()
    private init(){}
    
    func sendByRequestBy(urlRequest: URLRequest, success: ()->Void, failure: (Error?)->Void) {
        let session = URLSession.shared
        session.dataTask(with: urlRequest) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    
                }
            }
        }
    }
}
