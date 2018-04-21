//
//  RequestsManager.swift
//  ZaragozApp
//
//  Created by Nerea Gonzalez Vazquez on 21/04/2018.
//  Copyright © 2018 Nerea Gonzalez Vazquez. All rights reserved.
//

import Foundation
import Alamofire

class RequestsManager: NSObject {
    
    static let sharedInstance = RequestsManager()
    
    func getTodayEventsRequest(completion: @escaping ([String:Any]) -> Void) {
        let endpoint = API.baseUrl + API.getTodayEvents
        self.sendGetRequest(endpoint, completion: completion)
    }

    
    func sendGetRequest(_ endpoint: String, params: [String: Any]? = nil,  completion: @escaping ([String:Any]) -> Void) {

//        Alamofire.request(endpoint, method: .get)
//        .validate()
//        .response (completionHandler: { response in

        Alamofire.request(endpoint,
                          method: .get,
                          parameters: [:],
                          headers: ["Content-Type" :"application/json"])
            .responseString { response in
                guard response.result.isSuccess else {
                    print("Error while fetching tags: \(response.result.error)")
                    completion([String:Any]())
                    return
                }
            
                do {
                    if let responseJSON = try JSONSerialization.jsonObject(with: response.data!, options: .mutableContainers) as? [String: Any] {
                        print(responseJSON)
                        completion(responseJSON)
                        return
                    } else {
                        print("Failed to cast to Dictionary")
                        completion([String:Any]())
                    }
                } catch let error as NSError {
                    print("Failed to load: \(error.localizedDescription)")
                    completion([String:Any]())
                }
                
               
        }
    }
    
 

}


