//
//  FeaturedViewController+UICollectionViewDelegate.swift
//  ToWatch
//
//  Created by vivi on 13/07/22.
//

import UIKit

extension FeaturedViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie: Movie
        
        if collectionView == popularCollectionView {
            print(popularMovies[indexPath.item])
            movie = popularMovies[indexPath.item]
        } else {
            print(nowPlayingMovies[indexPath.item])
            movie = nowPlayingMovies[indexPath.item]
        }
        self.performSegue(withIdentifier: "detailsSegue", sender: movie)
    }
}
