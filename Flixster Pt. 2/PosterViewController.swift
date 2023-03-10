//
//  PosterViewController.swift
//  Flixster Pt. 2
//
//  Created by TizzyMatic on 3/9/23.
//

import UIKit
import Nuke

class PosterViewController: UIViewController, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        posters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCell
        let poster = posters[indexPath.item]
        Nuke.loadImage(with: URL(string: "https://image.tmdb.org/t/p/w185\(poster.posterImage)")!, into: cell.posterImageView)
        
        return cell
    }
    
    var posters: [Poster] = []
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
                let response = try decoder.decode(PosterResponse.self, from: data)
                let posters = response.results
                
                DispatchQueue.main.async {
                    self?.posters = posters
                    self?.collectionView.reloadData()
                }
                print("\(posters)")
            
            } catch {
                print("❌ Error parsing JSON: \(error.localizedDescription)")
            }
        }
        task.resume()
        
        collectionView.dataSource = self
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumInteritemSpacing = 4
        layout.minimumLineSpacing = 4
        let numberOfColumns: CGFloat = 3
        let width = (collectionView.bounds.width - layout.minimumInteritemSpacing * (numberOfColumns - 1)) / numberOfColumns
        layout.itemSize = CGSize(width: width, height: width)
    }
}
