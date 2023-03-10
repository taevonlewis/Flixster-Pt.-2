//
//  Posters.swift
//  Flixster Pt. 2
//
//  Created by TizzyMatic on 3/9/23.
//

import Foundation

struct PosterResponse: Decodable {
    let results: [Poster]
}

struct Poster: Decodable {
    let posterImage: String
    
    private enum CodingKeys: String, CodingKey {
        case posterImage = "poster_path"
    }
}
