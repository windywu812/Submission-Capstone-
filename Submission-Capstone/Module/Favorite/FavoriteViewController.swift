//
//  FavoriteViewController.swift
//  Submission-Capstone
//
//  Created by Windy on 30/10/20.
//

import AsyncDisplayKit

class FavoriteViewController: ASDKViewController<ASDisplayNode> {
    
    override init() {
        super.init(node: ASDisplayNode())
        
        node.backgroundColor = .systemBlue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
