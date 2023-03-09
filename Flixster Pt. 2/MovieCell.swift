//
//  MovieCell.swift
//  Flixster Pt. 2
//
//  Created by TizzyMatic on 3/9/23.
//

import UIKit
import Nuke

class MovieCell: UITableViewCell {
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDesc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(with movie: Movie) {
        movieTitle.text = movie.title
        movieDesc.text = movie.overview
        
        
        Nuke.loadImage(with: URL(string: "https://image.tmdb.org/t/p/w185\(movie.posterImage)")!, into: posterImage)
    }
}
