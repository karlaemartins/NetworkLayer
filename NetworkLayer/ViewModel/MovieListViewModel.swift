//
//  MovieListViewModel.swift
//  NetworkLayer
//
//  Created by Karla E. Martins Fernandes on 07/07/25.
//

import Foundation

class MovieListViewModel {

    private let apiKey = "e20233fdd33e4c1c99bc3460d3394900"
    private let baseURL = "https://api.themoviedb.org/3"

    private(set) var genres: [Genre] = []

    func fetchGenres(completion: @escaping () -> Void) {
        var components = URLComponents(string: "\(baseURL)/genre/movie/list")
        components?.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "language", value: "pt-BR")
        ]

        guard let url = components?.url else {
            print("URL inválida")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in

            if let error = error {
                print("Erro na requisição: \(error.localizedDescription)")
                return
            }

            guard let data = data else {
                print("Nenhum dado recebido")
                return
            }

            do {
                let decoded = try JSONDecoder().decode(GenreResponse.self, from: data)
                self.genres = decoded.genres ?? []
                completion()
            } catch {
                print("Erro ao decodificar JSON: \(error)")
            }
        }

        task.resume()
    }
}
