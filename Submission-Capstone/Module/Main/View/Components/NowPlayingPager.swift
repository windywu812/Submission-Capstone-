//
//  NowPlayingNode.swift
//  Submission-Capstone
//
//  Created by Windy on 28/10/20.
//

import AsyncDisplayKit

class NowPlayingPager: ASPagerNode {
    
    private var movies: [MovieModel]
    
    init(movies: [MovieModel] = []) {
        
        self.movies = movies
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        super.init(frame: .zero, collectionViewLayout: layout, layoutFacilitator: nil)
        
        style.height = ASDimension(unit: .points, value: 300)
        showsHorizontalScrollIndicator = false
        
        delegate = self
        dataSource = self
    }
    
}

extension NowPlayingPager: ASCollectionDelegate, ASCollectionDataSource {
    
    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        let cellNodeBlock = { [weak self] () -> ASCellNode in
            guard let self = self else { return ASCellNode() }
            return HighlightCell(
                imageUrl: self.movies[indexPath.row].backdropPath,
                title: self.movies[indexPath.row].title,
                overview: self.movies[indexPath.row].overview)
        }
        return cellNodeBlock
    }
    
}
