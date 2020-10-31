//
//  HighlightNode.swift
//  Submission-Capstone
//
//  Created by Windy on 31/10/20.
//

import AsyncDisplayKit

class HighlightNode: ASDisplayNode {
    
    let imageNode: ASImageNode
    let nameNode: ASTextNode
    let expertNode: ASTextNode
    
    init(image: String, name: String, expert: String) {
        imageNode = ASImageNode()
        nameNode = ASTextNode()
        expertNode = ASTextNode()
        
        super.init()
        
        automaticallyManagesSubnodes = true
        
        imageNode.style.preferredSize = CGSize(width: 200, height: 200)
        imageNode.cornerRadius = 100
        imageNode.image = UIImage(named: "\(image)")
        imageNode.borderWidth = 1
        imageNode.borderColor = UIColor.systemGray2.cgColor
        
        nameNode.attributedText = NSAttributedString.title1Font(text: name)
        expertNode.attributedText = NSAttributedString.title2Font(text: expert, color: .secondaryLabel)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASStackLayoutSpec(
            direction: .vertical,
            spacing: 16,
            justifyContent: .start,
            alignItems: .center,
            children: [self.imageNode, self.nameNode, self.expertNode])
    }
    
}
