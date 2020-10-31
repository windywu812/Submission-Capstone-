//
//  GridCellNode.swift
//  Submission-Capstone
//
//  Created by Windy on 29/10/20.
//

import AsyncDisplayKit

class GridCellNode: ASCellNode {
    
    private let imageNode: ASNetworkImageNode
    private let titleNode: ASTextNode
    
    init(imageUrl: String, title: String) {
        
        imageNode = ASNetworkImageNode()
        titleNode = ASTextNode()
        
        super.init()
        
        imageNode.url = URL(string: imageUrl)
        imageNode.style.preferredSize = CGSize(width: UIScreen.main.bounds.width / 2 - 24, height: 250)
        imageNode.backgroundColor = .systemGray4
        imageNode.cornerRadius = 8
        
        titleNode.attributedText = NSAttributedString.headlineFont(text: title)
        titleNode.maximumNumberOfLines = 2
        titleNode.truncationMode = .byTruncatingTail
        
        style.width = ASDimension(unit: .points, value: UIScreen.main.bounds.width / 2 - 24)
                
        automaticallyManagesSubnodes = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let stack = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 8,
            justifyContent: .start,
            alignItems: .start,
            children: [self.imageNode, self.titleNode])
        
        return ASInsetLayoutSpec(
            insets: UIEdgeInsets(top: 0, left: 0, bottom: 16, right: 0),
            child: stack)
    }
    
}
