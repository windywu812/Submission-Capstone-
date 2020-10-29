//
//  GridCollectionNode.swift
//  Submission-Capstone
//
//  Created by Windy on 29/10/20.
//

import AsyncDisplayKit

class GridCollectionNode: ASCollectionNode {
    
    private let movies: [MovieModel]
    
    init(movies: [MovieModel]) {
        
        self.movies = movies
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 24
        layout.scrollDirection = .vertical
        
        super.init(frame: .zero, collectionViewLayout: layout, layoutFacilitator: nil)
        
        style.height = ASDimension(unit: .points, value: 250)
        showsHorizontalScrollIndicator = false
        
        delegate = self
        dataSource = self
        
        automaticallyManagesSubnodes = true
    }
        
}

extension GridCollectionNode: ASCollectionDelegate, ASCollectionDataSource {
    
    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        
        let cellNodeBlock = { [weak self] () -> ASCellNode in
            guard let self = self else { return ASCellNode() }
            return GridCellNode(imageUrl: self.movies[indexPath.row].posterPath, title: self.movies[indexPath.row].title)
            
        }
        
        return cellNodeBlock
    }
    
}
