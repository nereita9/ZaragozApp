//
//  EventsPresenter.swift
//  ZaragozApp
//
//  Created by Nerea González Vázquez on 30/09/2018.
//  Copyright © 2018 Nerea Gonzalez Vazquez. All rights reserved.
//

import Foundation
import UIKit

protocol EventsPresenterDelegate: class {

    func showEvents(_ events: [Event])
    func showError(_ error: Error)
    func reloadRow(at indexPath: IndexPath, with image: UIImage)
    func startLoading()
    func stopLoading()
}

class EventsPresenter {
    
    weak private var eventsPresenterDelegate: EventsPresenterDelegate?
    private let requestsManager: RequestsManager
    
    //MARK: - Initialization
    
    init(requestsManager: RequestsManager) {
        self.requestsManager = requestsManager
    }
    
    //MARK: - Public functions
    
    func registerDelegate(delegate: EventsPresenterDelegate) {
        eventsPresenterDelegate = delegate
    }
    
    func getEvents() {

        let successBlock:  ([Event]) -> Void = { [weak self] events in
            
            guard let strongSelf = self else { return }
            
            DispatchQueue.main.async {
                strongSelf.eventsPresenterDelegate?.stopLoading()
                strongSelf.eventsPresenterDelegate?.showEvents(events)
            }
            
        }
        
        let failureBlock:  (Error) -> Void = { [weak self] error in
            
            guard let strongSelf = self else { return }
            
            DispatchQueue.main.async {
                strongSelf.eventsPresenterDelegate?.stopLoading()
                strongSelf.eventsPresenterDelegate?.showError(error)
            }
        }
        
        DispatchQueue.main.async {
            self.eventsPresenterDelegate?.startLoading()
        }
        requestsManager.getEventsRequest(onSuccess: successBlock, onFailure: failureBlock)
        
    }
    
    func getImages(with events: [Event]) {
        
        let imageLoadedBlock:  (UIImage, Int) -> Void = { [weak self] image, index in
            guard let strongSelf = self else { return }
            
            let indexPath = IndexPath(row: index, section: 0)
            
            DispatchQueue.main.async {
                strongSelf.eventsPresenterDelegate?.reloadRow(at: indexPath, with: image)
            }
        }
        
        requestsManager.loadImagesRequest(events: events, onImageLoaded: imageLoadedBlock)
    }
    
}
