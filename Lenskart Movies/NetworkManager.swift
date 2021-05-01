//
//  NetworkManager.swift
//  Lenskart Movies
//
//  Created by Saikat Das on 01/05/21.
//

import Foundation

typealias MovieSearchCompletion = (Result<[Movie]?, Error>) -> Void

protocol ServiceProtocol {
    func fetchMovieList(completion: @escaping MovieSearchCompletion)
}

struct ServiceConstants {
    static let moviesJSONName = "movies"
}

class NetworkManager: ServiceProtocol {
    
    func fetchArayData(completion: @escaping (Result<[Movie]?, Error>) -> Void) {
        let data = loadJson(filename: ServiceConstants.moviesJSONName)
        guard let tempData = data else {
            completion(.success(nil))
            return
        }
        let decoder = JSONDecoder()
        let result = try? decoder.decode([Movie].self, from: tempData)
        completion(.success(result))
    }

    func loadJson(filename fileName: String) -> Data? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                return data
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
    
    func fetchMovieList(completion: @escaping MovieSearchCompletion) {
        fetchArayData(completion: completion)
    }
}
