//
//  Event.swift
//  ZaragozApp
//
//  Created by Nerea González Vázquez on 30/09/2018.
//  Copyright © 2018 Nerea Gonzalez Vazquez. All rights reserved.
//

import Foundation

struct Event: Decodable {
    
    let id: Int
    let title: String
    let type: String
    let imageUrl: String
    let startDate: String
    let location: String
    let outstanding: Bool
    
    init(json: [String: Any]) {
        id = json["id"] as? Int ?? -1
        title = json["title"] as? String ?? ""
        type = json["type"] as? String ?? ""
        imageUrl = json["image"] as? String ?? ""
        startDate = json["startDate"] as? String ?? ""
        location = json["location"] as? String ?? ""
        outstanding = json["outstanding"] as? Bool ?? false
        
    }
    
}
