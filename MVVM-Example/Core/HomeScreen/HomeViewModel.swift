//
//  HomeViewModel.swift
//  MVVM-Example
//
//  Created by Fatih Kilit on 9.10.2022.
//

import Foundation

protocol HomeViewModelInteface {
    var view: HomeScreenInteface? { get set }
    
    func viewDidLoad()
    func getMovies()
}

final class HomeViewModel {
    weak var view: HomeScreenInteface?
    private let service = MovieService()
    var movies: [MovieResult] = []
    private var page: Int = 1
//    var shouldDownloadMore: Bool = true
}

extension HomeViewModel: HomeViewModelInteface {
    func viewDidLoad() {
        view?.configureVC()
        view?.configureCollectionView()
        getMovies()
    }
    
    func getMovies() {
//        shouldDownloadMore = false
        service.downloadMovies(page: page) { [weak self] returnedMovies in
            guard let self = self else { return }
            guard let returnedMovies = returnedMovies else { return }
            
            self.movies.append(contentsOf: returnedMovies)
            self.page += 1
            self.view?.reloadCollectionView()
//            self.shouldDownloadMore = true
        }
    }
    
    func getDetail(id: Int) {
        service.downloadDetail(id: id) { [weak self] returnedDetail in
            guard let self = self else { return }
            guard let returnedDetail = returnedDetail else { return }
            
            self.view?.navigateToDetailScreen(movie: returnedDetail)
        }
    }
}
