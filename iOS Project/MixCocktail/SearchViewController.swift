//
//  SearchViewController.swift
//  MixCocktail
//
//  Created by LiangMinglong on 1/09/2016.
//  Copyright © 2016 LiangMinglong. All rights reserved.
//

import UIKit
import LeanCloud

class SearchViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func reloadTableView(searchString: String) {
        
    }
 
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
 
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        print("输入的字符串 = \(searchBar.text)")
        
        if LCUser.current != nil {
            reloadTableView(searchBar.text!)
        }
    
}

}