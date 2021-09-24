//
//  DashboardAPI.swift
//  CompostionalLayoutDemo
//
//  Created by Pradeep Gianchandani on 12/09/21.
//

import Foundation

enum DashboardSection: CaseIterable {
    case categories
    case persons
    case summary
    case assessment
    
    var jsonName: String {
        switch self {
        case .categories:
            return "categories"
        case .persons:
            return "persons"
        case .summary:
            return "summary"
        case .assessment:
            return "assessments"
        }
        
    }
    
}

