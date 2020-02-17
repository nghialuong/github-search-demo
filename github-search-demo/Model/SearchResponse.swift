//
//  SearchRespone.swift
//  github-search-demo
//
//  Created by Luong Nghia on 2/17/20.
//  Copyright © 2020 Luong Nghia. All rights reserved.
//

import Foundation

struct SearchResponse: Decodable {
    let items: [Repository]
}
