//
//  ViewController.swift
//  Flixster Pt. 2
//
//  Created by TizzyMatic on 3/9/23.
//

import UIKit

class MovieViewController: UIViewController, UITableViewDataSource {
    var movies: [Movie] = []
    @IBOutlet weak var tableView: UITableView!
    
    
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
                    self?.tableView.reloadData()
                }
                print("\(movies)")
            
            } catch {
                print("❌ Error parsing JSON: \(error.localizedDescription)")
            }
        }
        task.resume()
        
        tableView.dataSource = self
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        let movie = movies[indexPath.row]
        cell.configure(with: movie)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell,
           let indexPath = tableView.indexPath(for: cell),
           let detailViewController = segue.destination as? DetailViewController {
            let movie = movies[indexPath.row]
            detailViewController.movie = movie
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}


