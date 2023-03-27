//
//  MoviesView.swift
//  Flixster Pt. 2
//
//  Created by TaeVon Lewis on 3/27/23.
//

import Foundation
import Combine

class MoviesViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    
    func fetchMovies() {
        MovieService().getMovies { result in
            switch result {
                case .success(let movie):
                    DispatchQueue.main.async {
                        self.movies = movie!
                    }
                case .failure(_ ):
                    print("Error")
            }
        }
    }
}

