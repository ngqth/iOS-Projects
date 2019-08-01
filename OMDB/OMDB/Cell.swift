//
//  OMDBCell.swift
//  OMDB
//
//  Created by NgQuocThang on 1/8/19.
//  Copyright © 2019 NgQuocThang. All rights reserved.
//

import FoldingCell
import Kingfisher
import UIKit

class MovieCell: FoldingCell {
    @IBOutlet weak var unFoldImage: UIImageView!
    @IBOutlet weak var foldImage: UIImageView!
    @IBOutlet weak var foldTitle: UILabel!
    @IBOutlet weak var unFoldTitle: UILabel!
    @IBOutlet weak var foldGenre: UILabel!
    @IBOutlet weak var unFoldGenre: UILabel!
    @IBOutlet weak var foldDate: UILabel!
    @IBOutlet weak var unFoldDate: UILabel!
    @IBOutlet weak var foldVote: UILabel!
    @IBOutlet weak var unFoldVote: UILabel!
    @IBOutlet weak var foldScore: UILabel!
    @IBOutlet weak var unFoldScore: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var duration: UILabel!
    @IBOutlet weak var language: UILabel!
    @IBOutlet weak var overview: UILabel!
    @IBOutlet weak var profit: UILabel!
    @IBOutlet weak var orgTitle: UILabel!
    @IBOutlet weak var website: UILabel!
    @IBOutlet weak var productionComp: UILabel!
    @IBOutlet weak var productionCountry: UILabel!
    @IBOutlet weak var movieTag: UILabel!
    
    
    override func awakeFromNib() {
        foregroundView.layer.cornerRadius = 10
        foregroundView.layer.masksToBounds = true
        super.awakeFromNib()
    }
    
    override func animationDuration(_ itemIndex: NSInteger, type _: FoldingCell.AnimationType) -> TimeInterval {
        //let durations = [0.26, 0.2, 0.2]
        let durations = [0.2,0.1,0.1]
        return durations[itemIndex]
    }
    
    var movie: myMovie! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI() {
        self.foldTitle.text = movie.movieTitle
        self.unFoldTitle.text = movie.movieTitle
        self.foldGenre.text = movie.genre
        self.unFoldGenre.text = movie.genre
        self.foldDate.text = movie.movieDB?.release_date
        self.unFoldDate.text = movie.movieDB?.release_date
        self.foldVote.text = movie.voteCount
        self.unFoldVote.text = movie.voteCount
        self.foldScore.text = movie.voteScore
        self.unFoldScore.text = movie.voteScore
        self.foldDate.text = movie.movieDate
        self.unFoldDate.text = movie.movieDate
        self.status.text = movie.movieDetail?.status
        self.duration.text = String(movie.duration)
        self.language.text = (movie.movieDetail?.original_language)?.uppercased()
        self.overview.text = movie.movieDB?.overview
        self.profit.text = movie.revenue
        self.orgTitle.text = movie.movieDetail?.original_title
        self.website.text = movie.movieDetail?.homepage
        self.productionComp.text = movie.proCompany
        self.productionCountry.text = movie.proCountry
        self.movieTag.text = movie.movieDetail?.tagline
        let url = URL(string: "https://image.tmdb.org/t/p/w500/" + movie.movieDB!.poster_path!)
        self.foldImage.kf.setImage(with: url)
        self.unFoldImage.kf.setImage(with: url)
    }
}

// MARK: - Actions ⚡️

extension MovieCell {
    
    @IBAction func buttonHandler(_: AnyObject) {
        print("tap")
    }
}
