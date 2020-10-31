//
//  BottomNode.swift
//  Submission-Capstone
//
//  Created by Windy on 30/10/20.
//

import AsyncDisplayKit

class BottomNode: ASDisplayNode {
    
    private let spokenLangLabel: ASTextNode
    private let spokenLangNode: ASTextNode
    
    private let productionLabel: ASTextNode
    private let productionNode: ASTextNode
    
    init(lang: [String] = [], production: [String] = []) {
        spokenLangLabel = ASTextNode()
        spokenLangNode = ASTextNode()
        productionLabel = ASTextNode()
        productionNode = ASTextNode()
        
        super.init()
        
        spokenLangLabel.attributedText = NSAttributedString.title3Font(text: "Languages")
        spokenLangNode.attributedText = NSAttributedString.bodyFont(text: lang.convertArraytoString())
        
        productionLabel.attributedText = NSAttributedString.title3Font(text: "Production")
        productionNode.attributedText = NSAttributedString.bodyFont(text: production.convertArraytoString())
        
        automaticallyManagesSubnodes = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        let langStack = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 8,
            justifyContent: .start,
            alignItems: .start,
            children: [spokenLangLabel, spokenLangNode])
        
        let productionStack = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 8,
            justifyContent: .start,
            alignItems: .start,
            children: [productionLabel, productionNode])
        
        let mainStack = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 24,
            justifyContent: .start,
            alignItems: .start,
            children: [langStack, productionStack])
        
        return ASInsetLayoutSpec(
            insets: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16),
            child: mainStack)
    }
    
}
