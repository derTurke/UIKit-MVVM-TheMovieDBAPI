//
//  Movies.swift
//  Mobilium
//
//  Created by GÜRHAN YUVARLAK on 16.09.2022.
//

import Foundation
//MARK: - NowPlaying
struct NowPlaying: Codable {
    var dates: NowPlayingDates?
    var page: Int?
    var results: [NowPlayingResults]?
    var total_pages, total_results: Int?
}
//MARK: - NowPlayingDates
struct NowPlayingDates: Codable {
    var maximum, minimum: String?
}
//MARK: - NowPlayingResults
struct NowPlayingResults: Codable {
    var adult: Bool?
    var backdrop_path: String?
    var genre_ids: [Int]?
    var id: Int?
    var original_language, original_title, overview: String?
    var popularity: Double?
    var poster_path, release_date, title: String?
    var video: Bool?
    var vote_average: Double?
    var vote_count: Int?
}
