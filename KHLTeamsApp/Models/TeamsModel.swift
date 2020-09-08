//
//  TeamsModel.swift
//  KHLTeamsApp
//
//  Created by Macbook on 05.09.2020.
//  Copyright © 2020 Sawka uz. All rights reserved.
//

struct Team: Decodable {
    let team: TeamDetails
}

struct TeamDetails: Decodable {
    let name: String
    let location: String
    let conference: String
    let image: String
    let division: String?
}
