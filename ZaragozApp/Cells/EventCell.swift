//
//  EventCell.swift
//  ZaragozApp
//
//  Created by Nerea González Vázquez on 01/10/2018.
//  Copyright © 2018 Nerea Gonzalez Vazquez. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var typeView: UIView!
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var eventImageViewHeightConstraint: NSLayoutConstraint!
    
    //MARK: - Globals
    static let cellId = "EventCellId"
    static let cellName = "EventCell"
    static let cellMaxHeight: CGFloat = 360
    
    //MARK: - Constants
    let zeroHeight: CGFloat = 0
    let imageViewHeight: CGFloat = 250
    
    //MARK: - Override functions
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    //MARK: - Public functions
    
    func configure(with event: Event) {
        
        updateImageViewHeight(isHidden: true)
        
        typeLabel.text = event.type.capitalized
        titleLabel.text = event.title.capitalized
        dateLabel.text = event.startDate
        eventImageView.image = event.image
        
        if let _ = event.image {
            updateImageViewHeight(isHidden: false)
        }

    }
    
    //MARK: - Private functions
    
    fileprivate func setupViews() {
        selectionStyle = .none
        eventImageView.contentMode = .scaleAspectFill
        eventImageView.clipsToBounds = true
    }
    
    fileprivate func updateImageViewHeight(isHidden: Bool) {
        eventImageView.isHidden = isHidden
        eventImageViewHeightConstraint.constant = isHidden ? zeroHeight : imageViewHeight
    }
    
}
