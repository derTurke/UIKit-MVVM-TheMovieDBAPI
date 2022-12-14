//
//  HomeDetailViewController.swift
//  Mobilium
//
//  Created by GÜRHAN YUVARLAK on 16.09.2022.
//

import UIKit

final class HomeDetailViewController: UIViewController{
    
    
    var homeDetailViewModel = HomeDetailViewModel()
    var movieId: Int?
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var backButtonImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "back-arrow")
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    private var navigationTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProText-Bold", size: 15)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private var movieImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private var imdbIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "imdb-logo"))
        return imageView
    }()
    
    private var rateImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "rate-icon"))
        return imageView
    }()
    
    private var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0
        return stackView
    }()
    
    private var pointLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProText-Semibold", size: 13)
        label.textColor = .black
        return label
    }()
    
    private let pointTenLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProText-Semibold", size: 13)
        label.textColor = .darkGray
        label.text = "/10"
        return label
    }()
    
    private let circleBox: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "imdb-color")
        return view
    }()
    
    private var movieDate: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProText-Semibold", size: 13)
        label.textColor = .black
        return label
    }()
    
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    
    private var movieTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Bold", size: 20)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProText-Regular", size: 15)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetch()
        viewConfigure()
    }
    
    private func fetch() {
        homeDetailViewModel.getMovie(id: movieId, image: movieImageView, navigationTitle: navigationTitle, point: pointLabel, date: movieDate, title: movieTitleLabel, description: descriptionLabel)
    }
    
    private func viewConfigure(){
        scrollViewConfigure()
        contentViewConfigure()
        backButtonImageConfigure()
        navigationTitleConfigure()
        movieImageViewConfigure()
        imdbIconConfigure()
        rateImageViewConfigure()
        horizontalStackViewConfigure()
        circleBoxConfigure()
        movieDateConfigure()
        verticalStackViewConfigure()
    }
    
    private func scrollViewConfigure() {
        view.addSubview(scrollView)
        scrollView.backgroundColor = .white
        scrollView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(0)
        }
    }
    
    private func contentViewConfigure(){
        scrollView.addSubview(contentView)
        contentView.backgroundColor = .white
        contentView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(0)
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(view.frame.width)
        }
    }
    
    private func backButtonImageConfigure(){
        contentView.addSubview(backButtonImage)
        backButtonImage.snp.makeConstraints { make in
            make.topMargin.left.equalTo(19)
        }
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapBackButton))
        backButtonImage.addGestureRecognizer(tapGesture)
    }
    
    private func navigationTitleConfigure() {
        contentView.addSubview(navigationTitle)
        navigationTitle.snp.makeConstraints { make in
            make.topMargin.equalTo(16)
            make.centerX.equalTo(contentView.snp.centerX)
        }
    }
    
    private func movieImageViewConfigure(){
        contentView.addSubview(movieImageView)
        movieImageView.snp.makeConstraints { make in
            make.top.equalTo(navigationTitle.snp.bottom).offset(8)
            make.left.right.equalTo(0)
            make.height.equalTo(256)
        }
    }
    
    private func imdbIconConfigure(){
        contentView.addSubview(imdbIcon)
        imdbIcon.snp.makeConstraints { make in
            make.top.equalTo(movieImageView.snp.bottom).offset(16)
            make.left.equalTo(16)
        }
    }
    
    private func rateImageViewConfigure(){
        contentView.addSubview(rateImageView)
        rateImageView.snp.makeConstraints { make in
            make.top.equalTo(movieImageView.snp.bottom).offset(20)
            make.left.equalTo(imdbIcon.snp.right).offset(8)
        }
    }
    
    private func horizontalStackViewConfigure(){
        contentView.addSubview(horizontalStackView)
        horizontalStackView.addArrangedSubview(pointLabel)
        horizontalStackView.addArrangedSubview(pointTenLabel)
        horizontalStackView.snp.makeConstraints { make in
            make.top.equalTo(movieImageView.snp.bottom).offset(19)
            make.left.equalTo(rateImageView.snp.right).offset(4)
        }
    }
    
    private func circleBoxConfigure(){
        contentView.addSubview(circleBox)
        circleBox.snp.makeConstraints { make in
            make.top.equalTo(movieImageView.snp.bottom).offset(26)
            make.left.equalTo(horizontalStackView.snp.right).offset(8)
            make.width.height.equalTo(4)
        }
        circleBox.layer.cornerRadius = 2
    }
    
    private func movieDateConfigure(){
        contentView.addSubview(movieDate)
        movieDate.snp.makeConstraints { make in
            make.top.equalTo(movieImageView.snp.bottom).offset(19)
            make.left.equalTo(circleBox.snp.right).offset(8)
        }
    }
    
    private func verticalStackViewConfigure(){
        contentView.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(movieTitleLabel)
        verticalStackView.addArrangedSubview(descriptionLabel)
        verticalStackView.snp.makeConstraints { make in
            make.top.equalTo(imdbIcon.snp.bottom).offset(16)
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.bottom.equalTo(0)
        }
    }
    
    @objc func didTapBackButton(){
        self.dismiss(animated: true)
    }
}
