//
//  MovieListTableViewCellViewModel.swift
//  Lenskart Movies
//
//  Created by Saikat Das on 01/05/21.
//

protocol MovieListTableViewCellProtocol {
    var id: Int { get }
    var rating: Double { get }
    var posterPath: String { get }
    var overview: String { get }
    var voteCount: Int { get }
    var title: String { get }
}

struct MovieListTableViewCellViewModel: MovieListTableViewCellProtocol {
    let id: Int
    
    let posterPath: String
    
    let overview: String
    
    let title: String
    
    let voteCount: Int
    
    let rating: Double
    
    init(movie: Movie) {
        id = movie.id
        title = movie.title
        posterPath = movie.posterPath
        voteCount = movie.voteCount
        rating = movie.rating
        overview = movie.overview
    }
}
