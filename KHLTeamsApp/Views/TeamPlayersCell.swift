//
//  TeamPlayersCell.swift
//  KHLTeamsApp
//
//  Created by Macbook on 07.09.2020.
//  Copyright © 2020 Sawka uz. All rights reserved.
//

import UIKit

class TeamPlayersCell: UICollectionViewCell {
    
    @IBOutlet var playerImage: ImageView!
    @IBOutlet var playerName: UILabel!
    @IBOutlet var cellView: UIView!
    
    func configure(player: Player) {
        playerName.text = player.player.name
        playerImage.fetchImage(with: player.player.image)
        playerImage.layer.cornerRadius = 15
    }
    
}
