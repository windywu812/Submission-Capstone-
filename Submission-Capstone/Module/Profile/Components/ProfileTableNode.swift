//
//  ProfileTableNode.swift
//  Submission-Capstone
//
//  Created by Windy on 22/11/20.
//

import AsyncDisplayKit

class ProfileTableNode: ASTableNode {
    
    private let label: [String]
    private let content: [String]
    
    init(labels: [String], contents: [String]) {
        
        self.label = labels
        self.content = contents
        
        super.init(style: .plain)
        
        dataSource = self
        delegate = self
        
        style.height = ASDimension(unit: .points, value: 8 * 44)
        view.separatorStyle = .none

        automaticallyManagesSubnodes = true
    }
    
}

extension ProfileTableNode: ASTableDataSource, ASTableDelegate {
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        let cellNodeBlock = { [weak self] () -> ASCellNode in
            guard let self = self else { return ASCellNode() }
            let cellNode = ProfileCellNode(
                label: self.label[indexPath.row],
                content: self.content[indexPath.row])
            cellNode.selectionStyle = .none
            return cellNode
        }
        return cellNodeBlock
    }
    
}
