//
//  EducationCellPresenter.swift
//  CVApp
//
//  Created by Ricardo Moreno Martinez on 11/25/19.
//  Copyright © 2019 Ricardo Moreno Martinez. All rights reserved.
//

import Foundation

struct EducationCellPresenter: Informable {
    var education: EducationRecord?
    func getData() -> (String, String, String, String)? {
        guard let education = education else {
            return nil
        }
        return (education.schoolName, education.institute, education.date, education.bachelor )
    }
}

