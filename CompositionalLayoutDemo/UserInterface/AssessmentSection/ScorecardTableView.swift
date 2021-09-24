//
//  ScorecardTableView.swift
//  CompostionalLayoutDemo
//
//  Created by Pradeep Gianchandani on 12/09/21.
//

import UIKit

class ScorecardTableView: UITableViewController {
    
    var scoreCardData = [Scorecard]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeTableView()
    }
    
    private func initializeTableView() {
        tableView.register(ScorecardCell.self, forCellReuseIdentifier: ScorecardCell.identifier)
        tableView.separatorStyle = .none
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scoreCardData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ScorecardCell(style: .default, reuseIdentifier: ScorecardCell.identifier)
        cell.scorecard = scoreCardData[indexPath.row]
        return cell
    }
}
