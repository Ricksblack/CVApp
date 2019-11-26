//
//  ProfilePresenter.swift
//  CVApp
//
//  Created by Ricardo Moreno Martinez on 11/26/19.
//  Copyright © 2019 Ricardo Moreno Martinez. All rights reserved.
//

import Foundation

struct ProfilePresenter {
    var profile: Profile?
}

extension ProfilePresenter: ProfileViewPresenter {
    func getData() -> [String : Any]? {
        guard let profile = profile else {
            return nil
        }
        let dataDictionary: [String: Any] = ["name": profile.name, "bachelor": profile.bachelor, "description": profile.description, "contactInfo": profile.contactInformation, "skills": profile.skills, "languages": profile.languages, "interests": profile.interest]
        return dataDictionary
    }
}
