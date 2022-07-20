//
//  TrendingCollectionViewCell.swift
//  AgoraVai1
//
//  Created by vivi on 20/07/22.
//

import UIKit

class TrendingCollectionViewCell: UICollectionViewCell{
    
    static let cellIdentifier = "trendingCell"

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    func setup(title: String, year: String, image: UIImage){
        titleLabel.text = title
        dateLabel.text = year
        imageView.image = image
    }
    
}
