//
//  FeaturedViewController+UICollectionViewDataSource.swift
//  ToWatch
//
//  Created by vivi on 12/07/22.
//

import UIKit

extension FeaturedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == popularCollectionView {
            return popularMovies.count
        } else if collectionView == nowPlayingCollectionView {
            return nowPlayingMovies.count
        } else {
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == popularCollectionView{
            return makePopularCell()
        } else if collectionView == nowPlayingCollectionView {
            if let cell = nowPlayingMovies.dequeueReusableCell(withReuseIdentifier: "nowPlayingCell", for:  indexPath) as? NowPlayingCollectionViewCell {
                
                cell.setup(title: titulo,
                           year: "\nowPlayingMovies[indexPath.item].releaseDate.prefix(4)",
                           image: UIImage(named: nowPlayingMovies[indexPath.item].poster)
                
                return cell
            }
            return UICollectionViewCell()
        }
        return UICollectionViewCell()
    }
    
    fileprivate func makePopularCell() -> UICollectionViewCell {
        if let cell =  popularCollectionView.dequeueReusableCell(withReuseIdentifier: "popularCell", for: IndexPath) as? PopularCollectionViewCell {
            
            cell.setup(title: popularMovies[indexPath.item].title,
                       image: UIImage(named: popularMovies[indexPath.item].backdrop ?? UIImage()))
            
            return cell
        }
        return PopularCollectionViewCell()
    }
    
//    fileprivate func makeNowPlayingCell(_
    )
    
}
