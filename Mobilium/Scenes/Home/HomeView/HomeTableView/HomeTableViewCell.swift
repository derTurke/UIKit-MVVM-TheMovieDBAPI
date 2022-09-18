//
//  HomeTableViewCell.swift
//  Mobilium
//
//  Created by GÜRHAN YUVARLAK on 17.09.2022.
//

import UIKit
import SnapKit
import Kingfisher

final class HomeTableViewCell: UITableViewCell {
    
    static let identifier = "HomeTableViewCell"
    
    private let movieImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private var movieTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProText-Bold", size: 15)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private var movieDescription: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProText-Semibold", size: 13)
        label.numberOfLines = 2
        label.textColor = .gray
        return label
    }()
    
    private var movieDate: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProText-Semibold", size: 12)
        label.textColor = .gray
        return label
    }()
    
    private let arrowImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "arrow")
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        viewConfigure()
        configureConstraints()
    }
    
    private func viewConfigure(){
        contentView.backgroundColor = .white
        contentView.addSubview(movieImage)
        contentView.addSubview(movieTitle)
        contentView.addSubview(movieDescription)
        contentView.addSubview(movieDate)
        contentView.addSubview(arrowImage)   
    }
    
    
    private func configureConstraints(){
        movieImageConstraints()
        movieTitleConstraints()
        movieDescriptionConstraints()
        movieDateConstraints()
        arrowImageConstraints()
    }
    
    private func movieImageConstraints() {
        movieImage.snp.makeConstraints { make in
            make.top.left.equalTo(16)
            make.bottom.equalTo(-16)
            make.width.height.equalTo(104)
        }
    }
    private func movieTitleConstraints() {
        movieTitle.snp.makeConstraints { make in
            make.top.equalTo(24)
            make.left.equalTo(movieImage.snp.right).offset(8)
            make.right.equalTo(-44)
        }
    }
    private func movieDescriptionConstraints() {
        movieDescription.snp.makeConstraints { make in
            make.top.equalTo(movieTitle.snp.bottom).offset(8)
            make.left.equalTo(movieImage.snp.right).offset(8)
            make.right.equalTo(-44)
        }
    }
    private func movieDateConstraints() {
        movieDate.snp.makeConstraints { make in
            make.top.equalTo(movieTitle.snp.bottom).offset(16)
            make.bottom.equalTo(16)
            make.right.equalTo(-44)
        }
    }
    private func arrowImageConstraints(){
        arrowImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(-19)
        }
    }

    public func set(_ upcoming: UpcomingResults) {
        guard let posterPath = upcoming.poster_path else {
            return
        }
        guard let imageUrl = URL(string: "\(Constant.IMAGE_PATH)\(posterPath)") else {
            return
        }
        DispatchQueue.main.async {
            self.movieImage.kf.setImage(with: imageUrl)
            self.movieTitle.text = "\(String(describing: upcoming.title ?? "")) (\(Helpers.shared.dateFormat(upcoming.release_date, format: "yyyy")))"
            self.movieDescription.text = upcoming.overview
            self.movieDate.text = Helpers.shared.dateFormat(upcoming.release_date, format: "dd.MM.yyyy")
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
