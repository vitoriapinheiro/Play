//
//  FeaturedViewController+UICollectionViewDataSource.swift
//  AgoraVai1
//
//  Created by Alessandra Pereira on 12/07/22.
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
        
        if collectionView == popularCollectionView {
            return makePopularCell(indexPath)
        } else if collectionView == nowPlayingCollectionView {
            return makeNowPlayingCell(indexPath)
        }
        
        return UICollectionViewCell()
    }
    
    fileprivate func makePopularCell(_ indexPath: IndexPath) -> PopularCollectionViewCell {
        if let cell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.cellIdentifier, for: indexPath) as? PopularCollectionViewCell {
            
            cell.setup(title: popularMovies[indexPath.item].title,
                       image: UIImage())
            let movie = popularMovies[indexPath.item]
            
            Task {
                let imageData = await Movie.downloadImageData(withPath: movie.backdropPath ?? "")
                let imagem = UIImage(data: imageData) ?? UIImage()
                
                cell.setup(title: movie.title, image: imagem)
            }
            return cell
        }
        return PopularCollectionViewCell()
    }
    
    fileprivate func makeNowPlayingCell(_ indexPath: IndexPath) -> NowPlayingCollectionViewCell {
        if let cell = nowPlayingCollectionView.dequeueReusableCell(withReuseIdentifier: NowPlayingCollectionViewCell.cellIdentifier, for: indexPath) as? NowPlayingCollectionViewCell {
                        
            cell.setup(title: nowPlayingMovies[indexPath.item].title,
                       year: nowPlayingMovies[indexPath.item].releaseDate ?? "",
                       image: UIImage(named: nowPlayingMovies[indexPath.item].posterPath ?? "") ?? UIImage())
            
            let movie = nowPlayingMovies[indexPath.item]
            
            Task {
                let imageData = await Movie.downloadImageData(withPath: movie.posterPath ?? "")
                let imagem = UIImage(data: imageData) ?? UIImage()
                
                cell.setup(title: movie.title,
                           year: nowPlayingMovies[indexPath.item].releaseDate ?? "",
                           image: imagem)
            }
            return cell
        }
        return NowPlayingCollectionViewCell()
    }
    
    
    
}
