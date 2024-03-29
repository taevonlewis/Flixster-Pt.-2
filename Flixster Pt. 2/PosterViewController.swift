//
//  PosterViewController.swift
//  Flixster Pt. 2
//
//  Created by TizzyMatic on 3/9/23.
//

import UIKit
import Nuke

class PosterViewController: UIViewController, UICollectionViewDataSource {
//    var posters: [Poster] = []
    var movies: [Movie] = []
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=0d212d88be86314d135898eb90179907")!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { [ weak self ] data, response, error in
            if let error = error {
                print("Network error: \(error.localizedDescription)")
            }
            
            guard let data = data else {
                print("Data is nil")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(MoviesResponse.self, from: data)
                let movies = response.results
                
                DispatchQueue.main.async {
                    self?.movies = movies
                    self?.collectionView.reloadData()
                }
                print("\(movies)")
            
            } catch {
                print("❌ Error parsing JSON: \(error.localizedDescription)")
            }
        }
        task.resume()
        
        collectionView.dataSource = self
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 4
        let numberOfColumns: CGFloat = 3
        let width = (collectionView.bounds.width / numberOfColumns)
        layout.itemSize = CGSize(width: width, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCell
        let movie = movies[indexPath.item]
        Nuke.loadImage(with: URL(string: "https://image.tmdb.org/t/p/w185\(movie.posterImage)")!, into: cell.posterImageView)
        
        return cell
    }
    
    // MARK: - Navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let cell = sender as? UICollectionViewCell,
                let indexPath = collectionView.indexPath(for: cell),
                let detailViewController = segue.destination as? DetailViewController {
                let movie = movies[indexPath.item]
                detailViewController.movie = movie
            }
        }
}
