//
//  SearchViewController+DataSource.swift
//  AgoraVai1
//
//  Created by vivi on 20/07/22.
//

import UIKit

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as? SeachTableViewCell{
            let movie = searchMovies[indexPath.item]
            
            cell.setup(title: movie.title, date: movie.releaseDate ??  "", image: UIImage())
            
            Task {
                let imageData = await Movie.downloadImageData(withPath: movie.posterPath ?? "")
                let imagem = UIImage(data: imageData) ?? UIImage()
                
                cell.setup(title: movie.title,
                           date: searchMovies[indexPath.item].releaseDate ?? "",
                           image: imagem)
            }
            
            return cell
            
        }
        return UITableViewCell()
    }
    
}
