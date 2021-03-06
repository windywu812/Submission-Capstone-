//
//  HighlightCell.swift
//  Submission-Capstone
//
//  Created by Windy on 28/10/20.
//

import AsyncDisplayKit

class LargeCellNode: ASCellNode {
    
    private let backdropMovie: ASNetworkImageNode
    private let titleMovie: ASTextNode
    private let overviewMovie: ASTextNode
    
    init(imageUrl: String, title: String, overview: String) {
        
        backdropMovie = ASNetworkImageNode()
        titleMovie = ASTextNode()
        overviewMovie = ASTextNode()
        
        super.init()
        
        backdropMovie.url = URL(string: imageUrl)
        backdropMovie.style.preferredSize = CGSize(width: UIScreen.main.bounds.width, height: 200)
        backdropMovie.cornerRadius = 8
        backdropMovie.style.spacingAfter = 8
        backdropMovie.backgroundColor = .systemGray4
        
        titleMovie.attributedText = NSAttributedString.title3Font(text: title)
        titleMovie.maximumNumberOfLines = 1
        titleMovie.truncationMode = .byTruncatingTail
        
        overviewMovie.attributedText = NSAttributedString.bodyFont(text: overview, color: .secondaryLabel)
        overviewMovie.maximumNumberOfLines = 3
        overviewMovie.truncationMode = .byTruncatingTail
        
        style.width = ASDimension(unit: .points, value: UIScreen.main.bounds.width - 32)
        
        automaticallyManagesSubnodes = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
                
        let stack = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 4,
            justifyContent: .start,
            alignItems: .start,
            children: [backdropMovie, titleMovie, overviewMovie])
        return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0), child: stack)
    }
    
}
