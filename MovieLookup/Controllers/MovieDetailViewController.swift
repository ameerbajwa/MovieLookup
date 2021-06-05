//
//  MovieDetailViewController.swift
//  MovieLookup
//
//  Created by Ameer Bajwa on 5/22/21.
//  Copyright © 2021 Ameer Bajwa. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let movieDetailsView = MovieDetailsView()
    var movieDetailsViewModel: MovieDetailsViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Movie Details"

        self.view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        self.scrollView.addSubview(movieDetailsView)
        movieDetailsView.translatesAutoresizingMaskIntoConstraints = false
        
        movieDetailsView.vm = movieDetailsViewModel
        movieDetailsView.setUp()
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor),
            
            movieDetailsView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            movieDetailsView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            movieDetailsView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            movieDetailsView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            movieDetailsView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor)
        ])
    
    }

}
