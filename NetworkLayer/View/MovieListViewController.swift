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

        // Busca gêneros e filmes usando o novo ViewModel
        viewModel.fetchData {
            DispatchQueue.main.async {
                
                
                // Print dos gêneros
                print("Gêneros de filmes:")
                for genre in self.viewModel.genres {
                    let name = genre.name ?? "Nome Indisponível"
                    let id = genre.id ?? 0
                    print("- \(name) (id: \(id))")
                }

                // Print dos filmes populares
                print("\nFilmes populares:")
                for movie in self.viewModel.movies {
                    let release = movie.releaseDate ?? "Sem data"
                    let genreNames = self.viewModel.genreNames(for: movie).joined(separator: ", ")
                    print("- \(movie.title) (\(release)) | Gêneros: \(genreNames)")
                }
            }
        }
    }
}
