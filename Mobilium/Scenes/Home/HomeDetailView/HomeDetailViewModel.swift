//
//  HomeDetailViewModel.swift
//  Mobilium
//
//  Created by GÜRHAN YUVARLAK on 16.09.2022.
//

import Foundation
import UIKit
import Kingfisher

final class HomeDetailViewModel {
    
    public func getMovie(id: Int?, image: UIImageView, navigationTitle: UILabel, point: UILabel, date: UILabel, title: UILabel, description: UILabel) {
        Webservice.shared.getMovie(id: id) { response in
            switch response {
                case .success(let movie):
                    guard let posterPath = movie.poster_path else {
                        return
                    }
                    guard let imageUrl = URL(string: "\(Constant.IMAGE_PATH)\(posterPath)") else {
                        return
                    }
                    DispatchQueue.main.async {
                        image.kf.setImage(with: imageUrl)
                        navigationTitle.text = "\(String(describing: movie.title ?? "")) (\(Helpers.shared.dateFormat(movie.release_date, format: "yyyy")))"
                        point.text = String(format: "%.1f", Double(movie.vote_average ?? 0))
                        date.text = Helpers.shared.dateFormat(movie.release_date, format: "dd.MM.yyyy")
                        title.text = "\(String(describing: movie.title ?? "")) (\(Helpers.shared.dateFormat(movie.release_date, format: "yyyy")))"
                        description.text = movie.overview
                    }
                case .failure(_):
                    break;
            }
        }
    }
}
