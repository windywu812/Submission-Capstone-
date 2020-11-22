//
//  TableViewCell.swift
//  Submission-Capstone
//
//  Created by Windy on 30/10/20.
//

import UIKit
import Common
import SDWebImage
import Movie
import Watchlist
import Search

class MovieRowCell: UITableViewCell {
    
    static let reuseIdentifier = "MovieCell"
    
    private let imagePoster = UIImageView()
    private let titleLabel = UILabel()
    private let overviewLabel = UILabel()
    private let releaseDateLabel = UILabel()
    private let popularityLabel = UILabel()
    
    private var stack: UIStackView!
    
    var movieModel: MovieModel? {
        didSet {
            titleLabel.text = movieModel?.title
            overviewLabel.text = movieModel?.overview
            imagePoster.sd_setImage(with: URL(string: "\(movieModel?.posterPath ?? "")"))
            releaseDateLabel.text = "Release date : \(movieModel?.releaseDate ?? "-")"
            popularityLabel.text =  "Popularity      : \(Int(movieModel?.popularity ?? 0))"
        }
    }
    
    var watchListModel: WatchlistModel? {
        didSet {
            titleLabel.text = watchListModel?.title
            overviewLabel.text = watchListModel?.overview
            imagePoster.sd_setImage(with: URL(string: "\(API.imageLoaderURL)\(watchListModel?.posterPath ?? "")"))
            releaseDateLabel.text = "Release date : \(watchListModel?.releaseDate.changeDateFormat() ?? "-")"
            popularityLabel.text =  "Popularity      : \(Int(watchListModel?.popularity ?? 0))"
        }
    }
    
    var searchModel: SearchModel? {
        didSet {
            titleLabel.text = searchModel?.title
            overviewLabel.text = searchModel?.overview
            imagePoster.sd_setImage(with: URL(string: "\(searchModel?.posterPath ?? "")"))
            releaseDateLabel.text = "Release date : \(searchModel?.releaseDate.changeDateFormat() ?? "-")"
            popularityLabel.text =  "Popularity      : \(Int(searchModel?.popularity ?? 0))"
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(imagePoster)
        
        imagePoster.backgroundColor = .systemGray4
        imagePoster.layer.cornerRadius = 8
        imagePoster.layer.masksToBounds = true
        
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        
        overviewLabel.font = .systemFont(ofSize: 17, weight: .regular)
        overviewLabel.numberOfLines = 3
        overviewLabel.textColor = .secondaryLabel
        
        releaseDateLabel.font = .systemFont(ofSize: 17, weight: .regular)
        releaseDateLabel.textColor = .label
        
        popularityLabel.font = .systemFont(ofSize: 17, weight: .regular)
        popularityLabel.textColor = .label
        
        stack = UIStackView(arrangedSubviews: [titleLabel, overviewLabel, popularityLabel, releaseDateLabel])
        stack.axis = .vertical
        stack.spacing = 8
        stack.alignment = .leading
        stack.setCustomSpacing(16, after: overviewLabel)
        stack.setCustomSpacing(4, after: popularityLabel)
        addSubview(stack)
        
        setupContraint()
    }

    private func setupContraint() {
        imagePoster.setConstraint(
            topAnchor: topAnchor, topAnchorConstant: 16,
            bottomAnchor: bottomAnchor, bottomAnchorConstant: -16,
            leadingAnchor: leadingAnchor, leadingAnchorConstant: 16,
            widthAnchorConstant: 110)
        
        stack.setConstraint(
            leadingAnchor: imagePoster.trailingAnchor, leadingAnchorConstant: 16,
            trailingAnchor: trailingAnchor, trailingAnchorConstant: -16,
            centerYAnchor: imagePoster.centerYAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
