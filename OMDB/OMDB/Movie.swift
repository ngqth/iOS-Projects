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
    var genre: String!
    var voteCount: String!
    var voteScore: String!
    var revenue: String!
    var duration: String!
    var proCompany: String?
    var proCountry: String?
    var movieDB: MovieMDB?
    var movieDetail: MovieDetailedMDB?
    
    init(movieTitle: String, movieDate: String, movieSummary: String, genre: String) {
        self.movieTitle = movieTitle
        self.movieDate = movieDate
        self.movieSummary = movieSummary
        self.genre = genre
    }
    
    init(ref: (movie: MovieMDB, detail: MovieDetailedMDB)) {
        self.movieDB = ref.movie
        self.movieDetail = ref.detail
        self.movieTitle = ref.movie.title
        self.movieDate = ref.movie.release_date
        self.movieSummary = ref.movie.overview
        var genre = ""
        if ref.detail.genres.count == 0 {
            genre = "N/A"
        } else {
            for i in 0...ref.detail.genres.count - 1{
                genre = ref.detail.genres[i].name! + ", " + genre
            }
        }
        self.genre = genre
        self.voteCount = String(Int(ref.movie.vote_count!))
        self.voteScore = String(ref.movie.vote_average!)
        let largeNumber = ref.detail.revenue! - ref.detail.budget!
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let formattedNumber = numberFormatter.string(from: NSNumber(value:largeNumber))
        self.revenue = formattedNumber
        if ref.detail.production_companies?[0].name == nil {
            self.proCompany = "N/A"
        } else {
            self.proCompany = ref.detail.production_companies?[0].name
        }
        if ref.detail.production_countries?[0].name == nil {
            self.proCountry = "N/A"
        } else {
            self.proCountry = ref.detail.production_countries?[0].name?.uppercased()
        }
        if ref.detail.runtime == nil {
            self.duration = "N/A"
        } else {
            self.duration = String(ref.detail.runtime!)
        }
    }
}
