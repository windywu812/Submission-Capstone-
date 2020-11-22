//
//  ProfileViewController.swift
//  Submission-Capstone
//
//  Created by Windy on 30/10/20.
//

import AsyncDisplayKit
import Profile

class ProfileViewController: ASDKViewController<ASScrollNode> {
    
    private let presenter: ProfilePresenter
    
    private let highlightNode: HighlightNode
    private let tableNode: ProfileTableNode
    
    init(presenter: ProfilePresenter) {
        
        self.presenter = presenter
        
        tableNode = ProfileTableNode(
            labels: presenter.getLabel(),
            contents: presenter.getProfile())
        
        highlightNode = HighlightNode(
            image: presenter.profile.image,
            name: "Windy",
            expert: "iOS Developer")
        
        super.init(node: ASScrollNode())
            
        node.automaticallyManagesContentSize = true
        node.automaticallyManagesSubnodes = true
        node.view.showsVerticalScrollIndicator = false
        
        node.layoutSpecBlock = { _, _ in
      
            let mainStack = ASStackLayoutSpec(
                direction: .vertical,
                spacing: 32,
                justifyContent: .start,
                alignItems: .center,
                children: [self.highlightNode, self.tableNode])
            
            return ASInsetLayoutSpec(
                insets: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16),
                child: mainStack)
        }
        
    }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
