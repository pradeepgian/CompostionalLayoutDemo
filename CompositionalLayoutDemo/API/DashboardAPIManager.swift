//
//  DashboardAPI.swift
//  CompostionalLayoutDemo
//
//  Created by Pradeep Gianchandani on 11/09/21.
//

import Foundation

class DashboardAPIManager {
    
    static let shared = DashboardAPIManager() // singleton
    
    func fetchData<T: Decodable>(from jsonFileName: String, completion: (T?, Error?) -> Void) {
        let jsonData = readLocalJSONFile(name: jsonFileName)
        if let data = jsonData {
            fetchGenericJSONData(jsonData: data, completion: completion)
        }
    }
    
    private func readLocalJSONFile(name: String) -> Data? {
        do {
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                return data
            }
        } catch {
            print("error: \(error)")
        }
        return nil
    }
    
    private func fetchGenericJSONData<T: Decodable>(jsonData: Data, completion: (T?, Error?) -> ()) {
        do {
            let objects = try JSONDecoder().decode(T.self, from: jsonData)
            // success
            completion(objects, nil)
        } catch {
            completion(nil, error)
        }
    }
    
}
