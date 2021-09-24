//
//  Assessment.swift
//  CompostionalLayoutDemo
//
//  Created by Pradeep Gianchandani on 09/09/21.
//

import Foundation

struct AssessmentResult: Decodable {
    let assessments: [Assessment]
}

struct Assessment: Decodable, Hashable {
    let id: String
    let title: String
    let scorecard: [Scorecard]
}

struct Scorecard: Decodable, Hashable {
    let objective: String
    let score: String
}
