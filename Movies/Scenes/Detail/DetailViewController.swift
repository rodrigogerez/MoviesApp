//
//  DetailViewController.swift
//  Movies
//
//  Created by Rodrigo Gerez on 23/12/2019.
//  Copyright © 2020 Rodrigo Gerez. All rights reserved.
//

import UIKit
import Kingfisher
import Cosmos

class DetailViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var ratingView: CosmosView!

    var movieDetails: MovieDetail! {
        didSet {
            self.titleLabel.text = movieDetails?.title
            if let backdropPath = movieDetails?.backdropPath,
               let url = URL(string: "\(K.ImageConstants.baseImageURL)\(backdropPath)") {
                    movieImage.kf.setImage(with: url)
            }
            ratingView.rating = movieDetails?.voteAverage ?? 0
            setSummaryLabelText(movieDetails?.overview)
        }
    }
    
    var detailViewModel: DetailViewModelProtocol!
    
    var movieId: Int! {
        didSet {
            detailViewModel = DetailViewModel(movieId)
            self.detailViewModel.fetchMovieDetails(completion: { movieDetail in
                DispatchQueue.main.async {
                    self.movieDetails = movieDetail
                }                
            }, errorHandler: { error in
                print(error.localizedDescription)
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // Set up all visual improvements
    private func setupUI() {
        setupRatingUI()
    }
    
    // Set up all rating UI using Cosmos
    private func setupRatingUI() {
        ratingView.settings.fillMode = .half
        ratingView.settings.updateOnTouch = false
    }
    
    func setSummaryLabelText(_ labelText: String?) {
        summaryLabel.text = labelText
        summaryLabel.numberOfLines = 0
        summaryLabel.sizeToFit()
    }
}
