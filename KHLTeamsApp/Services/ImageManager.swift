//
//  ImageManager.swift
//  KHLTeamsApp
//
//  Created by Macbook on 06.09.2020.
//  Copyright © 2020 Sawka uz. All rights reserved.
//

import Foundation

class ImageManager {
    
    static let shared = ImageManager()
    
    private init() {}
    
    func getImage(from url: URL, completion: @escaping(Data, URLResponse) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error { print(error); return }
            guard let data = data, let response = response else { return }
            guard let responseURL = response.url else { return }
            guard responseURL == url else { return }
            completion(data, response)
        }
    }
}
