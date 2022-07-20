//
//  TrendingViewController.swift
//  AgoraVai1
//
//  Created by vivi on 20/07/22.
//

import UIKit

class TrendingViewController: UIViewController{
    
    var trendingMovies: [Movie] = []
    
    @IBOutlet var trendingCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        trendingCollectionView.dataSource = self
        trendingCollectionView.delegate = self
        
        Task{
            self.trendingMovies = await Movie.trendingMoviesAPI()
            self.trendingCollectionView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if let destination = segue.destination as? DetailsViewController {
            let movie = sender as? Movie
            destination.movie = movie
        }
    }
}
