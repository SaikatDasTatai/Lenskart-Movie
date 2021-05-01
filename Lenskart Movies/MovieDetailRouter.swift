//
//  MovieDetailRouter.swift
//  Lenskart Movies
//
//  Created by Saikat Das on 01/05/21.
//

import Foundation
import UIKit

protocol MovieToDetails {
    func moveToDetailsController(movie: Movie)
}

extension MovieToDetails where Self: UIViewController {
    
    func moveToDetailsController(movie: Movie) {
        let mainstoryBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc:MovieDetailViewController = mainstoryBoard.instantiateViewController(identifier: "movieDetailVC") as? MovieDetailViewController else {
            return
        }
        vc.movie = movie
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
