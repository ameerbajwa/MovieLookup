//
//  MovieDetailViewController.swift
//  MovieLookup
//
//  Created by Ameer Bajwa on 5/22/21.
//  Copyright © 2021 Ameer Bajwa. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    let movieDetailsView = MovieDetailsView()
    var movieDetailsViewModel: MovieDetailsViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Movie Details"

        self.view.addSubview(movieDetailsView)
        movieDetailsView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            movieDetailsView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            movieDetailsView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            movieDetailsView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            movieDetailsView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        movieDetailsView.vm = movieDetailsViewModel
        movieDetailsView.setUp()
    }

}
