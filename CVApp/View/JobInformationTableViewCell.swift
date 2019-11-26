//
//  JobInformationTableViewCell.swift
//  CVApp
//
//  Created by Ricardo Moreno Martinez on 11/25/19.
//  Copyright © 2019 Ricardo Moreno Martinez. All rights reserved.
//

import UIKit

class JobInformationTableViewCell: UITableViewCell {

    @IBOutlet private weak var jobTitleLabel: UILabel?
    @IBOutlet private weak var companyLabel: UILabel?
    @IBOutlet private weak var dateLabel: UILabel?
    @IBOutlet private weak var placeLabel: UILabel?
    @IBOutlet private weak var descriptionLabel: UILabel?
    
    var presenter: JobCellPresenter?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func displayData() {
        guard let data = presenter?.getData() else {
            return
        }
        jobTitleLabel?.text = data["title"]
        companyLabel?.text = data["company"]
        dateLabel?.text = data["date"]
        placeLabel?.text = data["place"]
        descriptionLabel?.text = data["description"]
    }
}
