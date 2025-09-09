//
//  MovieListViewModel.swift
//  NetworkLayer
//
//  Created by Karla E. Martins Fernandes on 07/07/25.
//

import Foundation

class MovieListViewModel {

    private let apiKey = "e20233fdd33e4c1c99bc3460d3394900"
    private let language = "pt-BR"
    
    var genres: [Genre] = []
    var popularMovies: [Movie] = []

    //Gêneros
    func fetchGenres(completion: @escaping () -> Void) {
        let endpoint = Services.genres(apiKey: apiKey, language: language)
        
        NetworkRequest.instance.dispatch(endPoint: endpoint, tipo: GenreResponse.self) { [weak self] response, _, error in
            if let error = error {
                print("Erro ao buscar gêneros: \(error.localizedDescription)")
                completion()
                return
            }
            
            self?.genres = response?.genres ?? []
            completion()
        }
    }
    
    //Filmes Populares
    func fetchPopularMovies(page: Int = 1, completion: @escaping () -> Void) {
        let endpoint = Services.popularMovies(apiKey: apiKey, language: language, page: page)
        
        NetworkRequest.instance.dispatch(endPoint: endpoint, tipo: MovieResponse.self) { [weak self] response, _, error in
            if let error = error {
                print("Erro ao buscar filmes: \(error.localizedDescription)")
                completion()
                return
            }
            
            self?.popularMovies = response?.results ?? []
            completion()
        }
    }
    
    //generos e filmes populares
    func fetchData(completion: @escaping () -> Void) {
        //busca dos generos
        fetchGenres { [weak self] in
            //busca dos filmes populares
            self?.fetchPopularMovies {
                completion()
            }
        }
    }
    
    //função para pegar nomes de generos de um filme
    func genreNames(for movie: Movie) -> [String] {
        guard let ids = movie.genreIDs else { return [] }
        return genres.filter { ids.contains($0.id ?? -1) }.compactMap { $0.name }
    }
}
