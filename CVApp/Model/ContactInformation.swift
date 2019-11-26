//
//  ContactInformation.swift
//  CVApp
//
//  Created by Ricardo Moreno Martinez on 11/22/19.
//  Copyright © 2019 Ricardo Moreno Martinez. All rights reserved.
//

import Foundation

struct ContactInformation: Decodable {
    var address: String
    var zipCode: String
    var state: String
    var phoneNumber: String
    var email: String
}
