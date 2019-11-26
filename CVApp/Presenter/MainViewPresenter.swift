//
//  MainViewPresenter.swift
//  CVApp
//
//  Created by Ricardo Moreno Martinez on 11/22/19.
//  Copyright © 2019 Ricardo Moreno Martinez. All rights reserved.
//

import Foundation

let jsonUrlString = "https://gist.githubusercontent.com/Ricksblack/a5bc583c6671c9dac4439d2a2acb8175/raw/bd6cc5cf5a6faa10d17cf5f084a852f5894f49e1/RicksCV"

protocol MainView: class {
    func setHeader(data: (String,String))
}

protocol Presentable {
}

enum Section: Int {
    case job
    case education
    case internship
}

class MainViewPresenter<V: MainView> {
    weak var view: V?
    let service: CurriculumService
    
    var cv: Curriculum?
    var employs = [Employ]()
    
    //sections for the table view
    var sections = ["Job Experience", "Education", "Projects"]
    var currentSection = 0
    
    init(view: V, service: CurriculumService) {
        self.view = view
        self.service = service
    }
    
    func fetchData() {
        guard let url = URL(string: jsonUrlString) else {
            return
        }
        service.fetchData(url: url) { [weak self] cv in
            self?.cv = cv
            self?.configureDataForView()
        }
    }
    
    func configureDataForView() {
        guard let curriculum = cv else {
            return
        }
        employs = curriculum.employmentHistory
        let fullName = curriculum.name + " " + curriculum.firstLastName + " " + curriculum.secondLastName
        setDataForHeader(name: fullName, bachelor: curriculum.bachelor)
    }
    
    func setDataForHeader(name: String, bachelor: String) {
        view?.setHeader(data: (name,bachelor))
    }
    
    func retrieveNumberOfRows(for section: Int) -> Int {
        currentSection = section
        guard let cv = cv,
            let section = Section.init(rawValue: section) else {
            return 0
        }
        switch section {
        case .job:
            return cv.employmentHistory.count
        case .education:
            return cv.education.count
        case .internship:
            return cv.internships.count
        }
    }
    
    func getCurrentSection(index: Int) -> Section {
        return Section.init(rawValue: index) ?? Section.job
    }
    
    func retrieveJobPresenter(index: Int) -> JobCellPresenter {
        return JobCellPresenter(employ: cv?.employmentHistory[index])
    }
    
    func retrieveEducationPresenter(index: Int) -> EducationCellPresenter {
        return EducationCellPresenter(education: cv?.education[index])
    }
    
    func retrieveIntershipPresenter(index: Int) -> InternshipCellPresenter {
        return InternshipCellPresenter(internship: cv?.internships[index])
    }
}







//    func retrievePresenterForCell(in section: Int, index: Int) -> Presentable? {
//        guard let section = Section.init(rawValue: section) else {
//            return nil
//        }
//        switch section {
//        case .job:
//            return JobCellPresenter(employ: cv?.employmentHistory[index]) as? Presentable
//        case .education:
//            return EducationCellPresenter(education: cv?.education[index]) as? Presentable
//        case .internship:
//            return InternshipCellPresenter(internship: cv?.internships[index]) as? Presentable
//        }
//    }

//    func retrievePresenterForCell<T: Presentable>(in section: Int, index: Int, presenter: T) {
//        guard let section = Section.init(rawValue: section) else {
//            return
//        }
//        switch section {
//        case .job:
//            presenter.setData(data: cv?.employmentHistory[index])
//        //            return JobCellPresenter(employ: cv?.employmentHistory[index])
//        case .education:
//            return EducationCellPresenter(education: cv?.education[index])
//        case .internship:
//            return InternshipCellPresenter(internship: cv?.internships[index])
//        }
//        //        if section == "Job Experience" {
//        //            cellPresenter = JobCellPresenter(employ: cv?.employmentHistory[index])
//        //        } else if section == "Education" {
//        //            //TODO: sent presenter with education Model inside
//        //            print("educacion")
//        //            cellPresenter = JobCellPresenter(employ: cv?.employmentHistory[index])
//        //        } else if section == "Projects" {
//        //            //TODO: sent presenter with education Model inside
//        //            print("projects")
//        //            cellPresenter = JobCellPresenter(employ: cv?.employmentHistory[index])
//        //        }
//    }
