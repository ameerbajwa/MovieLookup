//
//  MovieLookupViewController.swift
//  MovieLookup
//
//  Created by Ameer Bajwa on 5/10/21.
//  Copyright © 2021 Ameer Bajwa. All rights reserved.
//

import Foundation
import UIKit

class MovieLookUpController: UIViewController, MovieSearchButtonDelegate {

    var activityIndicator: BaseActivityIndicator?
    
    var movieSearchView = MovieSearchView()
    var movieListItemsViewModel = MovieListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Movie Lookup"
        self.view.addSubview(movieSearchView)
        movieSearchView.translatesAutoresizingMaskIntoConstraints = false
        movieSearchView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        movieSearchView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        movieSearchView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        movieSearchView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        movieSearchView.delegate = self
        movieSearchView.setUpUI()
    }

    func movieSearchButtonClicked() {
        
        DispatchQueue.main.async {
            self.activityIndicator?.showActivityIndicator()
        }
        
        if let movieSearchText = movieSearchView.movieSearchTextField.text {
            print(movieSearchText)
            WebService().searchIMDB(movieSearchTerm: movieSearchText) { movieList in
                if let movieList = movieList {
                    self.movieListItemsViewModel.movieListViewModel = movieList.Search.map(MovieListItemViewModel.init)
                    print(self.movieListItemsViewModel.movieListViewModel)
                    DispatchQueue.main.async {
                        self.activityIndicator?.hideActivityIndicator()
                        self.performSegue(withIdentifier: "movieListSegue", sender: nil)
                    }
                }
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "movieListSegue" {
            let vc = segue.destination as! MovieListController
            vc.movieListItemsViewModel = movieListItemsViewModel
        }
    }


}
