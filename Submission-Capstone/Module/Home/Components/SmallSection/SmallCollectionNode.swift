//
//  SmallCollectionNode.swift
//  Submission-Capstone
//
//  Created by Windy on 29/10/20.
//

import AsyncDisplayKit
import Movie

class SmallCollectionNode: ASCollectionNode {
    
    private let movies: [MovieModel]
    private let presenter: MoviePresenter
    
    init(movies: [MovieModel], presenter: MoviePresenter) {
        
        self.movies = movies
        self.presenter = presenter
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        
        super.init(frame: .zero, collectionViewLayout: layout, layoutFacilitator: nil)
        
        style.height = ASDimension(unit: .points, value: 175)
        showsHorizontalScrollIndicator = false
        
        delegate = self
        dataSource = self
        
        automaticallyManagesSubnodes = true
        
        backgroundColor = .systemBackground
    }
        
}

extension SmallCollectionNode: ASCollectionDelegate, ASCollectionDataSource {
    
    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        
        let cellNodeBlock = { [weak self] () -> ASCellNode in
            guard let self = self else { return ASCellNode() }
            return SmallCellNode(
                imageUrl: self.movies[indexPath.row].posterPath,
                title: self.movies[indexPath.row].title)
        }
        return cellNodeBlock
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, didSelectItemAt indexPath: IndexPath) {
//        presenter.goToDetail(idMovie: movies[indexPath.row].idMovie)
    }
    
}
