//
//  TodayPresenter.swift
//  ZaragozApp
//
//  Created by Nerea González Vázquez on 30/09/2018.
//  Copyright © 2018 Nerea Gonzalez Vazquez. All rights reserved.
//

import Foundation

protocol TodayPresenterDelegate: class {
    //TODO
    func consolePrint(data: Any)
}

class TodayPresenter {
    
    weak private var todayPresenterDelegate: TodayPresenterDelegate?
    
    private let requestsManager: RequestsManager
    
    init(requestsManager: RequestsManager) {
        self.requestsManager = requestsManager
    }
    func registerDelegate(delegate: TodayPresenterDelegate) {
        todayPresenterDelegate = delegate
    }
    
    func getTodayEvents() {

        let successBlock:  ([Event]) -> Void = { events in
            self.todayPresenterDelegate?.consolePrint(data: events)
        }
        
        let failureBlock:  (Error) -> Void = { error in
            self.todayPresenterDelegate?.consolePrint(data: error)
        }
        
        requestsManager.getTodayEventsRequest(onSuccess: successBlock, onFailure: failureBlock)
        
    }
    
}
