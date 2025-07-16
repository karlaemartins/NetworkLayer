//
//  MovieListViewController.swift
//  NetworkLayer
//
//  Created by Karla E. Martins Fernandes on 07/07/25.
//

import UIKit

class MovieListViewController: UIViewController {

    private let viewModel = MovieListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        viewModel.fetchGenres {
            DispatchQueue.main.async {
                print("Gêneros de filmes:")
               
                for genre in self.viewModel.genres {
                    let name = genre.name ?? "Nome Indisponível"
                    let id = genre.id ?? 0
                    print("- \(name) (id: \(id))")
                }
            }
        }
    }
}
