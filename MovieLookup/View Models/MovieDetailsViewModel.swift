//
//  MovieDetailsViewModel.swift
//  MovieLookup
//
//  Created by Ameer Bajwa on 5/29/21.
//  Copyright © 2021 Ameer Bajwa. All rights reserved.
//

import Foundation

struct MovieDetailsViewModel {
    
    private let movieDetailsModel: MovieDetails
    
    init(movieDetails: MovieDetails) {
        self.movieDetailsModel = movieDetails
    }

    var title: String {
        return movieDetailsModel.Title
    }
    
}
