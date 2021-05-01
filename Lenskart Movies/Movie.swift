//
//  Movie.swift
//  Lenskart Movies
//
//  Created by Saikat Das on 01/05/21.
//

import Foundation

struct Movie:Decodable {
    var title,overview,posterPath : String
    var id,voteCount:Int
    var rating:Double
    private enum CodingKeys : String, CodingKey {
            case id, title = "original_title", rating = "vote_average", voteCount = "vote_count", overview, posterPath = "poster_path"
        }
}
