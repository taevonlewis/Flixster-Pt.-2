//
//  MovieDetailView.swift
//  Flixster Pt. 2
//
//  Created by TaeVon Lewis on 3/27/23.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                VStack {
                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w1280\(movie.backdrop_path)")) { phase in
                        switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geometry.size.width)
                            case .failure:
                                Image(systemName: "photo")
                                    .resizable()
                                    .scaledToFit()
                            @unknown default:
                                fatalError()
                        }
                    }
                    Text(movie.title)
                        .font(.title2)
                }
                HStack(spacing: 50) {
                    VStack {
                        Text(String(format: "%.1f", movie.vote_average) + " Vote Average")
                        Text(String(movie.vote_count) + " Vote Count")
                    }
                    Text(String(movie.popularity) + " Popularity")
                }
                .padding(.bottom)
                Text(movie.overview)
                    .font(.body)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
            .background(Color.black)
            .foregroundColor(.white)
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie:
                            Movie(title: "M3GAN",
                                  poster_path: "https://image.tmdb.org/t/p/w185/d9nBoowhjiiYc4FBNtQkPY7c11H.jpg",
                                  overview: "A brilliant toy company roboticist uses artificial intelligence to develop M3GAN, a life-like doll programmed to emotionally bond with her newly orphaned niece. But when the doll's programming works too well, she becomes overprotective of her new friend with terrifying results.",
                                  backdrop_path: "https://image.tmdb.org/t/p/w185/q2fY4kMXKoGv4CQf310MCxpXlRI.jpg",
                                  vote_average: 7.5,
                                  vote_count: 1822,
                                  popularity: 1103.359))
    }
}

