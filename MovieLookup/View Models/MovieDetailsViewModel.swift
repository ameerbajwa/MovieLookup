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
    
    var moviePosterUrl: String {
        return movieDetailsModel.Poster
    }

    var movieTitle: String {
        return movieDetailsModel.Title
    }
    
    var movieDateReleased: String {
        return movieDetailsModel.Released
    }
    
    var movieRating: String {
        return movieDetailsModel.Rated
    }
    
    var movieRunTime: String {
        return movieDetailsModel.Runtime
    }
    
    var movieDirector: String {
        return movieDetailsModel.Director
    }
    
    var movieWriters: String {
        return movieDetailsModel.Writer
    }
    
    var movieActors: String {
        return movieDetailsModel.Actors
    }
    
    var moviePlot: String {
        return movieDetailsModel.Plot
    }
    
    var movieImdbRating: String {
        return movieDetailsModel.imdbRating
    }
    
    var movieBoxOffice: String {
        return movieDetailsModel.BoxOffice
    }
    
    var movieProduction: String {
        return movieDetailsModel.Production
    }
    
    func setImage(stringUrl: String) -> Data? {
        guard let imageURL = URL(string: stringUrl) else { return nil }
        guard let imageData = try? Data(contentsOf: imageURL) else { return nil }

        return imageData
    }
    
}
