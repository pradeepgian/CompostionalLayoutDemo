//
//  User.swift
//  CompostionalLayoutDemo
//
//  Created by Pradeep Gianchandani on 09/09/21.
//

import Foundation

struct PersonResult: Decodable {
    let persons: [Person]
}

struct Person: Decodable, Hashable {
    let id: String
    let name: Name
    let picture: ImageData
    let showOuterCircle: Int
    var showOuterCircleBool: Bool {
        return showOuterCircle == 1
    }
}

struct Name: Decodable, Hashable {
    let first: String
    let last: String
}

struct ImageData: Decodable, Hashable {
    let medium: String
}
