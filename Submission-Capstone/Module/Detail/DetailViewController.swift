//
//  DetailView.swift
//  Submission-Capstone
//
//  Created by Windy on 29/10/20.
//

import AsyncDisplayKit

class DetailViewController: ASDKViewController<ASDisplayNode> {
    
    var presenter: DetailPresenter
    
    init(presenter: DetailPresenter) {
        
        self.presenter = presenter
        
        super.init(node: ASDisplayNode())
        
        node.backgroundColor = .systemRed
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
