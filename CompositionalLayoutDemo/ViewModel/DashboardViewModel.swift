//
//  DashboardViewModel.swift
//  CompostionalLayoutDemo
//
//  Created by Pradeep Gianchandani on 11/09/21.
//

import Foundation
import UIKit

class DashboardViewModel {
    
    var categories = [Category]()
    var persons = [Person]()
    var summaryData: Summary?
    var assessments = [Assessment]()
    
    init() {
        fetchDashboardData()
    }
    
    func fetchDashboardData() {
        fetchCategories()
        fetchPersons()
        fetchSummary()
        fetchAssessment()
    }
    
    func fetchCategories() {
        let jsonFileName = DashboardSection.categories.jsonName
        DashboardAPIManager.shared.fetchData(from: jsonFileName) { (result: CategoryResult?, error) in
            self.categories = result?.categories ?? []
        }
    }
    
    func fetchPersons() {
        let jsonFileName = DashboardSection.persons.jsonName
        DashboardAPIManager.shared.fetchData(from: jsonFileName) { (result: PersonResult?, error) in
            self.persons = result?.persons ?? []
        }
    }

    func fetchSummary() {
        let jsonFileName = DashboardSection.summary.jsonName
        DashboardAPIManager.shared.fetchData(from: jsonFileName) { (result: SummaryResult?, error) in
            self.summaryData = result?.summary
        }
    }

    func fetchAssessment() {
        let jsonFileName = DashboardSection.assessment.jsonName
        DashboardAPIManager.shared.fetchData(from: jsonFileName) { (result: AssessmentResult?, error) in
            self.assessments = result?.assessments ?? []
        }
    }
    
}
