//
//  SearchService.swift
//  github-search-demo
//
//  Created by Luong Nghia on 2/17/20.
//  Copyright © 2020 Luong Nghia. All rights reserved.
//

import Foundation
import Combine

protocol Searchable {
    func search(matching query: String) -> AnyPublisher<SearchResponse, Error>
}

class SearchService {
    private let session: URLSession
    private let decoder: JSONDecoder
    
    init(session: URLSession = .shared,
         decoder: JSONDecoder = .init()) {
        self.session = session
        self.decoder = decoder
    }
}

extension SearchService: Searchable {
    static let token = "cc9d8c65f8084835bee44ae518b38555566cefaf"
    
    func search(matching query: String) -> AnyPublisher<SearchResponse, Error> {
        guard let url = URL(string: "https://api.github.com/search/repositories?q=\(query)") else {
            let error = SearchError.network(description: "Could not create URL.")
            return Fail(error: error)
                .eraseToAnyPublisher()
        }
        var request = URLRequest(url: url)
        request.addValue(SearchService.token, forHTTPHeaderField: "Authorization")
        
        return session.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: SearchResponse.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
}
