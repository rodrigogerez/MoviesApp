//
//  SearchViewController.swift
//  Movies
//
//  Created by Rodrigo Gerez on 09/01/2020.
//  Copyright © 2020 Rodrigo Gerez. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var moviesCollectionView: UICollectionView!
    
    var searchViewModel: SearchViewModelProtocol!
    
    var movies: [Movie]! {
        didSet
        {
            moviesCollectionView.reloadData()
        }
    }
    
    var movieId: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchViewModel = SearchViewModel(networkService: NetworkService())
    }
    
    @IBAction func searchTextChanged(_ sender: UITextField) {
        if let textLength = sender.text?.count {
            if textLength >= 3 {
                fetchMoviesFromAPI()
            }
        }
    }
    
    func fetchMoviesFromAPI() {
        if let text = searchTextField.text {
        searchViewModel.fetchMoviesByTitle(byTitle: text, completion: { (mov) in
            DispatchQueue.main.async {
                self.movies = mov
            }
            }) { (error) in
                print(error.localizedDescription)
            }
        }
    }
}

extension SearchViewController: UICollectionViewDataSource {
    
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

extension SearchViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        movieId = movies[indexPath.row].id
        performSegue(withIdentifier: "goToDetailsFromSearch", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailViewController = segue.destination as? DetailViewController else { return }
        detailViewController.movieId = movieId
    }
}
