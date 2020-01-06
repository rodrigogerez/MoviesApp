//
//  DetailViewController.swift
//  Movies
//
//  Created by Rodrigo Gerez on 23/12/2019.
//  Copyright © 2020 Rodrigo Gerez. All rights reserved.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var summaryLabel: UILabel!
    
    var detailViewModel: DetailViewModel!
    
    var movieId: Int! {
        didSet {
            detailViewModel = DetailViewModel(movieId)
            detailViewModel.fetchMovieDetails(completion: { movieDetail in
                self.titleLabel.text = movieDetail?.title
                if let url = URL(string: "\(K.ImageConstants.baseImageURL)\(movieDetail?.posterPath)") {
                    self.movieImage.kf.setImage(with: url)
                }
                self.summaryLabel.text = movieDetail?.overview                
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
    func setupUI() {
    }
    
}
