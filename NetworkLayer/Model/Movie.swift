//
//  Movie.swift
//  NetworkLayer
//
//  Created by Karla E. Martins Fernandes on 07/07/25.
//

import Foundation


struct GenreResponse: Decodable {
    let genres: [Genre]?
}

struct Genre: Decodable {
    let id: Int?
    let name: String?
}
