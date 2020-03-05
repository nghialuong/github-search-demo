//
//  SearchView.swift
//  github-search-demo
//
//  Created by Luong Nghia on 2/17/20.
//  Copyright © 2020 Luong Nghia. All rights reserved.
//

import SwiftUI
import Combine

struct SearchView: View {
    @ObservedObject private var viewModel: SearchViewModel
    
    init(viewModel: SearchViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            VStack() {
                TextField("search me now ... ", text: $viewModel.searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                List {
                    Section {
                        ForEach(self.viewModel.dataSource, content: SearchResultRow.init)
                    }
                }
            }.padding()
                .navigationBarTitle("Search")
        }
    }
}
