//
//  AppDelegate.swift
//  ZaragozApp
//
//  Created by Nerea Gonzalez Vazquez on 14/04/2018.
//  Copyright © 2018 Nerea Gonzalez Vazquez. All rights reserved.
//

import UIKit
import AlamofireNetworkActivityLogger

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        #if DEBUG
        NetworkActivityLogger.shared.level = .debug
        NetworkActivityLogger.shared.startLogging()
        #endif
        
        return true
    }

}

