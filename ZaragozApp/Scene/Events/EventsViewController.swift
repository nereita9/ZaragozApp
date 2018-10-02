//
//  EventsViewController.swift
//  ZaragozApp
//
//  Created by Nerea Gonzalez Vazquez on 14/04/2018.
//  Copyright © 2018 Nerea Gonzalez Vazquez. All rights reserved.
//

import UIKit
import MBProgressHUD

class EventsViewController: UITableViewController {
    
    fileprivate let eventsPresenter = EventsPresenter(requestsManager: RequestsManager())
    var eventsToDisplay = [Event]()
    
    //MARK: - Override functions

    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventsPresenter.registerDelegate(delegate: self)
        eventsPresenter.getEvents()
        
        setupTable()
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsToDisplay.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EventCell.cellId, for: indexPath) as? EventCell else {
            return EventCell()
        }
        
        tableView.beginUpdates()
        cell.configure(with: eventsToDisplay[indexPath.row])
        tableView.endUpdates()
        
        return cell
    }
    
    
    //MARK: - Private functions
    fileprivate func setupTable() {
        tableView.register(UINib(nibName: EventCell.cellName, bundle: nil), forCellReuseIdentifier: EventCell.cellId)
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        
        tableView.estimatedRowHeight = EventCell.cellMaxHeight
        tableView.rowHeight = UITableView.automaticDimension
    }

}

//MARK: - EventsPresenterDelegate
extension EventsViewController: EventsPresenterDelegate {
    
    func startLoading() {
        MBProgressHUD.showAdded(to: view, animated: true)
    }
    
    func stopLoading() {
        MBProgressHUD.hide(for: view, animated: true)
    }
    
    
    func reloadRow(at indexPath: IndexPath, with image: UIImage) {

        if indexPath.row < eventsToDisplay.count {
            eventsToDisplay[indexPath.row].image = image
            tableView.reloadRows(at: [indexPath], with: .bottom)
            
        }
    }
    
    func showEvents(_ events: [Event]) {
        eventsToDisplay = events
        tableView.reloadData()
        eventsPresenter.getImages(with: eventsToDisplay)
    }
    
    func showError(_ error: Error) {
        //TODO:
    }
    
  
    
}

