//
//  InternshipCellPresenter.swift
//  CVApp
//
//  Created by Ricardo Moreno Martinez on 11/25/19.
//  Copyright © 2019 Ricardo Moreno Martinez. All rights reserved.
//

import Foundation

struct InternshipCellPresenter: Informable {
    var internship: Internship?
    
    func getData() -> (String, String, String, String)? {
        guard let internship = internship else {
            return nil
        }
        return (internship.name, internship.place, internship.date, internship.description)
    }
}
