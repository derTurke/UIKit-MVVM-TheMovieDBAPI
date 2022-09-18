//
//  HomeCollectionViewCell.swift
//  Mobilium
//
//  Created by GÜRHAN YUVARLAK on 17.09.2022.
//

import UIKit

final class HomeCollectionViewCell: UICollectionViewCell {
    static let identifier = "HomeCollectionViewCell"
    
    private let movieImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private var movieDescription: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProText-Semibold", size: 12)
        label.textColor = .white
        label.numberOfLines = 2
        return label
    }()
    
    private var movieTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Bold", size: 20)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewConfigure()
        configureConstraints()
    }
    
    private func viewConfigure(){
        contentView.addSubview(movieImage)
        contentView.addSubview(movieDescription)
        contentView.addSubview(movieTitle)
    }
    
    private func configureConstraints(){
        movieImageConstraints()
        movieDescriptionConstraints()
        movieTitleConstraints()
    }
    
    private func movieImageConstraints() {
        movieImage.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
    
    private func movieDescriptionConstraints() {
        movieDescription.snp.makeConstraints { make in
            make.top.equalTo(movieTitle.snp.bottom).offset(8)
            make.right.equalTo(-16)
            make.left.equalTo(16)
        }
    }
    
    private func movieTitleConstraints() {
        movieTitle.snp.makeConstraints { make in
            make.top.equalTo(152)
            make.right.equalTo(-16)
            make.left.equalTo(16)
        }
    }
    
    public func set(_ nowPlaying: NowPlayingResults) {
        guard let posterPath = nowPlaying.poster_path else {
            return
        }
        guard let imageUrl = URL(string: "\(Constant.IMAGE_PATH)\(posterPath)") else {
            return
        }
        DispatchQueue.main.async {
            self.movieImage.kf.setImage(with: imageUrl)
            self.movieTitle.text = "\(String(describing: nowPlaying.title ?? "")) (\(Helpers.shared.dateFormat(nowPlaying.release_date, format: "yyyy")))"
            self.movieDescription.text = nowPlaying.overview
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
