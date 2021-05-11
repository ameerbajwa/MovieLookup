//
//  MovieSearchView.swift
//  MovieLookup
//
//  Created by Ameer Bajwa on 5/11/21.
//  Copyright © 2021 Ameer Bajwa. All rights reserved.
//

import Foundation
import UIKit

protocol MovieSearchButtonDelegate {
    func movieSearchButtonClicked()
}

class MovieSearchView: UIView {

    var movieLookUpInstructionsLabel = UILabel()
    var movieSearchTextField = UITextField()
    var movieSearchButton = UIButton()

    var delegate: MovieSearchButtonDelegate?

    func setUpUI() {
        movieLookUpInstructionsLabel.text = "Use textfield to search for movie details"
        movieLookUpInstructionsLabel.font = UIFont.systemFont(ofSize: 20)
        movieLookUpInstructionsLabel.numberOfLines = 0

        self.addSubview(movieLookUpInstructionsLabel)
        movieLookUpInstructionsLabel.translatesAutoresizingMaskIntoConstraints = false
        movieLookUpInstructionsLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 75.0).isActive = true
        movieLookUpInstructionsLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true

        movieSearchTextField.placeholder = "Search by movie title"
        movieSearchTextField.font = UIFont.systemFont(ofSize: 16)
        movieSearchTextField.adjustsFontSizeToFitWidth = true
        movieSearchTextField.minimumFontSize = 12
        movieSearchTextField.textAlignment = .right
        movieSearchTextField.borderStyle = .bezel
        movieSearchTextField.keyboardType = .default

        self.addSubview(movieSearchTextField)
        movieSearchTextField.translatesAutoresizingMaskIntoConstraints = false
        movieSearchTextField.topAnchor.constraint(equalTo: self.movieLookUpInstructionsLabel.bottomAnchor, constant: 50.0).isActive = true
        movieSearchTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20.0).isActive = true
        movieSearchTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20.0).isActive = true
        movieSearchTextField.heightAnchor.constraint(equalToConstant: 40.0).isActive = true

        movieSearchButton.setTitle("Search", for: .normal)
        movieSearchButton.setTitleColor(UIColor.white, for: .normal)
        movieSearchButton.titleLabel?.font = UIFont.systemFont(ofSize: 16.0)
        movieSearchButton.backgroundColor = UIColor(red: 131/255, green: 198/255, blue: 95/255, alpha: 1.0)
        movieSearchButton.layer.cornerRadius = 5.0
        movieSearchButton.addTarget(self, action: #selector(movieSearchButtonTapped), for: .touchUpInside)

        self.addSubview(movieSearchButton)
        movieSearchButton.translatesAutoresizingMaskIntoConstraints = false
        movieSearchButton.topAnchor.constraint(equalTo: self.movieSearchTextField.bottomAnchor, constant: 50.0).isActive = true
        movieSearchButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        movieSearchButton.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        movieSearchButton.widthAnchor.constraint(equalToConstant: 80.0).isActive = true
    }

    @objc func movieSearchButtonTapped() {
        print("movieSearchButtonTapped")
        self.delegate?.movieSearchButtonClicked()
    }

}
