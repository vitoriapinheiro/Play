//
//  TrendingViewController+UICollectionViewDelegate.swift
//  AgoraVai1
//
//  Created by vivi on 20/07/22.
//

import UIKit

extension TrendingViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let movie: Movie
        
        movie = trendingMovies[indexPath.item]
        
        self.performSegue(withIdentifier: "detailsSegue", sender: movie)
    }
}
