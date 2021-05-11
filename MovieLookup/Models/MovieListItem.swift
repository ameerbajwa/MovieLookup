//
//  MovieListItem.swift
//  MovieLookup
//
//  Created by Ameer Bajwa on 5/11/21.
//  Copyright © 2021 Ameer Bajwa. All rights reserved.
//

import Foundation

struct MovieList: Decodable {
    var Search: [MovieListItem]
    var totalResults: String
    var Response: String
}

struct MovieListItem: Decodable {
    var Title: String
    var Year: String
    var Poster: String
    var imdbID: String
}
