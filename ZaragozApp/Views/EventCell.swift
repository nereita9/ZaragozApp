//
//  EventCell.swift
//  ZaragozApp
//
//  Created by Nerea González Vázquez on 01/10/2018.
//  Copyright © 2018 Nerea Gonzalez Vazquez. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {
    
    @IBOutlet weak var typeView: UIView!
    @IBOutlet weak var typeViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var eventImageView: UIImageView!
    
    @IBOutlet weak var eventImageViewHeightConstraint: NSLayoutConstraint!
    
    let typeViewHeight: CGFloat = 50
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
