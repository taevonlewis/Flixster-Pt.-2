//
//  ContentView.swift
//  Flixster Pt. 2
//
//  Created by TaeVon Lewis on 3/27/23.
//

import SwiftUI

struct MoviesView: View {
    @ObservedObject private var viewModel = MoviesViewModel()
    
    var body: some View {
        TabView {
            NavigationView {
                List {
                    ForEach(viewModel.movies.indices, id: \.self) { index in
                        NavigationLink(destination: MovieDetailView(movie: viewModel.movies[index])) {
                            HStack {
                                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w185\( viewModel.movies[index].poster_path)")) { phase in
                                    switch phase {
                                        case .empty:
                                            ProgressView()
                                        case .success(let image):
                                            image
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 100, height: 100)
                                        case .failure:
                                            Image(systemName: "photo")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 100, height: 100)
                                        @unknown default:
                                            fatalError()
                                    }
                                }
                                VStack(alignment: .leading) {
                                    Text(viewModel.movies[index].title)
                                        .font(.title2)
                                        .lineLimit(1)
                                    Text(viewModel.movies[index].overview)
                                        .font(.body)
                                        .lineLimit(3)
                                }
                                .padding(.init(top: 0, leading: -15, bottom: 0, trailing: 15))
                            }
                            .foregroundColor(.white)
                        }
                    }
                    .listRowBackground(Color.black)
                    .listRowSeparatorTint(Color.white)
                }
                .padding(EdgeInsets(top: -10, leading: -20, bottom: -10, trailing: -20))
                .listStyle(.plain)
                .navigationTitle("Movies")
                .navigationBarTitleDisplayMode(.inline)
            }
            .onAppear {
                viewModel.fetchMovies()
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
            .tabItem {
                Label("Movies", systemImage: "film")
            }
            .toolbarBackground(Color.black, for: .tabBar)
        }
    }
    
    init(){
        Theme.navigationBarColors(background: .black, titleColor: .white)
    }
}

    
struct Theme {
    static func navigationBarColors(background: UIColor = .clear,
                                    titleColor: UIColor = .black,
                                    tintColor: UIColor = .black) {
        
        let navigationAppearance = UINavigationBarAppearance()
        navigationAppearance.configureWithOpaqueBackground()
        navigationAppearance.backgroundColor = background
        
        navigationAppearance.titleTextAttributes = [.foregroundColor: titleColor]
        navigationAppearance.largeTitleTextAttributes = [.foregroundColor: titleColor]
        
        UINavigationBar.appearance().standardAppearance = navigationAppearance
        UINavigationBar.appearance().compactAppearance = navigationAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationAppearance
        
        UINavigationBar.appearance().tintColor = tintColor
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
