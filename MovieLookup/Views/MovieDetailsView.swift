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
    
    func setUp() {
        
        if let safeVM = vm {
            
            movieTitleLabel.text = safeVM.title
            movieTitleLabel.font = UIFont.boldSystemFont(ofSize: 18)
            
            self.addSubview(movieTitleLabel)
            movieTitleLabel.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
//                movieTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 50.0),
                movieTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                movieTitleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            ])
            
        }
        
    }
    
}
