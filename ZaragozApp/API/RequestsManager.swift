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
    
    //MARK: - Public
    func getTodayEventsRequest(onSuccess: @escaping ([Event]) -> Void,
                                      onFailure: @escaping (Error) -> Void) {
        
        let url = API.baseUrl + API.getTodayEventsEndpoint
        
        let todaySuccess:  ([[String: Any]]) -> Void = { results in
            
            var events = [Event]()
            for result in results {
                events.append(Event(json: result))
            }

            onSuccess(events)
            
        }
        self.sendGetRequest(url, onSuccess: todaySuccess, onFailure: onFailure)
    }

    //MARK: - Private
    
    fileprivate func sendGetRequest(_ endpoint: String,
                                           params: [String: Any]? = [:],
                                           onSuccess: @escaping ([[String: Any]]) -> Void,
                                           onFailure: @escaping (Error) -> Void) {

        let headers: HTTPHeaders = [
            "Accept": "application/json"
        ]

        Alamofire.request(endpoint, method: .get, parameters: params, encoding: JSONEncoding.default, headers: headers)
            .responseJSON { response in
                
                guard let responseJSON = response.result.value as? [String: Any], let results = responseJSON["result"] as? [[String: Any]] else {
                    
                let error = response.result.error ?? NSError()
                onFailure(error)
                return
            }
            onSuccess(results)
      
        }
    }
    
 

}


