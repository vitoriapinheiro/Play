//
//  DetailsViewController.swift
//  ToWatch
//
//  Created by vivi on 13/07/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var movie: Movie?
    
    @IBOutlet var backdropImage: UIImageView!
    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        guard let movie = movie else {
            return
        }
        
        self.title = movie.title
        
        backdropImage.image = UIImage(named: movie.backdrop)
        titleLabel.text = movie.title
        posterImage.image = UIImage(named: movie.poster)
        ratingLabel.text = "Rating: \(movie.voteAverage)/10"
        overviewLabel.text = movie.overview
        
        


        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
