//
//  TopRated.swift
//  Submission-Capstone
//
//  Created by Windy on 29/10/20.
//

import AsyncDisplayKit

class MediumSection: ASDisplayNode {
    
    private let titleNode: ASTextNode
    private let buttonMore: ASTextNode2
    private let collectionNode: MediumCollectionNode
    private let divider: ASDisplayNode
    
    init(title: String = "", movies: [MovieModel], presenter: HomePresenter) {
        
        titleNode = ASTextNode()
        collectionNode = MediumCollectionNode(movies: movies, presenter: presenter)
        divider = ASDisplayNode()
        buttonMore = ASTextNode2()
        
        super.init()
        
        automaticallyManagesSubnodes = true
        
        titleNode.attributedText = NSAttributedString.setFont(
            text: title,
            fontSize: 22,
            color: .label,
            weight: .bold)
        
        divider.style.preferredSize = CGSize(width: UIScreen.main.bounds.width - 32, height: 0.5)
        divider.backgroundColor = .systemGray
        
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
        
        let headerInset = ASInsetLayoutSpec(
            insets: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16),
            child: headerStack)
        
        let dividerInset = ASInsetLayoutSpec(
            insets: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16),
            child: self.divider)
        
        return ASStackLayoutSpec(
            direction: .vertical,
            spacing: 0,
            justifyContent: .start,
            alignItems: .start,
            children: [headerInset, self.collectionNode, dividerInset])
    }
    
}
