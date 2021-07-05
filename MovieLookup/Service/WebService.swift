//
//  WebService.swift
//  MovieLookup
//
//  Created by Ameer Bajwa on 5/11/21.
//  Copyright © 2021 Ameer Bajwa. All rights reserved.
//

import Foundation

class WebService {
    
    func searchIMDB(movieSearchTerm: String, onSuccess: @escaping ((MovieList?) -> Void), onFailure: @escaping (Error) -> Void ) {
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
                print("error: \(error!)")
//                completion(nil)
                onFailure(error!)
                return
            }
            var movies: MovieList?
            do {
                movies = try JSONDecoder().decode(MovieList.self, from: data)
            } catch {
                onFailure(error)
            }
            movies == nil ? onSuccess(nil) : onSuccess(movies) // completion(nil)
        })
        dataTask.resume()
    }
    
    func getMovie(movieIMDBId: String, completion: @escaping ((MovieDetails?) -> Void)) {
        let headers = [
            "x-rapidapi-key": APIKeys.rapidApiKey,
            "x-rapidapi-host": APIKeys.rapidApiHost
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://movie-database-imdb-alternative.p.rapidapi.com/?i=\(movieIMDBId)&r=json")! as URL,
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
            var movie: MovieDetails?
            do {
                movie = try JSONDecoder().decode(MovieDetails.self, from: data)
            } catch {
                print("unexpected error: \(error).")
            }
            movie == nil ? completion(nil) : completion(movie)
        })
        dataTask.resume()
    }
    
}
