//
//  ViewController.swift
//  CVApp
//
//  Created by Ricardo Moreno Martinez on 11/21/19.
//  Copyright © 2019 Ricardo Moreno Martinez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var nameLabel: UILabel?
    @IBOutlet private weak var bachelorLabel: UILabel?
    @IBOutlet private weak var tableView: UITableView?
    
    private var presenter: MainViewPresenter<ViewController>!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = MainViewPresenter(view: self, service: CurriculumService())
        presenter.fetchData()
        tableView?.dataSource = self
        tableView?.delegate = self
        tableView?.register(UINib(nibName: Constants.jobCellNibName, bundle: nil), forCellReuseIdentifier: Constants.jobCellIdentifier)
        tableView?.register(UINib(nibName: Constants.informationCellNibName, bundle: nil), forCellReuseIdentifier: Constants.informationCellIdentifier)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.retrieveNumberOfRows(for: section)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return presenter.sections[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = presenter.getCurrentSection(index: indexPath.section)
        switch section {
        case .job:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.jobCellIdentifier, for: indexPath) as? JobInformationTableViewCell else {
                return UITableViewCell()
            }
            cell.presenter = presenter.retrieveJobPresenter(index: indexPath.row)
            cell.displayData()
            return cell
        case .education:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.informationCellIdentifier, for: indexPath) as? InformationTableViewCell else {
                return UITableViewCell()
            }
            cell.presenter = presenter.retrieveEducationPresenter(index: indexPath.row)
            cell.displayData()
            return cell
        case .internship:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.informationCellIdentifier, for: indexPath) as? InformationTableViewCell else {
                return UITableViewCell()
            }
            cell.presenter = presenter.retrieveIntershipPresenter(index: indexPath.row)
            cell.displayData()
            return cell
        }
    }
}

extension ViewController: MainView {
    func setHeader(data: (String, String)) {
        nameLabel?.text = data.0
        bachelorLabel?.text = data.1
        tableView?.reloadData()
    }
}

extension ViewController {
    struct Constants {
        static var jobCellIdentifier: String = "jobCell"
        static var jobCellNibName: String = "JobInformationTableViewCell"
        static var informationCellIdentifier: String = "informationCell"
        static var informationCellNibName: String = "InformationTableViewCell"
    }
}
