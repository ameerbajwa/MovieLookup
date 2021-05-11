//
//  MovieListCell.swift
//  MovieLookup
//
//  Created by Ameer Bajwa on 5/11/21.
//  Copyright © 2021 Ameer Bajwa. All rights reserved.
//

import Foundation
import UIKit

class MovieListCell: UITableViewCell {

    var movieTitleLabel = UILabel()
    var movieYearLabel = UILabel()
    var moviePosterImageView = UIImageView()
    
    var movieListItemViewModel: MovieListItemViewModel! {
        didSet {
            movieTitleLabel.text = movieListItemViewModel.title
            movieYearLabel.text = movieListItemViewModel.year
            moviePosterImageView.image = UIImage(data: movieListItemViewModel.setImage(stringUrl: movieListItemViewModel.poster)!) // UIImage(data: eventViewModel.setImage(stringUrl: eventViewModel.imageStringUrls[0])!)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpMovieImage()
        setUpMovieNameLabel()
        setUpMovieYearLabel()
        accessoryType = .disclosureIndicator
    }

    func setUpMovieImage() {
        addSubview(moviePosterImageView)
        moviePosterImageView.translatesAutoresizingMaskIntoConstraints = false
        
        moviePosterImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10.0).isActive = true
        moviePosterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20.0).isActive = true
        moviePosterImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10.0).isActive = true
        moviePosterImageView.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
//        moviePosterImageView.heightAnchor.constraint(equalToConstant: 140.0).isActive = true
    }
    
    func setUpMovieNameLabel() {
        movieTitleLabel.font = UIFont.systemFont(ofSize: 20)
        movieTitleLabel.numberOfLines = 0
        addSubview(movieTitleLabel)
        movieTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        movieTitleLabel.leadingAnchor.constraint(equalTo: moviePosterImageView.trailingAnchor, constant: 20.0).isActive = true
        movieTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20.0).isActive = true
        movieTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10.0).isActive = true
        movieTitleLabel.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
    }
    
    func setUpMovieYearLabel() {
        movieYearLabel.font = UIFont.systemFont(ofSize: 16)
        addSubview(movieYearLabel)
        movieYearLabel.translatesAutoresizingMaskIntoConstraints = false
        
        movieYearLabel.leadingAnchor.constraint(equalTo: moviePosterImageView.trailingAnchor, constant: 20.0).isActive = true
        movieYearLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20.0).isActive = true
        movieYearLabel.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 10.0).isActive = true
        movieYearLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20.0).isActive = true
    }

}
