//
//  SearchService.swift
//  github-search-demo
//
//  Created by Luong Nghia on 2/17/20.
//  Copyright © 2020 Luong Nghia. All rights reserved.
//

import Foundation
import Combine

class SearchService {
    private let session: URLSession
    private let decoder: JSONDecoder
    
    init(session: URLSession = .shared,
         decoder: JSONDecoder = .init()) {
        self.session = session
        self.decoder = decoder
    }
    
}

enum SearchError: Error {
    case network(description: String)
}

extension SearchService {
    func search(matching query: String) -> AnyPublisher<SearchResponse, Error> {
        guard let url = URL(string: "https://api.github.com/search/repositories?q=\(query)") else {
            let error = SearchError.network(description: "Could not create URL.")
            return Fail(error: error).eraseToAnyPublisher()
        }
        
        return session.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: SearchResponse.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
}
