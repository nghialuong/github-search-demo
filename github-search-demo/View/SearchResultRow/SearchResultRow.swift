//
//  SearchResultRowView.swift
//  github-search-demo
//
//  Created by Luong Nghia on 2/17/20.
//  Copyright © 2020 Luong Nghia. All rights reserved.
//

import SwiftUI

struct SearchResultRow: View, Identifiable {
    var id = UUID()
    
    private let viewModel: SearchResultRowViewModel
    
    init(viewModel: SearchResultRowViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack {
            Text("\(viewModel.titleText)")
        }
    }
}
