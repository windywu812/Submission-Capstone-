//
//  HighlightCell.swift
//  Submission-Capstone
//
//  Created by Windy on 28/10/20.
//

import AsyncDisplayKit

class HighlightCell: ASCellNode {
    
    private let backdropMovie: ASNetworkImageNode
    private let titleMovie: ASTextNode
    private let overviewMovie: ASTextNode
    
    init(imageUrl: String, title: String, overview: String) {
        
        backdropMovie = ASNetworkImageNode()
        titleMovie = ASTextNode()
        overviewMovie = ASTextNode()
        
        super.init()
        
        backdropMovie.url = URL(string: "https://image.tmdb.org/t/p/w500/\(imageUrl)")
        backdropMovie.style.preferredSize = CGSize(width: UIScreen.main.bounds.width, height: 200)
        backdropMovie.cornerRadius = 16
        backdropMovie.style.spacingAfter = 8
        
        titleMovie.attributedText = NSAttributedString(
            string: title,
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.label,
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .bold)
            ])
        titleMovie.maximumNumberOfLines = 1
        titleMovie.truncationMode = .byTruncatingTail
        
        overviewMovie.attributedText = NSAttributedString(
            string: overview,
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.secondaryLabel,
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .regular)
            ])
        overviewMovie.maximumNumberOfLines = 3
        overviewMovie.truncationMode = .byTruncatingTail
        
        automaticallyManagesSubnodes = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let stack = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 4,
            justifyContent: .start,
            alignItems: .start,
            children: [backdropMovie, titleMovie, overviewMovie])
        return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16), child: stack)
    }
    
}
