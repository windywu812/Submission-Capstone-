//
//  SmallCellNode.swift
//  Submission-Capstone
//
//  Created by Windy on 29/10/20.
//

import AsyncDisplayKit

class SmallCellNode: ASCellNode {
    
    private let imageNode: ASNetworkImageNode
    private let titleNode: ASTextNode
    
    init(imageUrl: String, title: String) {
        
        imageNode = ASNetworkImageNode()
        titleNode = ASTextNode()
        
        super.init()
        
        imageNode.url = URL(string: imageUrl)
        imageNode.style.preferredSize = CGSize(width: UIScreen.main.bounds.width / 4 + 32, height: 175)
        imageNode.backgroundColor = .systemGray4
        imageNode.cornerRadius = 8
        
        titleNode.attributedText = NSAttributedString.setFont(
            text: title,
            fontSize: 20,
            color: .label,
            weight: .bold)
        titleNode.maximumNumberOfLines = 1
        titleNode.truncationMode = .byTruncatingTail
        
        style.width = ASDimension(unit: .points, value: UIScreen.main.bounds.width / 4 + 32)
                
        automaticallyManagesSubnodes = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let stack = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 0,
            justifyContent: .start,
            alignItems: .start,
            children: [self.imageNode])
        return ASInsetLayoutSpec(
            insets: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0), child: stack)
    }
    
}
