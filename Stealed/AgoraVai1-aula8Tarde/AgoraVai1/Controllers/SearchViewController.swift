//
//  SearchViewController.swift
//  AgoraVai1
//
//  Created by vivi on 20/07/22.
//

import UIKit

class SearchViewController: UIViewController{
    
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.navigationItem.searchController = searchController
    
    }
    
}
