//
//  MovieDetails.swift
//  MovieLookup
//
//  Created by Ameer Bajwa on 5/11/21.
//  Copyright © 2021 Ameer Bajwa. All rights reserved.
//

import Foundation

struct MovieDetails: Decodable {
    var Title: String
    var Year: String
    var Rated: String
    var Released: String
    var Runtime: String
    var Genre: String
    var Director: String
    var Writer: String
    var Actors: String
    var Plot: String
    var Country: String
    var Poster: String
    var Awards: String
    var Metascore: String
    var imdbRating: String
    var imdbID: String
    var DVD: String
    var BoxOffice: String
    var Production: String
}
