//
//  SearchViewModel.swift
//  github-search-demo
//
//  Created by Luong Nghia on 2/17/20.
//  Copyright © 2020 Luong Nghia. All rights reserved.
//

import Foundation
import Combine

class SearchViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var dataSource: [SearchResultRowViewModel] = []
    
    private let searchAPI: SearchProtocol
    private var disposable = Set<AnyCancellable>()
    
    init(searchAPI: SearchProtocol) {
        self.searchAPI = searchAPI
        $searchText
            .dropFirst(1)
            .debounce(for: .seconds(0.2), scheduler: DispatchQueue.main)
            .sink(receiveValue: search(with:))
            .store(in: &disposable)
    }
    
    func search(with query: String) {
        searchAPI.search(matching: query)
            .map { searchResponse in
                searchResponse.items.map(SearchResultRowViewModel.init)
        }
        .receive(on: DispatchQueue.main)
        .sink(receiveCompletion: { [weak self] value in
            guard let self = self else { return }
            switch value {
            case .failure:
                self.dataSource = []
            case .finished:
                break
            }
            
        }, receiveValue: { [weak self] repos in
            guard let self = self else { return }
            self.dataSource = repos
        })
            .store(in: &disposable)
    }
}

