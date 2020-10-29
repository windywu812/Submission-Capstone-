//
//  GridSection.swift
//  Submission-Capstone
//
//  Created by Windy on 29/10/20.
//

import AsyncDisplayKit

class GridSection: ASDisplayNode {
    
    private let titleNode: ASTextNode
    private let buttonMore: ASTextNode2
    private let collectionNode: GridCollectionNode
    
    init(title: String = "", movies: [MovieModel]) {
        
        titleNode = ASTextNode()
        collectionNode = GridCollectionNode(movies: movies)
        buttonMore = ASTextNode2()

        super.init()
        
        automaticallyManagesSubnodes = true
        
        titleNode.attributedText = NSAttributedString.setFont(
            text: title,
            fontSize: 22,
            color: .label,
            weight: .bold)

        buttonMore.attributedText = NSAttributedString.setFont(
            text: "See all",
            fontSize: 17,
            color: .systemBlue,
            weight: .regular)
        
        buttonMore.addTarget(self, action: #selector(handleTap(sender:)), forControlEvents: .touchUpInside)
        
    }
    
    @objc private func handleTap(sender: ASTextNode2) {
        print("Tap")
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        let headerStack = ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 0,
            justifyContent: .spaceBetween,
            alignItems: .baselineLast,
            children: [self.titleNode, self.buttonMore])
        headerStack.style.width = .init(unit: .points, value: UIScreen.main.bounds.width - 32)
        
        let mainStack = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 16,
            justifyContent: .start,
            alignItems: .start,
            children: [headerStack, self.collectionNode])
        
        return ASInsetLayoutSpec(
            insets: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16),
            child: mainStack)
    }
    
}
