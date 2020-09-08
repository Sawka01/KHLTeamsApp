//
//  TeamsCell.swift
//  KHLTeamsApp
//
//  Created by Macbook on 06.09.2020.
//  Copyright © 2020 Sawka uz. All rights reserved.
//

import UIKit

class TeamsCell: UITableViewCell {
    
    @IBOutlet var teamImage: ImageView!
    @IBOutlet var teamName: UILabel!
    @IBOutlet var teamLocation: UILabel!
    @IBOutlet var teamConference: UILabel!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet var teamView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        teamView.customViews()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
    }
    
    func configure(team: [Team], indexPath: IndexPath) {
        
        teamName.text = team[indexPath.row].team.name
        teamLocation.text = team[indexPath.row].team.location
        teamConference.text = team[indexPath.row].team.conference
        teamImage.fetchImage(with: team[indexPath.row].team.image)
    }
}

extension UIView {
    
    func customViews() {
        self.layer.cornerRadius = self.frame.size.height / 4
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 5
        self.layer.shadowOffset = CGSize(width: 1, height: 5)
        self.layer.shadowColor = UIColor.white.cgColor
        
    }
}
