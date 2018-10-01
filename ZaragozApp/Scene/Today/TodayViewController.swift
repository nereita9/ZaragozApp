//
//  TodayViewController.swift
//  ZaragozApp
//
//  Created by Nerea Gonzalez Vazquez on 14/04/2018.
//  Copyright © 2018 Nerea Gonzalez Vazquez. All rights reserved.
//

import UIKit

class TodayViewController: UITableViewController {
    
    fileprivate let todayPresenter = TodayPresenter(requestsManager: RequestsManager())

    override func viewDidLoad() {
        super.viewDidLoad()
        
        todayPresenter.registerDelegate(delegate: self)
        todayPresenter.getTodayEvents()
        
    }

}

//MARK: - TodayPresenterDelegate
extension TodayViewController: TodayPresenterDelegate {
    func consolePrint(data: Any) {
        print(data)
    }
    
    
}

