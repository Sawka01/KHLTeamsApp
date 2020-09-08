//
//  NetworkManager.swift
//  KHLTeamsApp
//
//  Created by Macbook on 06.09.2020.
//  Copyright © 2020 Sawka uz. All rights reserved.
//

import Alamofire

class NetworkManager {
    
    var teams: [Team] = []
    
    static let shared = NetworkManager()
    
    func fetchTeams(from urlString: String, with complition: @escaping([Team]) -> Void) {
        AF.request(urlString).validate().responseDecodable(of: [Team].self) { data in
            
            switch data.result {
            case .success(let team):
                complition(team)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
