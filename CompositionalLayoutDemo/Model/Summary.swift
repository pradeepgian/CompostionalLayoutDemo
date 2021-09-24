//
//  TeamSummary.swift
//  CompostionalLayoutDemo
//
//  Created by Pradeep Gianchandani on 09/09/21.
//

import Foundation

struct SummaryResult: Decodable {
    let summary: Summary
}

struct Summary: Decodable {
    let title: String
    let activities: [Activity]
}

struct Activity: Decodable, Hashable {
    let id: String
    let title: String
    let score: String
}
