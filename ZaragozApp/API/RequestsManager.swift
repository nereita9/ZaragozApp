//
//  RequestsManager.swift
//  ZaragozApp
//
//  Created by Nerea Gonzalez Vazquez on 21/04/2018.
//  Copyright © 2018 Nerea Gonzalez Vazquez. All rights reserved.
//

import Foundation
import Alamofire
import Kingfisher

class RequestsManager: NSObject {
    
    //MARK: - Public
    func getEventsRequest(onSuccess: @escaping ([Event]) -> Void,
                          onFailure: @escaping (Error) -> Void){
        
        let url = API.baseUrl + API.getEventsEndpoint
        
        let eventsSuccess:  ([[String: Any]]) -> Void = { results in
            
            var events = [Event]()
            for result in results {
                let event = Event(json: result)
                
                if !CommonHelper.isPastDate(event.startDate) {
                    events.append(event)
                }
            }
            onSuccess(events)

        }
        
        sendGetRequest(url, onSuccess: eventsSuccess, onFailure: onFailure)
    }
    
    
    func loadImagesRequest(events: [Event],
                           onImageLoaded: @escaping (UIImage, Int) -> Void ){
        
        for (index, event) in events.enumerated() {
            loadImage(imageUrlString: event.imageUrl, index: index, success: onImageLoaded)
        }
  
    }

    //MARK: - Private
    
    fileprivate func loadImage(imageUrlString: String, index: Int, success: @escaping (UIImage, Int) -> () ) {
        
        if !imageUrlString.isEmpty {
            
            guard let url = CommonHelper.httpsUrl(from: imageUrlString) else {
                return
            }
            
            KingfisherManager.shared.retrieveImage(with: url, options: nil, progressBlock: nil, completionHandler: {  image, error, cacheType, imageURL in
                
                if let safeImage = image {
                    success(safeImage, index)
                }
                
            })
        }
    }
    
    
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


