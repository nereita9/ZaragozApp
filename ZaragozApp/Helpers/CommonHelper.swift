//
//  CommonHelper.swift
//  ZaragozApp
//
//  Created by Nerea González Vázquez on 02/10/2018.
//  Copyright © 2018 Nerea Gonzalez Vazquez. All rights reserved.
//

import Foundation
import SwiftDate

class CommonHelper {
    
    static func isPastDate(_ dateString: String) -> Bool {
        
        var isDateFromPast = true
        guard let date = dateString.toDate() else {
            return isDateFromPast
        }
        let todayDate = DateInRegion(Date(), region: .current)
        if  date.compare(toDate: todayDate, granularity: .hour) == .orderedDescending {
            isDateFromPast = false
        }
        return isDateFromPast
    }
    
    static func datePretty(_ dateString: String) -> String {
        
        var prettyDateString = ""
        guard let date = dateString.toDate() else {
            return prettyDateString
        }
        
        if date.compare(.isToday) {
            prettyDateString = "Hoy"
        } else if date.compare(.isTomorrow) {
            prettyDateString = "Mañana"
        } else {
            prettyDateString = date.toFormat("dd MMM")
        }
        
        return prettyDateString
        
    }
    
    static func httpsUrl(from text: String) -> URL? {
        
        let types: NSTextCheckingResult.CheckingType = .link
        
        do {
            let detector = try NSDataDetector(types: types.rawValue)
            let matches = detector.matches(in: text, options: .reportCompletion, range: NSMakeRange(0, text.count))
            
            for match in matches {
                
                if let url = match.url, var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) {
                    urlComponents.scheme = "https"
                    return urlComponents.url
                }
            }
            return nil
        } catch {
            return nil
        }
        
    }
    
}
