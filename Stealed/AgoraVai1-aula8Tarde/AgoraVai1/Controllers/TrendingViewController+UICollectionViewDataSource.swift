//
//  TrendingViewController+UICollectionViewDataSource.swift
//  AgoraVai1
//
//  Created by vivi on 20/07/22.
//

import UIKit
extension TrendingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == trendingCollectionView {
            return trendingMovies.count
        } else {
            return 0
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        if collectionView == trendingCollectionView{
            return makeTrendingCell(indexPath)
        }
        return UICollectionViewCell()
    }
    
    fileprivate func makeTrendingCell(_ indexPath: IndexPath) -> TrendingCollectionViewCell {
        if let cell = trendingCollectionView.dequeueReusableCell(withReuseIdentifier: TrendingCollectionViewCell.cellIdentifier, for: indexPath) as? TrendingCollectionViewCell{
            cell.setup(title: trendingMovies[indexPath.item].title,
                       year: "\(trendingMovies[indexPath.item].releaseDate.prefix(4))",
                       image: UIImage(named: trendingMovies[indexPath.item].posterPath) ?? UIImage())
            
            let movie = trendingMovies[indexPath.item]
            
            Task {
                let imageData = await Movie.downloadImageData(withPath: movie.posterPath)
                let imagem = UIImage(data: imageData) ?? UIImage()
                
                cell.setup(title: movie.title,
                           year: "\(trendingMovies[indexPath.item].releaseDate.prefix(4))",
                           image: imagem)
            }
            return cell
        }
        return TrendingCollectionViewCell()
    }
}
