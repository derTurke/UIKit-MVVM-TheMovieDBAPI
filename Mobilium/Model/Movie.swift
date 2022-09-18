//
//  Movie.swift
//  Mobilium
//
//  Created by GÜRHAN YUVARLAK on 17.09.2022.
//

import Foundation

// MARK: - Movie
struct Movie: Codable {
    var adult: Bool?
    var backdrop_path: String?
    var belongs_to_collection: BelongsToCollection?
    var budget: Int?
    var genres: [Genre]?
    var homepage: String?
    var id: Int?
    var imdb_id, original_language, original_title, overview: String?
    var popularity: Double?
    var poster_path: String?
    var production_companies: [ProductionCompany]?
    var production_countries: [ProductionCountry]?
    var release_date: String?
    var revenue, runtime: Int?
    var spoken_languages: [SpokenLanguage]?
    var status, tagline, title: String?
    var video: Bool?
    var vote_average: Double?
    var vote_count: Int?
}

// MARK: - BelongsToCollection
struct BelongsToCollection: Codable {
    var id: Int?
    var name, poster_path, backdrop_path: String?
}

// MARK: - Genre
struct Genre: Codable {
    var id: Int?
    var name: String?
}

// MARK: - ProductionCompany
struct ProductionCompany: Codable {
    var id: Int?
    var logo_path, name, origin_country: String?
}

// MARK: - ProductionCountry
struct ProductionCountry: Codable {
    var iso_3166_1, name: String?
}

// MARK: - SpokenLanguage
struct SpokenLanguage: Codable {
    var english_name, iso_639_1, name: String?
}
