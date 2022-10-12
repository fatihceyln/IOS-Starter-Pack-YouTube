//
//  APIURLs.swift
//  MVVM-Example
//
//  Created by Fatih Kilit on 9.10.2022.
//

import Foundation

enum APIURLs {
    static func movies(page: Int) -> String {
        "https://api.themoviedb.org/3/movie/popular?api_key=e112ed72df8da5c3b38e4e6579896bc6&language=en-US&page=\(page)"
    }
    
    static func imageURL(posterPath: String) -> String {
        "https://image.tmdb.org/t/p/w500\(posterPath)"
    }
    
    static func detail(id: Int) -> String {
        "https://api.themoviedb.org/3/movie/\(id)?api_key=e112ed72df8da5c3b38e4e6579896bc6&language=en-US"
    }
}
