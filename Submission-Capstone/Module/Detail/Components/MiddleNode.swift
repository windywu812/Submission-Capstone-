//
//  MiddleNoe.swift
//  Submission-Capstone
//
//  Created by Windy on 30/10/20.
//

import AsyncDisplayKit

class MiddleNode: ASDisplayNode {
    
    private let genreLabel: ASTextNode
    private let genreNode: ASTextNode
    
    private let runtimeLabel: ASTextNode
    private let voteAverageLabel: ASTextNode
    private let voteCountLabel: ASTextNode
    
    private let runtimeNode: ASTextNode
    private let voteAverageNode: ASTextNode
    private let voteCountNode: ASTextNode
    
    init(runtime: Double = 0, voteAverage: Double = 0, voteCount: Double = 0, genre: [String] = [""]) {
        
        genreLabel = ASTextNode()
        genreNode = ASTextNode()
        
        runtimeNode = ASTextNode()
        voteAverageNode = ASTextNode()
        voteCountNode = ASTextNode()
        
        runtimeLabel = ASTextNode()
        voteAverageLabel = ASTextNode()
        voteCountLabel = ASTextNode()
        
        super.init()
        
        runtimeLabel.attributedText = NSAttributedString.bodyFont(text: "Runtime", color: .secondaryLabel)
        voteAverageLabel.attributedText = NSAttributedString.bodyFont(text: "Vote Average", color: .secondaryLabel)
        voteCountLabel.attributedText = NSAttributedString.bodyFont(text: "Vote Count", color: .secondaryLabel)
        
        runtimeNode.attributedText = NSAttributedString.headlineFont(text: "\(runtime)")
        voteAverageNode.attributedText = NSAttributedString.headlineFont(text: "\(voteAverage)")
        voteCountNode.attributedText = NSAttributedString.headlineFont(text: "\(voteCount)")
        
        genreLabel.attributedText = NSAttributedString.title3Font(text: "Genre")
        
        genreNode.attributedText = NSAttributedString.bodyFont(text: genre.convertArraytoString())
        
        automaticallyManagesSubnodes = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let runtimeStack = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 4,
            justifyContent: .start,
            alignItems: .start,
            children: [runtimeLabel, runtimeNode])
        
        let voteAverageStack = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 4,
            justifyContent: .start,
            alignItems: .center,
            children: [voteAverageLabel, voteAverageNode])
        
        let voteCountStack = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 4,
            justifyContent: .start,
            alignItems: .end,
            children: [voteCountLabel, voteCountNode])
        
        let topStack = ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 0,
            justifyContent: .spaceBetween,
            alignItems: .center,
            children: [runtimeStack, voteAverageStack, voteCountStack])
        topStack.style.width = ASDimension(unit: .points, value: UIScreen.main.bounds.width)

        let genreStack = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 4,
            justifyContent: .start,
            alignItems: .start,
            children: [genreLabel, genreNode])
        
        let mainStack = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 24,
            justifyContent: .start,
            alignItems: .start,
            children: [genreStack, topStack])
        
        return ASInsetLayoutSpec(
            insets: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16),
            child: mainStack)
    }
    
}
