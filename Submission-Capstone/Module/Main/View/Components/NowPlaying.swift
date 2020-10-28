//
//  NowPlayingNode.swift
//  Submission-Capstone
//
//  Created by Windy on 28/10/20.
//

import AsyncDisplayKit

class NowPlaying: ASDisplayNode {
    
    private let title: ASTextNode
    private var highlightNode: NowPlayingPager

    init(movies: [MovieModel]) {
        
        title = ASTextNode()
        highlightNode = NowPlayingPager(movies: movies)
        
        super.init()
        
        automaticallyManagesSubnodes = true
        
        title.attributedText = NSAttributedString(
            string: "Now Playing",
            attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 28, weight: .bold),
                NSAttributedString.Key.foregroundColor: UIColor.label
            ])
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let titleInset = ASInsetLayoutSpec(
            insets: UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 0),
            child: self.title)
        
        return ASStackLayoutSpec(
            direction: .vertical,
            spacing: 16,
            justifyContent: .start,
            alignItems: .start,
            children: [titleInset, self.highlightNode])
    }
    
}
