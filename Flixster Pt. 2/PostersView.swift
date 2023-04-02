//
//  PostersView.swift
//  Flixster Pt. 2
//
//  Created by TaeVon Lewis on 3/27/23.
//

import SwiftUI

struct PostersView: View {
    @StateObject private var viewModel = MoviesViewModel()
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView {
                    let numberOfColumns = Int(geometry.size.width / 120)
                    let columns: [GridItem] = Array(repeating: .init(.adaptive(minimum: 100)), count: numberOfColumns)
                    
                    LazyVGrid(columns: columns) {
                        ForEach(viewModel.movies.indices, id: \.self) { index in
                            NavigationLink(destination: MovieDetailView(movie: viewModel.movies[index])) {
                                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w185\(viewModel.movies[index].poster_path)")) { phase in
                                    switch phase {
                                        case .empty:
                                            ProgressView()
                                        case .success(let image):
                                            image
                                                .resizable()
                                                .scaledToFit()
                                                .frame(height: 200)
                                                .cornerRadius(8)
                                        case .failure:
                                            Image(systemName: "photo")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(height: 200)
                                                .cornerRadius(8)
                                        @unknown default:
                                            fatalError()
                                    }
                                }
                            }
                        }
                    }
                }
                .navigationTitle("Posters")
                .navigationBarTitleDisplayMode(.inline)
                .background(.black)
                .toolbarBackground(Color.black, for: .tabBar)
            }
            .onAppear {
                viewModel.fetchMovies()
            }
        }
    }
}

struct PostersView_Previews: PreviewProvider {
    static var previews: some View {
        PostersView()
    }
}
