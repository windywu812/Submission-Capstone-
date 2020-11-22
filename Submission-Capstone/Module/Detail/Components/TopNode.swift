//
//  TopNode.swift
//  Submission-Capstone
//
//  Created by Windy on 30/10/20.
//

import AsyncDisplayKit

class TopNode: ASDisplayNode {
    
    private let backdropImageNode: ASNetworkImageNode
    
    private let popularityLabel: ASTextNode
    private let popularityNode: ASTextNode
    
    private let releaseLabel: ASTextNode
    private let releaseDate: ASTextNode
    
    private let statusLabel: ASTextNode
    private let statusNode: ASTextNode
    
    private var topStackInset: ASInsetLayoutSpec
    
    private let taglineLabel = ASTextNode()
    private let taglineNode = ASTextNode()
    
    private let overviewLabel: ASTextNode
    private let overviewNode: ASTextNode
    
    init(imageURL: String = "",
         overview: String = "",
         status: String = "",
         release: String = "",
         popularity: Double = 0,
         tagline: String = "") {
        
        backdropImageNode = ASNetworkImageNode()
        overviewNode = ASTextNode()
        
        popularityLabel = ASTextNode()
        popularityNode = ASTextNode()
        
        releaseDate = ASTextNode()
        statusNode = ASTextNode()
        
        statusLabel = ASTextNode()
        overviewLabel = ASTextNode()
        releaseLabel = ASTextNode()
        
        topStackInset = ASInsetLayoutSpec()
        
        super.init()
        
        automaticallyManagesSubnodes = true
        
        backdropImageNode.style.preferredSize = CGSize(width: UIScreen.main.bounds.width, height: 250)
        backdropImageNode.backgroundColor = .systemGray4
        
        taglineLabel.attributedText = NSAttributedString.title3Font(text: "tagline".localized(identifier: "com.windy.Common"))
        overviewLabel.attributedText = NSAttributedString.title3Font(text: "overview".localized(identifier: "com.windy.Common"))
        statusLabel.attributedText = NSAttributedString.bodyFont(text: "Status", color: .secondaryLabel)
        releaseLabel.attributedText = NSAttributedString.bodyFont(text: "release_date".localized(identifier: "com.windy.Common"), color: .secondaryLabel)
        popularityLabel.attributedText = NSAttributedString.bodyFont(text: "popularity".localized(identifier: "com.windy.Common"), color: .secondaryLabel)
        
        backdropImageNode.url = URL(string: imageURL)
        overviewNode.attributedText = NSAttributedString.bodyFont(text: overview)
        statusNode.attributedText = NSAttributedString.headlineFont(text: status)
        releaseDate.attributedText = NSAttributedString.headlineFont(text: release.changeDateFormat() ?? "")
        popularityNode.attributedText = NSAttributedString.headlineFont(text: "\(Int(popularity))")
        taglineNode.attributedText = NSAttributedString.bodyFont(text: tagline)
        
    }
    
    private func setupTopStack() {
        let statusStack = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 4,
            justifyContent: .start,
            alignItems: .start,
            children: [statusLabel, statusNode])
        
        let releaseDateStack = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 4,
            justifyContent: .start,
            alignItems: .end,
            children: [releaseLabel, releaseDate])
        
        let popularityStack = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 4,
            justifyContent: .start,
            alignItems: .center,
            children: [popularityLabel, popularityNode])
        
        let topStack = ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 0,
            justifyContent: .spaceBetween,
            alignItems: .center,
            children: [statusStack, popularityStack, releaseDateStack])
        topStack.style.width = ASDimension(unit: .points, value: UIScreen.main.bounds.width)
        
        topStackInset = ASInsetLayoutSpec(
            insets: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16), child: topStack)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        setupTopStack()
        
        let taglineStack = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 4,
            justifyContent: .start,
            alignItems: .start,
            children: [taglineLabel, taglineNode])
        
        let taglineInset = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16), child: taglineStack)
        
        let overviewStack = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 4,
            justifyContent: .start,
            alignItems: .start,
            children: [overviewLabel, overviewNode])
        let overviewInset = ASInsetLayoutSpec(
            insets: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16), child: overviewStack)
        
        return ASStackLayoutSpec(
            direction: .vertical,
            spacing: 24,
            justifyContent: .start,
            alignItems: .start,
            children: [self.backdropImageNode, self.topStackInset, taglineInset, overviewInset])
    }
    
}
