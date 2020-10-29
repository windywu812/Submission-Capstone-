//
//  NowPlayingNode.swift
//  Submission-Capstone
//
//  Created by Windy on 28/10/20.
//

import AsyncDisplayKit

class LargeSection: ASDisplayNode {
    
    private let title: ASTextNode
    private var highlightNode: LargePagerNode
    private let divider: ASDisplayNode

    init(movies: [MovieModel]) {
        
        title = ASTextNode()
        highlightNode = LargePagerNode(movies: movies)
        divider = ASDisplayNode()
        
        super.init()
        
        automaticallyManagesSubnodes = true
        
        title.attributedText = NSAttributedString.setFont(
            text: "Now Playing",
            fontSize: 28,
            color: .label,
            weight: .bold)
    
        divider.style.preferredSize = CGSize(width: UIScreen.main.bounds.width - 32, height: 1)
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
