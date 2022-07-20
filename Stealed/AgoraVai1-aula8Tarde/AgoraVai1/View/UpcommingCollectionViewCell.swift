//
//  UpcommingCollectionViewCell.swift
//  AgoraVai1
//
//  Created by vivi on 20/07/22.
//

import UIKit

class UpcommingCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "upcommingCell"
    
    @IBOutlet var image: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    func setup(title: String, image: UIImage){
        titleLabel.text = title
        self.image.image = image
    }
    
}
