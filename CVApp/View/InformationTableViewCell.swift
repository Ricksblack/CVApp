//
//  InformationTableViewCell.swift
//  CVApp
//
//  Created by Ricardo Moreno Martinez on 11/25/19.
//  Copyright © 2019 Ricardo Moreno Martinez. All rights reserved.
//

import UIKit

protocol Informable {
    func getData() -> (String,String,String,String)?
}

class InformationTableViewCell: UITableViewCell {

    @IBOutlet private weak var nameLabel: UILabel?
    @IBOutlet private weak var locationLabel: UILabel?
    @IBOutlet private weak var dateLabel: UILabel?
    @IBOutlet private weak var descriptionLabel: UILabel?
    
    var presenter: Informable?
    
    func displayData() {
        guard let data = presenter?.getData() else {
            return
        }
        nameLabel?.text = data.0
        locationLabel?.text = data.1
        dateLabel?.text = data.2
        descriptionLabel?.text = data.3
    }
}
