//
//  JobCellPresenter.swift
//  CVApp
//
//  Created by Ricardo Moreno Martinez on 11/25/19.
//  Copyright © 2019 Ricardo Moreno Martinez. All rights reserved.
//

import Foundation

struct JobCellPresenter {
    var employ: Employ?
    
    func getData() -> [String: String]? {
        guard let employ = employ else {
            return nil
        }
        let data = ["title": employ.jobTitle, "company": employ.company, "date": employ.date, "place": employ.place, "description": employ.jobDescription]
        return data
    }
}
