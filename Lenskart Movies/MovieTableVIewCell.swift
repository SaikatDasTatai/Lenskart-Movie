//
//  MovieTableVIewCell.swift
//  Lenskart Movies
//
//  Created by Saikat Das on 01/05/21.
//

import Foundation
import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieOverview: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var movieTotalVote: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        applyStyle()
    }
    var viewModel: MovieListTableViewCellProtocol! {
        didSet {
            configure()
        }
    }
    private func configure(){
        // TODO : Move to ViewModel
        //TODO: Caching for performance enhancement
        self.movieTitle.text = viewModel.title
        self.movieRating.text = viewModel.rating.description
        self.movieTotalVote.text = viewModel.voteCount.description
        self.movieOverview.text = viewModel.overview
        self.setImage(url: viewModel.posterPath)
    }
    private func applyStyle(){
        movieImg.makeRoundCorner()
    }
    private func setImage(url:String){
        self.movieImg.image = nil
        //Caching the images for better performance
        if let img = imageCache.object(forKey: url as NSString) {
            self.movieImg.image = img
            return
        }
        let baseURL = "https://image.tmdb.org/t/p/w92"
        let actualUrl = baseURL + url
        let task = URLSession.shared.dataTask(with: URL(string: actualUrl)!, completionHandler: { (data, response, error) in
            guard let dataTemp = data else{
                return
            }
            let img = UIImage(data: dataTemp)
            imageCache.setObject(img!, forKey: url as NSString)
            DispatchQueue.main.async { [self] in
                //Solves the issue if image is large and user scrolls and cell has been reused by some other cell
                if(url == self.viewModel.posterPath){
                    movieImg.image = img
                }
            }
        })
        task.resume()
    }
}

var imageCache = NSCache<NSString, UIImage>()
extension UIImageView{
    func makeRoundCorner(){
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds  = true
    }
}
