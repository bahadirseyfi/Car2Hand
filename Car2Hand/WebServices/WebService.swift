//
//  WebService.swift
//  Car2Hand
//
//  Created by bahadir on 14.02.2021.
//

import Foundation


enum WebServiceKeys: String, CodingKey{
    case root
}

class WebService {
    static let service: WebService = WebService()
    private init(){}
    
    private func printData(data: Data) {
        guard let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) else { return }
        guard let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted) else { return }
        guard let string = String(data: jsonData, encoding: .utf8) else { return }
        Swift.print(string)
    }
    
    func sendByRequestBy(urlRequest: URLRequest, success: (([String:Any]?)->Void)?, failure: ((Error?)->Void)?) {
        let session = URLSession.shared
        session.dataTask(with: urlRequest) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    failure?(error)
                }
                else if let data = data {
                    self.printData(data: data)
                    let code = (response as? HTTPURLResponse)?.statusCode ?? 0
                    if code >= 200, code < 300 {
                        if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any] {
                            success?(json)
                        }
                        else if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [Any] {
                            success?([WebServiceKeys.root.rawValue:json])
                        }
                    } else {
                        failure?(nil)
                    }
                } else {
                    failure?(nil)
                }
            }
        }.resume()
    }
}


