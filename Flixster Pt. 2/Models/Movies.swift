//
//  Movies.swift
//  Flixster Pt. 2
//
//  Created by TizzyMatic on 3/9/23.
//

import Foundation

let posterBase: String = "https://image.tmdb.org/t/p/w185"
let backdropBase: String = "https://image.tmdb.org/t/p/w1280"

struct Movie {
    // Initial View Properties
    let title: String
    let posterImage: URL
    let description: String
    
    // Detail View Properties
    let backdropImage: URL
    let voteAverage: Double
    let voteCount: Int
    let popularity: Double
}

extension Movie {
    static var mockMovies: [Movie] = [
        Movie(title: "M3GAN", posterImage: URL(string:posterBase+"/d9nBoowhjiiYc4FBNtQkPY7c11H.jpg")!, description: "A brilliant toy company roboticist uses artificial intelligence to develop M3GAN, a life-like doll programmed to emotionally bond with her newly orphaned niece. But when the doll's programming works too well, she becomes overprotective of her new friend with terrifying results.", backdropImage: URL(string:backdropBase+"/q2fY4kMXKoGv4CQf310MCxpXlRI.jpg")!, voteAverage: 7.5, voteCount: 1822, popularity: 1103.359),
        Movie(title: "Shotgun Wedding", posterImage: URL(string:posterBase+"/t79ozwWnwekO0ADIzsFP1E5SkvR.jpg")!, description: "Darcy and Tom gather their families for the ultimate destination wedding but when the entire party is taken hostage, “’Til Death Do Us Part” takes on a whole new meaning in this hilarious, adrenaline-fueled adventure as Darcy and Tom must save their loved ones—if they don’t kill each other first.", backdropImage: URL(string:backdropBase+"/zGoZB4CboMzY1z4G3nU6BWnMDB2.jpg")!, voteAverage: 6.4, voteCount: 560, popularity: 1068.197),
        Movie(title: "The Whale", posterImage: URL(string:posterBase+"/jQ0gylJMxWSL490sy0RrPj1Lj7e.jpg")!, description: "A reclusive English teacher suffering from severe obesity attempts to reconnect with his estranged teenage daughter for one last chance at redemption.", backdropImage: URL(string:backdropBase+"/r7Dfg9aRZ78gJsmDlCirIIlNH3d.jpg")!, voteAverage: 7.9, voteCount: 573, popularity: 889.766),
        Movie(title: "Ant-Man and the Wasp: Quantumania", posterImage: URL(string:posterBase+"/ngl2FKBlU4fhbdsrtdom9LVLBXw.jpg")!, description: "Super-Hero partners Scott Lang and Hope van Dyne, along with with Hope's parents Janet van Dyne and Hank Pym, and Scott's daughter Cassie Lang, find themselves exploring the Quantum Realm, interacting with strange new creatures and embarking on an adventure that will push them beyond the limits of what they thought possible.", backdropImage: URL(string:backdropBase+"/3JSoB7eMbCd8sE8alxNiUtrNiTz.jpg")!, voteAverage: 6.5, voteCount: 788, popularity: 1055.125),
        Movie(title: "Viking Wolf", posterImage: URL(string:posterBase+"/abBDzmy35A3Nkupn6wK2DKyFamd.jpg")!, description: "After witnessing a grotesque murder at a party in her new town, a teenager starts having strange visions and bizarre desires.", backdropImage: URL(string:backdropBase+"/d0YSRmp819pMRnKLfGMgAQchpnR.jpg")!, voteAverage: 5.6, voteCount: 144, popularity: 781.717)
    ]
}
