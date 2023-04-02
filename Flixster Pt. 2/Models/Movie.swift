//
//  Movie.swift
//  Flixster Pt. 2
//
//  Created by TaeVon Lewis on 3/27/23.
//

import SwiftUI

struct Movies: Decodable {
    let results: [Movie]
}

struct Movie: Decodable {
        // Initial View Properties
    let title: String
    let poster_path: String
    let overview: String
    
        // Detail View Properties
    let backdrop_path: String
    let vote_average: Double
    let vote_count: Int
    let popularity: Double
}

