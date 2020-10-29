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
        imageNode.style.preferredSize = CGSize(width: UIScreen.main.bounds.width / 2 - 28, height: 200)
        imageNode.backgroundColor = .systemGray4
        imageNode.cornerRadius = 8
        
        titleNode.attributedText = NSAttributedString.setFont(
            text: title,
            fontSize: 20,
            color: .label,
            weight: .bold)
        titleNode.maximumNumberOfLines = 1
        titleNode.truncationMode = .byTruncatingTail
        
        style.width = ASDimension(unit: .points, value: UIScreen.main.bounds.width / 2 - 28)
                
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
            insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), child: stack)
    }
    
}
