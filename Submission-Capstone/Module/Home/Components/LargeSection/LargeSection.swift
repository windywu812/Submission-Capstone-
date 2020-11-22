//
//  NowPlayingNode.swift
//  Submission-Capstone
//
//  Created by Windy on 28/10/20.
//

import AsyncDisplayKit
import Movie
import Common

class LargeSection: ASDisplayNode {
    
    private let title: ASTextNode
    private var highlightNode: LargeCollectionNode
    private let divider: ASDisplayNode
    
    init(movies: [MovieModel], presenter: MoviePresenter) {
        
        title = ASTextNode()
        highlightNode = LargeCollectionNode(movies: movies, presenter: presenter)
        divider = ASDisplayNode()
        
        super.init()
        
        automaticallyManagesSubnodes = true
        
        title.attributedText = NSAttributedString.title1Font(text: "now_playing".localized(identifier: "com.windy.Common"))
        divider.style.preferredSize = CGSize(width: UIScreen.main.bounds.width - 32, height: 0.5)
        divider.backgroundColor = .systemGray
    
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let titleInset = ASInsetLayoutSpec(
            insets: UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 0),
            child: self.title)
        
        let dividerInset = ASInsetLayoutSpec(
            insets: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16),
            child: self.divider)
        
        return ASStackLayoutSpec(
            direction: .vertical,
            spacing: 16,
            justifyContent: .start,
            alignItems: .start,
            children: [titleInset, self.highlightNode, dividerInset])
    }
    
}
