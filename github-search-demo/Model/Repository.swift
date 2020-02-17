//
//  Repository.swift
//  github-search-demo
//
//  Created by Luong Nghia on 2/17/20.
//  Copyright © 2020 Luong Nghia. All rights reserved.
//

import Foundation

struct Repository: Decodable {
    var id: Int
    let owner: Owner
    let name: String
    let description: String
    
    struct Owner: Decodable {
        let avatar: URL
        
        enum CodingKeys: String, CodingKey {
            case avatar = "avatar_url"
        }
    }
    
}



