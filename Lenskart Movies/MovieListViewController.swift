//
//  ViewController.swift
//  Lenskart Movies
//
//  Created by Saikat Das on 01/05/21.
//

import UIKit

class MovieListViewController: UIViewController {

    lazy var viewModel: MovieListViewModelProtocol = {
        return MovieListViewModel()
    }()
    @IBOutlet weak var movieListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.fetchMovieListsData() {[weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    self?.movieListTableView.reloadData()
                case .failure:
                    // TODO : handle error case
                    break
                }
            }
        }
    }
}

extension MovieListViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let movieCell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as? MovieTableViewCell else{
            return UITableViewCell()
        }
        movieCell.viewModel = viewModel.cellViewModels[indexPath.row]
        return movieCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 131
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = viewModel.movielist[indexPath.row]
        self.moveToDetailsController(movie: movie)
    }
}

extension MovieListViewController:MovieToDetails{}
