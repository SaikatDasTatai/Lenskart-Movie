//
//  MovieDetailViewController.swift
//  Lenskart Movies
//
//  Created by Saikat Das on 01/05/21.
//

import UIKit

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var posterImg: UIImageView!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblCount: UILabel!
    @IBOutlet weak var lblOverView: UILabel!
    var movie:Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblTitle.text = movie?.title
        lblCount.text = movie?.voteCount.description
        lblRating.text = movie?.rating.description
        lblOverView.text = movie?.overview
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
