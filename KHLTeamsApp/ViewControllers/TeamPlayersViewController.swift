//
//  TeamPlayersViewController.swift
//  KHLTeamsApp
//
//  Created by Macbook on 07.09.2020.
//  Copyright © 2020 Sawka uz. All rights reserved.
//

import UIKit

class TeamPlayersViewController: UIViewController {
    
    @IBOutlet var teamName: UILabel!
    @IBOutlet var teamLocation: UILabel!
    @IBOutlet var teamImage: ImageView!
    @IBOutlet var collectionView: UICollectionView!
    
    var team: TeamDetails!
    var teamsPlayer: [Player] = []
    
    private let url = "https://khl.api.webcaster.pro/api/khl_mobile/players"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchTeamPlayersData()
        teamImage.fetchImage(with: team.image)
        teamName.text = team.name
        teamLocation.text = team.location
    }
    
    private func fetchTeamPlayersData() {
        
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            do {
                self.teamsPlayer = try JSONDecoder().decode([Player].self, from: data)
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                    self.teamsPlayer = self.filteredTeam(players: self.teamsPlayer)
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    private func filteredTeam(players: [Player]) -> [Player] {
        return players.filter{$0.player.team.name == team.name}
    }
    
}

extension TeamPlayersViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teamsPlayer.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TeamPlayersCell
        
        cell.configure(player: teamsPlayer[indexPath.row])
        cell.layer.cornerRadius = 15
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 120)
    }
    
}
