//
//  SearchTableViewCell.swift
//  AgoraVai1
//
//  Created by vivi on 20/07/22.
//

import UIKit

class SeachTableViewCell: UITableViewCell {
    
    @IBOutlet var titlelabel: UILabel!
    @IBOutlet var  posterImage: UIImageView!
    @IBOutlet var dateLabel: UILabel!
    
    func setup(title: String, date: String, image: UIImage){
        self.titlelabel.text = title
        self.posterImage.image = image
        self.dateLabel.text = date
    }
    
}
