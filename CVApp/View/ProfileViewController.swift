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
    
    let profileImage: UIImageView = {
        return UIImageView()
    }()
    
    let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.numberOfLines = 0
        nameLabel.textColor = .white
        nameLabel.font = .boldSystemFont(ofSize: 19)
        return nameLabel
    }()
    
    let bachelorLabel: UILabel = {
        let bachelorLabel = UILabel()
        bachelorLabel.numberOfLines = 0
        bachelorLabel.textColor = .white
        bachelorLabel.font = .boldSystemFont(ofSize: 19)
        return bachelorLabel
    }()
    
    let profileDescriptionLabel: UILabel = {
        let profileDescriptionLabel = UILabel()
        profileDescriptionLabel.numberOfLines = 0
        profileDescriptionLabel.font = .systemFont(ofSize: 16, weight: .light)
        profileDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        return profileDescriptionLabel
    }()
    
    let contactDescriptionLabel : UILabel = {
        let contactDescriptionLabel = UILabel()
        contactDescriptionLabel.numberOfLines = 0
        contactDescriptionLabel.font = .systemFont(ofSize: 16, weight: .light)
        contactDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        return contactDescriptionLabel
    }()
    
    let skillDescriptionLabel: UILabel = {
        let skillDescriptionLabel = UILabel()
        skillDescriptionLabel.numberOfLines = 0
        skillDescriptionLabel.font = .systemFont(ofSize: 16, weight: .light)
        skillDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        return skillDescriptionLabel
    }()
    
    let languagesDescriptionLabel: UILabel = {
        let languagesDescriptionLabel = UILabel()
        languagesDescriptionLabel.numberOfLines = 0
        languagesDescriptionLabel.font = .systemFont(ofSize: 16, weight: .light)
        return languagesDescriptionLabel
    }()
    
    let interestDescriptionLabel: UILabel = {
        let interestDescriptionLabel = UILabel()
        interestDescriptionLabel.numberOfLines = 0
        interestDescriptionLabel.font = .systemFont(ofSize: 16, weight: .light)
        return interestDescriptionLabel
    }()
    
    var presenter: ProfileViewPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        buildHeaderInterface()
    }
    
    private func buildHeaderInterface() {
        
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        let containerView = UIView()
        containerView.backgroundColor = .white
        scrollView.addSubview(containerView)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        let containerViewHeightConstraint = containerView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        containerViewHeightConstraint.priority = .defaultLow
        containerViewHeightConstraint.isActive = true
        
        let headerViewContainer = UIView()
        headerViewContainer.backgroundColor = .init(red: 144.0 / 255.0, green: 0 / 255.0, blue: 32 / 255.0, alpha: 1.0)
        headerViewContainer.addSubview(profileImage)
        headerViewContainer.addSubview(nameLabel)
        headerViewContainer.addSubview(bachelorLabel)

        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        profileImage.centerXAnchor.constraint(equalTo: headerViewContainer.centerXAnchor, constant: 0).isActive = true
        profileImage.topAnchor.constraint(equalTo: headerViewContainer.topAnchor, constant: 10).isActive = true

        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 8).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: headerViewContainer.leadingAnchor, constant: 8).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: headerViewContainer.trailingAnchor, constant: 8).isActive = true

        bachelorLabel.translatesAutoresizingMaskIntoConstraints = false
        bachelorLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8).isActive = true
        bachelorLabel.leadingAnchor.constraint(equalTo: headerViewContainer.leadingAnchor, constant: 8).isActive = true
        bachelorLabel.trailingAnchor.constraint(equalTo: headerViewContainer.trailingAnchor, constant: 8).isActive = true
        headerViewContainer.bottomAnchor.constraint(equalTo: bachelorLabel.bottomAnchor, constant: 8).isActive = true

        containerView.addSubview(headerViewContainer)

        headerViewContainer.translatesAutoresizingMaskIntoConstraints = false
        headerViewContainer.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
        headerViewContainer.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0).isActive = true
        headerViewContainer.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0).isActive = true
        headerViewContainer.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.25).isActive = true

        let profileLabel = UILabel()
        profileLabel.text = "Profile"
        profileLabel.font = .italicSystemFont(ofSize: 18)
        profileLabel.textColor = .red
        profileLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(profileLabel)

        profileLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8.0).isActive = true
        profileLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 8.0).isActive = true
        profileLabel.topAnchor.constraint(equalTo: headerViewContainer.bottomAnchor, constant: 8.0).isActive = true

        containerView.addSubview(profileDescriptionLabel)

        profileDescriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8.0).isActive = true
        profileDescriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8.0).isActive = true
        profileDescriptionLabel.topAnchor.constraint(equalTo: profileLabel.bottomAnchor, constant: 8.0).isActive = true

        let contactLabel = UILabel()
        contactLabel.text = "Contact Information"
        contactLabel.font = .italicSystemFont(ofSize: 18)
        contactLabel.textColor = .red
        contactLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(contactLabel)

        contactLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8.0).isActive = true
        contactLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 8.0).isActive = true
        contactLabel.topAnchor.constraint(equalTo: profileDescriptionLabel.bottomAnchor, constant: 8.0).isActive = true

        containerView.addSubview(contactDescriptionLabel)

        contactDescriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8.0).isActive = true
        contactDescriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8.0).isActive = true
        contactDescriptionLabel.topAnchor.constraint(equalTo: contactLabel.bottomAnchor, constant: 8.0).isActive = true

        let skillsLabel = UILabel()
        skillsLabel.text = "Skills"
        skillsLabel.font = .italicSystemFont(ofSize: 18)
        skillsLabel.textColor = .red
        skillsLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(skillsLabel)

        skillsLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8.0).isActive = true
        skillsLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 8.0).isActive = true
        skillsLabel.topAnchor.constraint(equalTo: contactDescriptionLabel.bottomAnchor, constant: 8.0).isActive = true

        containerView.addSubview(skillDescriptionLabel)

        skillDescriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8.0).isActive = true
        skillDescriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 8.0).isActive = true
        skillDescriptionLabel.topAnchor.constraint(equalTo: skillsLabel.bottomAnchor, constant: 8.0).isActive = true

//         TODO: languages

        let containerStack = UIStackView()
        containerStack.axis = .horizontal
        containerStack.alignment = .leading
        containerStack.distribution = .fillEqually
        containerStack.spacing = 8.0

        let languagesStack = UIStackView()
        languagesStack.axis = .vertical
        languagesStack.alignment = .leading
        languagesStack.distribution = .fillEqually
        languagesStack.spacing = 8.0

        let languagesLabel = UILabel()
        languagesLabel.text = "Languages"
        languagesLabel.font = .italicSystemFont(ofSize: 18)
        languagesLabel.textColor = .red

        languagesStack.addArrangedSubview(languagesLabel)
        languagesStack.addArrangedSubview(languagesDescriptionLabel)

        let interesStack = UIStackView()
        interesStack.axis = .vertical
        interesStack.alignment = .leading
        interesStack.distribution = .fillEqually
        interesStack.spacing = 8.0

        let interestLabel = UILabel()
        interestLabel.text = "Interest"
        interestLabel.font = .italicSystemFont(ofSize: 18)
        interestLabel.textColor = .red

        interesStack.addArrangedSubview(interestLabel)
        interesStack.addArrangedSubview(interestDescriptionLabel)

        containerStack.addArrangedSubview(languagesStack)
        containerStack.addArrangedSubview(interesStack)

        containerStack.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(containerStack)

        containerStack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8.0).isActive = true
        containerStack.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 8.0).isActive = true
        containerStack.topAnchor.constraint(equalTo: skillDescriptionLabel.bottomAnchor, constant: 8.0).isActive = true
        containerStack.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 8.0).isActive = true
        fillData()
    }
    
    func fillData() {
        guard let data = presenter?.getData(),
            let name = data["name"] as? String,
            let bachelor = data["bachelor"] as? String,
            let description = data["description"] as? String,
            let contactInfo = data["contactInfo"] as? String,
            let skills = data["skills"] as? [String],
            let languages = data["languages"] as? [String],
            let interests = data["interests"] as? [String] else {
                return
        }
        profileImage.image = UIImage(named: "perfilImage")
        nameLabel.text = name
        bachelorLabel.text = bachelor
        profileDescriptionLabel.text = description
        contactDescriptionLabel.text = contactInfo
        skillDescriptionLabel.text = getSkills(skillsArray: skills)
        languagesDescriptionLabel.text = getLanguages(languageArray: languages)
        interestDescriptionLabel.text = getInterests(interestArray: interests)
    }
}

private extension ProfileViewController {
    func getSkills(skillsArray: [String]) -> String {
        var skillText = ""
        for skill in skillsArray {
            skillText += skill + "\n "
        }
        return skillText
    }
    
    func getLanguages(languageArray: [String]) -> String {
        var languagesText = ""
        for language in languageArray {
            languagesText += language + "\n "
        }
        return languagesText
    }
    
    func getInterests(interestArray: [String]) -> String {
        var interestText = ""
        for interest in interestArray {
            interestText +=  interest + "\n"
        }
        return interestText
    }
}
