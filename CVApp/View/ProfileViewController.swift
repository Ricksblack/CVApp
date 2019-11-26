//
//  ProfileViewController.swift
//  CVApp
//
//  Created by Ricardo Moreno Martinez on 11/26/19.
//  Copyright © 2019 Ricardo Moreno Martinez. All rights reserved.
//

import UIKit

protocol ProfileViewPresenter {
    func getData() -> [String: Any]?
}

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bachelorLabel: UILabel!
    @IBOutlet weak var profileDescriptionLabel: UILabel!
    @IBOutlet weak var contactInformationLabel: UILabel!
    @IBOutlet weak var skillsLabel: UILabel!
    @IBOutlet weak var languagesLabel: UILabel!
    @IBOutlet weak var interestsLabel: UILabel!
    
    var presenter: ProfileViewPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        presentData()
    }
    
    private func presentData() {
        guard let data = presenter?.getData(),
            let name = data["name"] as? String,
            let bachelor = data["bachelor"] as? String,
            let description = data["description"] as? String,
            let contactInformation = data["contactInfo"] as? String,
            let skills = data["skills"] as? [String],
            let languages = data["languages"] as? [String],
            let interests = data["interests"] as? [String] else {
                return
        }
        profileImage.image = UIImage(named: "perfilImage")
        nameLabel.text = name
        bachelorLabel.text = bachelor
        profileDescriptionLabel.text = description
        contactInformationLabel.text = contactInformation
        skillsLabel.text = getSkills(skillsArray: skills)
        languagesLabel.text = getLanguages(languageArray: languages)
        interestsLabel.text = getInterests(interestArray: interests)
    }
    
    private func getSkills(skillsArray: [String]) -> String {
        var skillText = ""
        for skill in skillsArray {
            skillText += skill + "\n "
        }
        return skillText
    }
    
    private func getLanguages(languageArray: [String]) -> String {
        var languagesText = ""
        for language in languageArray {
            languagesText += language + "\n "
        }
        return languagesText
    }
    
    private func getInterests(interestArray: [String]) -> String {
        var interestText = ""
        for interest in interestArray {
            interestText +=  interest + "\n"
        }
        return interestText
    }
}
