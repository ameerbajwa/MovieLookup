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


}
