//
//  Category.swift
//  CompostionalLayoutDemo
//
//  Created by Pradeep Gianchandani on 11/09/21.
//

import Foundation

struct CategoryResult: Decodable {
    let categories: [Category]
}

struct Category: Decodable, Hashable {
    let id: String
    let name: String
}

