//
//  MovieLookupTests.swift
//  MovieLookupTests
//
//  Created by Ameer Bajwa on 5/10/21.
//  Copyright © 2021 Ameer Bajwa. All rights reserved.
//

import XCTest
@testable import MovieLookup

class MovieLookupTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testMovieListViewModel() {
        let movieList = MovieList(Search: [MovieListItem(Title: "Star Wars", Year: "1980", Poster: "https://m.media-amazon.com/images/M/MV5BYmU1NDRjNDgtMzhiMi00NjZmLTg5NGItZDNiZjU5NTU4OTE0XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg", imdbID: "tt0080684"), MovieListItem(Title: "Lord of the Rings", Year: "2001", Poster: "https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_SX300.jpg", imdbID: "tt0120737")], totalResults: "2", Response: "SUCCESS")
        var movieListViewModel = MovieListViewModel()
        movieListViewModel.movieListViewModel = movieList.Search.map(MovieListItemViewModel.init)
        
        for index in 0..<movieList.Search.count {
            XCTAssertEqual(movieList.Search[index].Title, movieListViewModel.movieListViewModel[index].title)
            XCTAssertEqual(movieList.Search[index].imdbID, movieListViewModel.movieListViewModel[index].imdbID)
        }
    }
    
    func testMovieDetailsViewModel() {
        let movieDetails = MovieDetails(Title: "Star Wars", Year: "1980", Rated: "PG-13", Released: "1980", Runtime: "120 min", Genre: "Sci-Fi/Action", Director: "George Lucas", Writer: "George Lucas", Actors: "Harrison Ford, Mark Hamill, Carrie Fisher", Plot: "It's Star Wars", Country: "USA", Poster: "https://m.media-amazon.com/images/M/MV5BYmU1NDRjNDgtMzhiMi00NjZmLTg5NGItZDNiZjU5NTU4OTE0XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg", Awards: "13 awards", Metascore: "9.0", imdbRating: "10.0", imdbID: "tt0080684", DVD: "Yes", BoxOffice: "$5,000,000,000", Production: "LucasFilms")
        var movieDetailsViewModel = MovieDetailsViewModel(movieDetails: movieDetails)
        
        XCTAssertEqual(movieDetails.Title, movieDetailsViewModel.movieTitle)
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
