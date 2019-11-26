//
//  Curriculum.swift
//  CVApp
//
//  Created by Ricardo Moreno Martinez on 11/22/19.
//  Copyright © 2019 Ricardo Moreno Martinez. All rights reserved.
//

import Foundation

struct Curriculum: Decodable {
    var name: String
    var firstLastName: String
    var secondLastName: String
    var bachelor: String
    var profile: String
    var contactInfo: ContactInformation
    var interestLinks: [String]
    var languages: [String]
    var interests: [String]
    var employmentHistory: [Employ]
    var education: [EducationRecord]
    var internships: [Internship]
}
