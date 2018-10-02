//
//  Event.swift
//  ZaragozApp
//
//  Created by Nerea González Vázquez on 30/09/2018.
//  Copyright © 2018 Nerea Gonzalez Vazquez. All rights reserved.
//

import Foundation
import UIKit

struct Event {
    
    let id: Int
    let title: String
    let type: String
    let imageUrl: String
    let startDate: String
    let location: String
    let outstanding: Bool
    var image: UIImage?
    
    init(json: [String: Any]) {
        id = json["id"] as? Int ?? -1
        title = json["title"] as? String ?? ""
        let serviceType = json["type"] as? String ?? "Varios"
        
        let needToChangeTypeString = serviceType.caseInsensitiveCompare("otros") == .orderedSame || serviceType.caseInsensitiveCompare("otras") == .orderedSame
        type = needToChangeTypeString ? "Varios" : serviceType //TODO: get number from category, not string directly
        
        let program = json["program"] as? [String: Any] ?? [:]
        let programImageUrl = program["image"] as? String
        let category = json["category"] as? [String: Any] ?? [:]
        let categoryImageUrl = category["image"] as? String ?? ""
        let auxiliarImage = programImageUrl ?? categoryImageUrl
        
        imageUrl = json["image"] as? String ?? auxiliarImage
        startDate = json["startDate"] as? String ?? ""
        location = json["location"] as? String ?? ""
        outstanding = json["outstanding"] as? Bool ?? false
        
    }
    
}
