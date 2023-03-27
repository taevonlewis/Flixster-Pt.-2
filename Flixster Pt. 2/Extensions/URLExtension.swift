//
//  URLExtension.swift
//  Flixster Pt. 2
//
//  Created by TaeVon Lewis on 3/27/23.
//

import Foundation

extension URL {
    static func movieURL() -> URL? {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=0d212d88be86314d135898eb90179907") else {
            return nil
        }
        
        return url
    }
}
