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
            
            List {
                //                VStack(alignment: .center) {
                HStack(alignment: .center) {
                    TextField("search me now ... ", text: $viewModel.searchText)
                }
                //                }
                
                Section {
                    ForEach(self.viewModel.dataSource, content: SearchResultRow.init)
                }
            }
            .navigationBarTitle("Search")
        }
    }
}
