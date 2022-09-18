//
//  Upcoming.swift
//  Mobilium
//
//  Created by GÜRHAN YUVARLAK on 17.09.2022.
//

import Foundation
//MARK: - Upcoming
struct Upcoming: Codable {
    var dates: UpcomingDates?
    var page: Int?
    var results: [UpcomingResults]?
    var total_pages, total_results: Int?
}
//MARK: - UpcomingDates
struct UpcomingDates: Codable {
    var maximum: String?
    var minimum: String?
}
//MARK: - UpcomingResults
struct UpcomingResults: Codable {
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
