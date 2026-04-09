//
//  AppCoordinator.swift
//  NetworkLayer
//
//  Created by Karla E. Martins Fernandes on 01/04/26.
//

import UIKit

class AppCoordinator {

    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let movieListVC = MovieListViewController()
        
        movieListVC.onMovieSelected = { [weak self] movie, genres in
            guard let self = self else { return }
            
            let detailVC = MovieDetailViewController(movie: movie, genres: genres)
            self.navigationController.pushViewController(detailVC, animated: true)
        }
        
        navigationController.pushViewController(movieListVC, animated: false)
    }
}

