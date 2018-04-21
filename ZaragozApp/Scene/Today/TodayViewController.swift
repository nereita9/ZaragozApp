//
//  TodayViewController.swift
//  ZaragozApp
//
//  Created by Nerea Gonzalez Vazquez on 14/04/2018.
//  Copyright © 2018 Nerea Gonzalez Vazquez. All rights reserved.
//

import UIKit

class TodayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        RequestsManager.sharedInstance.getTodayEventsRequest(completion: { result in
            print(result)
        })
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

