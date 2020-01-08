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
    
    var detailViewModel: DetailViewModel!
    
    var movieId: Int! {
        didSet {
            detailViewModel = DetailViewModel(movieId)
            detailViewModel.fetchMovieDetails(completion: { [weak self] movieDetail in
                guard let self = self else { return; }
                self.titleLabel.text = movieDetail?.title
                if let url = URL(string: "\(K.ImageConstants.baseImageURL)\(movieDetail?.posterPath)") {
                    //FIXME: Image is not showing up
                    self.movieImage.kf.setImage(with: url)
                }
                self.ratingView.rating = movieDetail?.voteAverage ?? 0
                self.setSummaryLabelText(movieDetail?.overview)
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
