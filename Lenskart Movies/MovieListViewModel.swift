//
//  MovieListViewModel.swift
//  Lenskart Movies
//
//  Created by Saikat Das on 01/05/21.
//

import Foundation

import Foundation

protocol MovieListViewModelProtocol {
    var numberOfRows: Int { get }
    var numberOfSections: Int { get }
    var cellViewModels: [MovieListTableViewCellProtocol] { get }
    var movielist: [Movie] { get }
    
    func fetchMovieListsData(completion: @escaping MovieSearchCompletion)
}

class MovieListViewModel: MovieListViewModelProtocol {
    
    var numberOfRows: Int {
        cellViewModels.count
    }
    
    var numberOfSections: Int {
        1
    }
    
    var cellViewModels: [MovieListTableViewCellProtocol] {
        guard let cellViewModels = _cellViewModels else {
            return []
        }
        return cellViewModels
    }
    
    private var _cellViewModels: [MovieListTableViewCellProtocol]?
    private var _movielist: [Movie]?
    var movielist: [Movie] {
        guard let movielist = _movielist else {
            return []
        }
        return movielist
    }
    
    private let service: ServiceProtocol
    
    init(service: ServiceProtocol = NetworkManager()) {
        self.service = service
    }
    
    func fetchMovieListsData(completion: @escaping MovieSearchCompletion) {
        service.fetchMovieList() {[weak self] result in
            switch result {
            case .success(let list):
                self?._movielist = list
                self?._cellViewModels = self?.makeMovieCellViewModels()
            case .failure(let error):
                print(error)
            }
            completion(result)
        }
    }
    
    // Makes cell view model for MovieTabelView cell
    private func makeMovieCellViewModels() -> [MovieListTableViewCellProtocol] {
        var cellViewModels: [MovieListTableViewCellProtocol] = []
        
        for movie in movielist {
            let cellViewModel = MovieListTableViewCellViewModel(movie: movie)
            cellViewModels.append(cellViewModel)
        }
        return cellViewModels
    }
}


