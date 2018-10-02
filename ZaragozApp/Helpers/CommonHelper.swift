//
//  CommonHelper.swift
//  ZaragozApp
//
//  Created by Nerea González Vázquez on 02/10/2018.
//  Copyright © 2018 Nerea Gonzalez Vazquez. All rights reserved.
//

import Foundation

class CommonHelper {
    
    static func getHttpsUrl(from text: String) -> URL? {
        
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
