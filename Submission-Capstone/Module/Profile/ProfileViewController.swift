//
//  ProfileViewController.swift
//  Submission-Capstone
//
//  Created by Windy on 30/10/20.
//

import AsyncDisplayKit

class ProfileViewController: ASDKViewController<ASDisplayNode> {
    
    override init() {
        super.init(node: ASDisplayNode())
        
        node.backgroundColor = .green
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
