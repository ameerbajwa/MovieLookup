//
//  MovieListItemViewModel.swift
//  MovieLookup
//
//  Created by Ameer Bajwa on 5/11/21.
//  Copyright © 2021 Ameer Bajwa. All rights reserved.
//

import Foundation

struct MovieListViewModel {
    var movieListViewModel: [MovieListItemViewModel]

    init() {
        self.movieListViewModel = [MovieListItemViewModel]()
    }

    func getCount() -> Int {
        return movieListViewModel.count
    }
}

struct MovieListItemViewModel {
    let movieListItem: MovieListItem

    var title: String {
        return self.movieListItem.Title
    }
    var year: String {
        return self.movieListItem.Year
    }
    var poster: String {
        return self.movieListItem.Poster
    }
    var imdbID: String {
        return self.movieListItem.imdbID
    }

    func setImage(stringUrl: String) -> Data? {
        guard let imageURL = URL(string: stringUrl) else { return nil }
        guard let imageData = try? Data(contentsOf: imageURL) else { return nil }

        return imageData
    }
}
