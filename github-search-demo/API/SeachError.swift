//
//  SeachError.swift
//  github-search-demo
//
//  Created by Luong Nghia on 3/2/20.
//  Copyright © 2020 Luong Nghia. All rights reserved.
//

import Foundation

enum SearchError: Error {
    case network(description: String)
    case unknow(description: String)
}
