//
//  SearchResultRowViewModel.swift
//  github-search-demo
//
//  Created by Luong Nghia on 2/17/20.
//  Copyright © 2020 Luong Nghia. All rights reserved.
//

import SwiftUI

class SearchResultRowViewModel: Identifiable {
    var id: Int {
        return item.id
    }
    private let item: Repository
    
    init(item: Repository) {
        self.item = item
    }
    
    var titleText: String {
        return item.name
    }
    
}

