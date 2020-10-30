//
//  NowPlayingNode.swift
//  Submission-Capstone
//
//  Created by Windy on 28/10/20.
//

import AsyncDisplayKit

class LargeCollectionNode: ASCollectionNode {
    
    private var movies: [MovieModel]
    private var presenter: HomePresenter
    
    init(movies: [MovieModel] = [], presenter: HomePresenter) {
        
        self.movies = movies
        self.presenter = presenter
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        super.init(frame: .zero, collectionViewLayout: layout, layoutFacilitator: nil)
        
        style.height = ASDimension(unit: .points, value: 300)
        alwaysBounceHorizontal = true
        showsHorizontalScrollIndicator = false
        
        delegate = self
        dataSource = self
        
        backgroundColor = .systemBackground
    }
    
}

extension LargeCollectionNode: ASCollectionDelegate, ASCollectionDataSource {
    
    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        let cellNodeBlock = { [weak self] () -> ASCellNode in
            guard let self = self else { return ASCellNode() }
            return LargeCellNode(
                imageUrl: self.movies[indexPath.row].backdropPath,
                title: self.movies[indexPath.row].title,
                overview: self.movies[indexPath.row].overview)
        }
        return cellNodeBlock
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, didSelectItemAt indexPath: IndexPath) {
        presenter.goToDetail(idMovie: movies[indexPath.row].idMovie)
    }
    
}
