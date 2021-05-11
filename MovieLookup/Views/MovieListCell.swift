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

    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieYearLabel: UILabel!
    @IBOutlet weak var moviePosterImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    var movieListItemViewModel: MovieListItemViewModel! {
        didSet {
            movieTitleLabel.text = movieListItemViewModel.title
            movieYearLabel.text = movieListItemViewModel.year
            moviePosterImageView.image = UIImage(data: movieListItemViewModel.setImage(stringUrl: movieListItemViewModel.poster)!) // UIImage(data: eventViewModel.setImage(stringUrl: eventViewModel.imageStringUrls[0])!)
        }
    }

}
