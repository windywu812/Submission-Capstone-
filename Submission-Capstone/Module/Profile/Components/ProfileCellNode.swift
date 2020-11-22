//
//  ProfileCell.swift
//  Submission-Capstone
//
//  Created by Windy on 31/10/20.
//

import AsyncDisplayKit

class ProfileCellNode: ASCellNode {
    
    private let labelNode: ASTextNode
    private let contentNode: ASTextNode
    
    init(label: String, content: String) {
        
        labelNode = ASTextNode()
        contentNode = ASTextNode()
        
        super.init()
        
        automaticallyManagesSubnodes = true
        
        labelNode.attributedText = NSAttributedString.bodyFont(text: label, color: .secondaryLabel)
        contentNode.attributedText = NSAttributedString.headlineFont(text: content)
        contentNode.maximumNumberOfLines = 0
        
        style.height = ASDimension(unit: .points, value: 44)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let horizontalStack = ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 0,
            justifyContent: .spaceBetween,
            alignItems: .center,
            children: [self.labelNode, self.contentNode])
        
        horizontalStack.style.width = ASDimension(unit: .fraction, value: 1)
        labelNode.style.width = ASDimension(unit: .fraction, value: 0.4)
        contentNode.style.width = ASDimension(unit: .fraction, value: 0.6)
        
        return horizontalStack
    }
    
}
