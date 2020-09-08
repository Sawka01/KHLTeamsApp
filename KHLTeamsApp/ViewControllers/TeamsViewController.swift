//
//  ViewController.swift
//  KHLTeamsApp
//
//  Created by Macbook on 05.09.2020.
//  Copyright © 2020 Sawka uz. All rights reserved.
//

import UIKit
import Alamofire

class TeamsViewController: UIViewController {
    
    @IBOutlet var tableVIew: UITableView!
    
    private var teams: [Team] = []
    
    private let urlString = "https://khl.api.webcaster.pro/api/khl_mobile/teams_v2.json"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableVIew.rowHeight = 90
        
        NetworkManager.shared.fetchTeams(from: urlString) { teams in
            DispatchQueue.main.async {
                self.teams = teams
                self.tableVIew.reloadData()
            }
        }
    }
}

extension TeamsViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "team", for: indexPath) as! TeamsCell
        
        cell.configure(team: teams, indexPath: indexPath)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "detail" else { return }
        let detailVC = segue.destination as! TeamPlayersViewController
        
        if let indexPath = tableVIew.indexPathForSelectedRow {
            detailVC.team = teams[indexPath.row].team
        }
    }
}
