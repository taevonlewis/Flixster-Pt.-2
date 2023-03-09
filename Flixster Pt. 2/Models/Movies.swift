//
//  Movies.swift
//  Flixster Pt. 2
//
//  Created by TizzyMatic on 3/9/23.
//

import Foundation

struct MoviesResponse: Decodable {
    let results: [Movie]
}

struct Movie: Decodable {
    // Initial View Properties
    let title: String
    let posterImage: String
    let overview: String
    
    // Detail View Properties
    let backdropImage: String
    let voteAverage: Double
    let voteCount: Int
    let popularity: Double
    
    enum CodingKeys: String, CodingKey {
            case title
            case overview
            case posterImage = "poster_path"
            case backdropImage = "backdrop_path"
            case voteAverage = "vote_average"
            case voteCount = "vote_count"
            case popularity
        }
}
