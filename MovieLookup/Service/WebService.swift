//
//  WebService.swift
//  MovieLookup
//
//  Created by Ameer Bajwa on 5/11/21.
//  Copyright © 2021 Ameer Bajwa. All rights reserved.
//

import Foundation

class WebService {
    
    func searchIMDB(movieSearchTerm: String, completion: @escaping ((MovieList?) -> Void)) {
        let headers = [
            "x-rapidapi-key": APIKeys.rapidApiKey,
            "x-rapidapi-host": APIKeys.rapidApiHost
        ]

        let preparedMovieSearchString = movieSearchTerm.replacingOccurrences(of: " ", with: "%20")
        print(preparedMovieSearchString)

        let request = NSMutableURLRequest(url: NSURL(string: "https://movie-database-imdb-alternative.p.rapidapi.com/?s=\(preparedMovieSearchString)&page=1&r=json")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in

            guard let data = data, error == nil else {
                print("error: \(error)")
                completion(nil)
                return
            }
            var movies: MovieList?
            do {
                movies = try JSONDecoder().decode(MovieList.self, from: data)
            } catch {
                print("unexpected error: \(error).")
            }
            movies == nil ? completion(nil) : completion(movies)
        })
        dataTask.resume()
    }
}