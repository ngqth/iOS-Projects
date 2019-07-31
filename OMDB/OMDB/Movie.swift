//
//  Movie.swift
//  OMDB
//
//  Created by NgQuocThang on 1/8/19.
//  Copyright © 2019 NgQuocThang. All rights reserved.
//

import Foundation
import TMDBSwift

class myMovie {
    var movieTitle: String!
    var movieDate: String!
    var movieSummary: String!
    var movieDB: MovieMDB?
    var movieDetail: MovieDetailedMDB?
    
    init(movieTitle: String, movieDate: String, movieSummary: String) {
        self.movieTitle = movieTitle
        self.movieDate = movieDate
        self.movieSummary = movieSummary
    }
    
    init(ref: (movie: MovieMDB, detail: MovieDetailedMDB)) {
        self.movieDB = ref.movie
        self.movieDetail = ref.detail
        self.movieTitle = ref.movie.title
        self.movieDate = ref.movie.release_date
        self.movieSummary = ref.movie.overview
    }
}
