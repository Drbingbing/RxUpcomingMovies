//
//  ViewController.swift
//  RxUpcomingMovies
//
//  Created by Bing Bing on 2022/6/28.
//

import UIKit

class UpcomingMoviesViewController: UIViewController, Storyboarded {
    
    static var storyboardName: String { "UpcomingMovies" }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "UpcomingMovies"
    }


}

