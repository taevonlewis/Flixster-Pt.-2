//
//  DetailViewController.swift
//  Flixster Pt. 2
//
//  Created by TizzyMatic on 3/9/23.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {
    @IBOutlet weak var backdropImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var voteAverage: UILabel!
    @IBOutlet weak var votes: UILabel!
    @IBOutlet weak var popularity: UILabel!
    @IBOutlet weak var overview: UILabel!
    
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Nuke.loadImage(with: URL(string: "https://image.tmdb.org/t/p/w1280\(movie.backdropImage)")!, into: backdropImage)
        
        movieTitle.text = movie.title
        voteAverage.text = String(movie.voteAverage)+" Vote Average"
        votes.text = String(movie.voteCount)+" Votes"
        popularity.text = String(movie.popularity)+" Popularity"
        overview.text = movie.overview
    }
}
