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

    let spinner = SpinnerViewController()
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        self.movieSearchView.movieSearchButton.isEnabled = true
        self.movieSearchView.movieSearchTextField.isEnabled = true
    }

    func movieSearchButtonClicked() {
        
        DispatchQueue.main.async {
            self.spinner.createSpinnerView(view: self.view)
            self.movieSearchView.movieSearchButton.isEnabled = false
            self.movieSearchView.movieSearchTextField.isEnabled = false
        }
        
        if let movieSearchText = movieSearchView.movieSearchTextField.text {
            print(movieSearchText)
            WebService().searchIMDB(movieSearchTerm: movieSearchText) { movieList in
                if let movieList = movieList {
                    self.movieListItemsViewModel.movieListViewModel = movieList.Search.map(MovieListItemViewModel.init)
                    print(self.movieListItemsViewModel.movieListViewModel)
                    DispatchQueue.main.async {
                        self.spinner.dismissSpinnerView()
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
