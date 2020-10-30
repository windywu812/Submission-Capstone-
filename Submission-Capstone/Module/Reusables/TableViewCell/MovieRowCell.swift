//
//  TableViewCell.swift
//  Submission-Capstone
//
//  Created by Windy on 30/10/20.
//

import UIKit

class MovieRowCell: UITableViewCell {
    
    static let reuseIdentifier = "MovieCell"
    
    let imagePoster = UIImageView()
    let titleLabel = UILabel()
    let overviewLabel = UILabel()
    
    private var stack: UIStackView!
    
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
        
        stack = UIStackView(arrangedSubviews: [titleLabel, overviewLabel])
        stack.axis = .vertical
        stack.spacing = 8
        stack.alignment = .leading
        addSubview(stack)
        
        setupContraint()
    }

    private func setupContraint() {
        
        imagePoster.setConstraint(
            topAnchor: topAnchor, topAnchorConstant: 16,
            bottomAnchor: bottomAnchor, bottomAnchorConstant: -16,
            leadingAnchor: leadingAnchor, leadingAnchorConstant: 16,
            heighAnchorConstant: 180, widthAnchorConstant: 110)
        
        stack.setConstraint(
            topAnchor: topAnchor, topAnchorConstant: 16,
            leadingAnchor: imagePoster.trailingAnchor, leadingAnchorConstant: 16,
            trailingAnchor: trailingAnchor, trailingAnchorConstant: -16)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
