//
//  HomeViewController.swift
//  Movies
//
//  Created by Rodrigo Gerez on 26/11/2019.
//  Copyright © 2019 Rodrigo Gerez. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var movieTypeSegmentedControl: UISegmentedControl!
    
    var homeViewModel: HomeViewModel!
    var movies: [Movie]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        homeViewModel = HomeViewModel(movieTypeSegmentedControl.tag)
        homeViewModel.fetchMovies(completion: { (mov) in
            self.movies = mov
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    // Set up all visual improvements
    func setupUI() {
        
    }
}
