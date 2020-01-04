//
//  HomeViewController.swift
//  Movies
//
//  Created by Rodrigo Gerez on 26/11/2019.
//  Copyright © 2019 Rodrigo Gerez. All rights reserved.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController {
    @IBOutlet weak var movieTypeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var moviesCollectionView: UICollectionView!
    
    var homeViewModel: HomeViewModel!
    var movieId: Int!
    
    var movies: [Movie]! {
        didSet
        {
            moviesCollectionView.reloadData()
        }
    }
    
    var index: Int {
        return movieTypeSegmentedControl.selectedSegmentIndex
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchMoviesFromAPI(self.index)
    }
    
    // Set up all visual improvements
    func setupUI() {
        moviesCollectionView.dataSource = self
        moviesCollectionView.delegate = self
    }
    
    @IBAction func movieTypeChanged(_ sender: UISegmentedControl) {
        fetchMoviesFromAPI(self.index)
    }
    
    func fetchMoviesFromAPI(_ index: Int)
    {
        homeViewModel = HomeViewModel(index)
        
        DispatchQueue.main.async {
            self.homeViewModel.fetchMovies(completion: { (mov) in
                self.movies = mov
            }) { (error) in
                print(error.localizedDescription)
            }
        }
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
        if let movies = movies, indexPath.row < movies.count,
            let posterPath = movies[indexPath.row].posterPath,
            let url = URL(string: "\(K.ImageConstants.baseImageURL)\(posterPath)") {
                cell.itemImage.kf.setImage(with: url)
            }
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        movieId = movies[indexPath.row].id
        performSegue(withIdentifier: "goToDetails", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailViewController = segue.destination as? DetailViewController else { return }
        detailViewController.movieId = movieId
    }
}
