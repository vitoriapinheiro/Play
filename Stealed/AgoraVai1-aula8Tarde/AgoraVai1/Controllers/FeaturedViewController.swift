//
//  FeaturedViewController.swift
//  AgoraVai1
//
//  Created by Alessandra Pereira on 05/07/22.
//

import UIKit

class FeaturedViewController: UIViewController {

    var popularMovies: [Movie] = [] // = Movie.popularMovies()
    var nowPlayingMovies: [Movie] = []
    
    @IBOutlet var popularCollectionView: UICollectionView!
    @IBOutlet var nowPlayingCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        popularCollectionView.dataSource = self
        nowPlayingCollectionView.dataSource = self
        
        popularCollectionView.delegate = self
        nowPlayingCollectionView.delegate = self
        
        Task {
            self.popularMovies = await Movie.popularMoviesAPI()
            self.popularCollectionView.reloadData()
        }
        
        Task {
            self.nowPlayingMovies = await Movie.nowPlayingMoviesAPI()
            self.nowPlayingCollectionView.reloadData()
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //passar o filme adiante
        if let destination = segue.destination as? DetailsViewController {
            let movie = sender as? Movie
            destination.movie = movie
        }
    }
    
}

