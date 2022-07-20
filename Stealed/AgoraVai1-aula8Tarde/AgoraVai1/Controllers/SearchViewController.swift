//
//  SearchViewController.swift
//  AgoraVai1
//
//  Created by vivi on 20/07/22.
//

import UIKit

class SearchViewController: UIViewController, UISearchResultsUpdating{
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
    
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        
        print(text)
    }
    
}
