//
//  MovieListController.swift
//  MovieLookup
//
//  Created by Ameer Bajwa on 5/11/21.
//  Copyright © 2021 Ameer Bajwa. All rights reserved.
//

import Foundation
import UIKit

class MovieListController: UIViewController {

    @IBOutlet weak var movieListTableView: UITableView!
    var movieListItemsViewModel: MovieListViewModel?
    var movieDetailsViewModel: MovieDetailsViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        movieListTableView.register(MovieListCell.self, forCellReuseIdentifier: "movieListCell")
        movieListTableView.delegate = self
        movieListTableView.dataSource = self
        DispatchQueue.main.async {
            self.movieListTableView.reloadData()
        }
    }

}

extension MovieListController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieListItemsViewModel?.getCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = movieListTableView.dequeueReusableCell(withIdentifier: "movieListCell", for: indexPath) as? MovieListCell
        cell?.movieListItemViewModel = movieListItemsViewModel?.movieListViewModel[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        if let imdbId = self.movieListItemsViewModel?.movieListViewModel[indexPath.row].imdbID {
            callGetMovieAPI(movieId: imdbId)
        }
    }

}

extension MovieListController {
    
    func callGetMovieAPI(movieId: String) {
        WebService().getMovie(movieIMDBId: movieId) { (movieDetails) in
            if let movieDetails = movieDetails {
                print(movieDetails)
                self.movieDetailsViewModel = MovieDetailsViewModel(movieDetails: movieDetails)
                print(self.movieDetailsViewModel?.movieTitle)
            }
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "movieDetailsSegue", sender: nil)
            }
        }
    }
    
}

extension MovieListController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "movieDetailsSegue" {
            let vc = segue.destination as! MovieDetailViewController
            vc.movieDetailsViewModel = self.movieDetailsViewModel
        }
    }
    
}
