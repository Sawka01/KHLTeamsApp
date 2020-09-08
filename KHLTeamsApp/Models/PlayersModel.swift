//
//  PlayersModel.swift
//  KHLTeamsApp
//
//  Created by Macbook on 07.09.2020.
//  Copyright © 2020 Sawka uz. All rights reserved.
//

struct Player: Decodable {
    let player: PlayerInfo
}

struct PlayerInfo: Decodable {
    let id: Int?
    let height: Int?
    let weight: Int?
    let age: Int?
    let shirt_number: Int?
    let team: Team2
    let image: String?
    let name: String?
    let role: String?
}

struct Team2: Decodable {
    let name: String?
    let location: String?
}

