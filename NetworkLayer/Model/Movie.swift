//
//  Movie.swift
//  NetworkLayer
//
//  Created by Karla E. Martins Fernandes on 07/07/25.
//

import Foundation

//Gêneros
struct GenreResponse: Codable {
    let genres: [Genre]?
}

struct Genre: Codable {
    let id: Int?
    let name: String?
}

//Filmes
struct MovieResponse: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    let id: Int
    let title: String
    let releaseDate: String?      //ano de lançamento
    let genreIDs: [Int]?          //ids dos gêneros
    let posterPath: String?       //imagem

    enum CodingKeys: String, CodingKey {
        case id, title
        case releaseDate = "release_date"
        case genreIDs = "genre_ids"
        case posterPath = "poster_path"
    }
}
