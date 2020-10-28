//
//  ViewController.swift
//  Submission-Capstone
//
//  Created by Windy on 27/10/20.
//

import AsyncDisplayKit
import RxSwift
import RxCocoa

class HomeViewController: ASDKViewController<ASDisplayNode> {
    
    var presenter: HomePresenter?
    
    private let disposeBag = DisposeBag()
    
    private let nameTitle = ASTextNode()
    private var highlightNode: HighlightNode
    
    override init() {
        
        highlightNode = HighlightNode()
        
        super.init(node: ASDisplayNode())
        node.automaticallyManagesSubnodes = true
        
        nameTitle.attributedText = NSAttributedString(
            string: "Top Rated Movies",
            attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22, weight: .bold),
                NSAttributedString.Key.foregroundColor: UIColor.label
            ])
                
        node.layoutSpecBlock = { _, _ in
            let titleInset = ASInsetLayoutSpec(
                insets: UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 0),
                child: self.nameTitle)
            
            return ASStackLayoutSpec(
                direction: .vertical,
                spacing: 16,
                justifyContent: .start,
                alignItems: .start,
                children: [titleInset, self.highlightNode])
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
    }
    
    private func bind() {
        presenter?.topRatedMovies
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (movies) in
                self.highlightNode = HighlightNode(movies: movies)
            })
            .disposed(by: disposeBag)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class HighlightNode: ASPagerNode {
    
    private var movies: [MovieModel]
    
    init(movies: [MovieModel] = []) {
        
        self.movies = movies
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        super.init(frame: .zero, collectionViewLayout: layout, layoutFacilitator: nil)
        
        style.height = ASDimension(unit: .points, value: 200)
        showsHorizontalScrollIndicator = false
        
        delegate = self
        dataSource = self
        
        reloadData()
    }
    
}

extension HighlightNode: ASCollectionDelegate, ASCollectionDataSource {
    
    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        let cellNodeBlock = { [weak self] () -> ASCellNode in
            guard let self = self else { return ASCellNode() }
            return HighlightCell(imageUrl: self.movies[indexPath.row].posterPath)
        }
        return cellNodeBlock
    }
    
}

class HighlightCell: ASCellNode {
    
    private let imageNode: ASNetworkImageNode
    
    init(imageUrl: String) {
        
        imageNode = ASNetworkImageNode()
        
        super.init()
        
        imageNode.url = URL(string: "https://image.tmdb.org/t/p/w500/\(imageUrl)")
        imageNode.style.preferredSize = CGSize(width: UIScreen.main.bounds.width, height: 200)
        imageNode.backgroundColor = .systemRed
        imageNode.contentMode = .scaleToFill
        imageNode.delegate = self
        
        automaticallyManagesSubnodes = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASStackLayoutSpec(
            direction: .vertical,
            spacing: 0,
            justifyContent: .start,
            alignItems: .start,
            children: [imageNode])
    }
    
}

extension HighlightCell: ASNetworkImageNodeDelegate {
    
    func imageNodeDidStartFetchingData(_ imageNode: ASNetworkImageNode) {
        print("fetchin")
    }
    
    func imageNode(_ imageNode: ASNetworkImageNode, didLoad image: UIImage, info: ASNetworkImageLoadInfo) {
        print("done")
    }
    
}
