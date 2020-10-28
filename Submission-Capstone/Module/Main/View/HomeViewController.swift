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
    
    var presenter: MainPresenter?
    
    private let disposeBag = DisposeBag()
    
    private let nameTitle = ASTextNode()
    private let highlightNode = HighlightNode()
    
    override init() {
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
                print(movies)
            })
            .disposed(by: disposeBag)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class HighlightNode: ASPagerNode {
    
    override init() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        super.init(frame: .zero, collectionViewLayout: layout, layoutFacilitator: nil)
        
        style.height = ASDimension(unit: .points, value: 200)
        showsHorizontalScrollIndicator = false
        
        delegate = self
        dataSource = self
    }
    
}

extension HighlightNode: ASCollectionDelegate, ASCollectionDataSource {
    
    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        let cellNodeBlock = { [weak self] () -> ASCellNode in
            guard let self = self else { return ASCellNode() }
            return HighlightCell(imageUrl: "", widthScreen: UIScreen.main.bounds.width)
        }
        return cellNodeBlock
    }
    
}

class HighlightCell: ASCellNode {
    
    private let imageNode: ASNetworkImageNode
    
    init(imageUrl: String, widthScreen: CGFloat) {
        
        imageNode = ASNetworkImageNode()
        
        super.init()
        
        imageNode.url = URL(string: "https://image.tmdb.org/t/p/w500/\(imageUrl)")
        imageNode.delegate = self
        imageNode.style.preferredSize = CGSize(width: widthScreen, height: 200)
        imageNode.backgroundColor = .systemRed
        
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
        
    }
    
    func imageNode(_ imageNode: ASNetworkImageNode, didLoad image: UIImage, info: ASNetworkImageLoadInfo) {
        
    }
    
}
