//
//  MovieDetailsView.swift
//  MovieLookup
//
//  Created by Ameer Bajwa on 5/29/21.
//  Copyright © 2021 Ameer Bajwa. All rights reserved.
//

import Foundation
import UIKit

class MovieDetailsView: UIView {
    
    var vm: MovieDetailsViewModel?
    
    var movieTitleLabel = UILabel()
    var movieDateReleasedLabel = UILabel()
    var moviePosterImageView = UIImageView()
    
    func setUp() {
        
        if let safeVM = vm {
            
            moviePosterImageView.image = UIImage(data: safeVM.setImage(stringUrl: safeVM.moviePosterUrl)!)
            
            self.addSubview(moviePosterImageView)
            moviePosterImageView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                moviePosterImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                moviePosterImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 25.0),
                moviePosterImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4),
                moviePosterImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.45)
            ])
            
            movieTitleLabel.attributedText = setUpLabel(label: Constants.MOVIE_TITLE_LABEL, labelValue: safeVM.movieTitle)
            movieTitleLabel.numberOfLines = 0
            
            self.addSubview(movieTitleLabel)
            movieTitleLabel.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                movieTitleLabel.topAnchor.constraint(equalTo: self.moviePosterImageView.bottomAnchor, constant: 25.0),
                movieTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15.0),
                movieTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15.0)
            ])
            
            movieDateReleasedLabel.attributedText = setUpLabel(label: Constants.MOVIE_DATE_RELEASED_LABEL, labelValue: safeVM.movieDateReleased)
            movieDateReleasedLabel.numberOfLines = 0
            
            self.addSubview(movieDateReleasedLabel)
            movieDateReleasedLabel.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                movieDateReleasedLabel.topAnchor.constraint(equalTo: self.movieTitleLabel.bottomAnchor, constant: 10.0),
                movieDateReleasedLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15.0),
                movieDateReleasedLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15.0)
            ])
            
        }
        
    }
    
    func setUpLabel(label: String, labelValue: String) -> NSMutableAttributedString {
        
        let fullLabel = NSMutableAttributedString()
        
        let labelAttributes = [NSAttributedString.Key.foregroundColor: UIColor.darkGray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)]
        let labelValueAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]
        
        fullLabel.append(NSAttributedString(string: "\(label)\n", attributes: labelAttributes))
        fullLabel.append(NSAttributedString(string: labelValue, attributes: labelValueAttributes))
        
        return fullLabel
        
    }
    
}
