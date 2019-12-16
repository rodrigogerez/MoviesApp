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
    @IBOutlet weak var moviesCollectionView: UICollectionView!
    
    var homeViewModel: HomeViewModel!
    var movies: [Movie]!
    
    var index: Int {
        return movieTypeSegmentedControl.selectedSegmentIndex
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMoviesFromAPI()
        setupUI()
    }
    
    // Set up all visual improvements
    func setupUI() {
        moviesCollectionView.dataSource = self
        moviesCollectionView.delegate = self
    }
    
    @IBAction func movieTypeChanged(_ sender: UISegmentedControl) {
        fetchMoviesFromAPI()
    }
    
    func fetchMoviesFromAPI()
    {
        homeViewModel = HomeViewModel(index)
        let group = DispatchGroup()
        
        
        DispatchQueue.global().async {
            group.enter()
            self.homeViewModel.fetchMovies(completion: { (mov) in
                self.movies = mov
            }) { (error) in
                print(error.localizedDescription)
            }
            
            group.leave()
        }
        
        group.wait()
        moviesCollectionView.reloadData()
    }
}

extension HomeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies?.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = "Item"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! MovieCell
        if let movies = movies {
            let url = URL(string: "\(K.ImageConstants.baseImageURL)\(movies[indexPath.row].posterPath)")!
            let result = homeViewModel.downloadImage(from: url)
            
            switch result {
            case .success(let data):
                cell.itemImage.image = data
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        
         return cell
    }
}

extension HomeViewController: UICollectionViewDelegate {
    
}
