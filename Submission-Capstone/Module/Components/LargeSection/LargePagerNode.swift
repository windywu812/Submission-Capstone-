//
//  NowPlayingNode.swift
//  Submission-Capstone
//
//  Created by Windy on 28/10/20.
//

import AsyncDisplayKit

class LargePagerNode: ASCollectionNode {
    
    private var movies: [MovieModel]
    
    init(movies: [MovieModel] = []) {
        
        self.movies = movies
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        super.init(frame: .zero, collectionViewLayout: layout, layoutFacilitator: nil)
        
        style.height = ASDimension(unit: .points, value: 300)
        alwaysBounceHorizontal = true
        showsHorizontalScrollIndicator = false
        
        delegate = self
        dataSource = self
    }
    
}

extension LargePagerNode: ASCollectionDelegate, ASCollectionDataSource {
    
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
     
        let interactor = Injection().provideDetailUseCase(idMovie: movies[indexPath.row].idMovie)
        let presenter = DetailPresenter(interactor: interactor, idMovie: movies[indexPath.row].idMovie)
      
    }
    
}
