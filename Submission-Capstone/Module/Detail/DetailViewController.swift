//
//  DetailView.swift
//  Submission-Capstone
//
//  Created by Windy on 29/10/20.
//

import RxCocoa
import RxSwift
import AsyncDisplayKit

class DetailViewController: ASDKViewController<ASScrollNode> {
    
    private var presenter: DetailPresenter
    
    private let titleNode: ASTextNode
    private var topNode: TopNode
    private var middleNode: MiddleNode
    private var bottomNode: BottomNode
        
    private let disposeBag = DisposeBag()
    
    init(presenter: DetailPresenter) {
        
        self.presenter = presenter
        
        titleNode = ASTextNode()
        topNode = TopNode()
        middleNode = MiddleNode()
        bottomNode = BottomNode()
        
        super.init(node: ASScrollNode())
        
        node.automaticallyManagesSubnodes = true
        node.automaticallyManagesContentSize = true
        
        node.layoutSpecBlock = { _, _ in
            
            let titleInset = ASInsetLayoutSpec(
                insets: UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 16),
                child: self.titleNode)
            
            let mainStack = ASStackLayoutSpec(
                direction: .vertical,
                spacing: 24,
                justifyContent: .start,
                alignItems: .start,
                children: [titleInset, self.topNode, self.middleNode, self.bottomNode])
        
            return ASInsetLayoutSpec(
                insets: UIEdgeInsets(top: 0, left: 0, bottom: 16, right: 0),
                child: mainStack)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        checkIfAdded()
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
        
        navigationItem.rightBarButtonItem =
            UIBarButtonItem(image: UIImage(systemName: "heart"),
                            style: .plain,
                            target: self,
                            action: #selector(addToWatchList))
    }
    
    @objc private func addToWatchList() {
        presenter.addToWatchlist()
        checkIfAdded()
    }
    
    private func checkIfAdded() {
        if presenter.checkIfAdded() {
            navigationItem.rightBarButtonItem?.image = UIImage(systemName: "heart.fill")
        } else {
            navigationItem.rightBarButtonItem?.image = UIImage(systemName: "heart")
        }
        node.setNeedsLayout()
    }
        
    private func bind() {
        presenter.detailMovie
            .observeOn(MainScheduler.instance)
            .subscribe { (detailMovie) in
                if let detail = detailMovie.element {
                    self.title = "Detail"
                    self.titleNode.attributedText = NSAttributedString.title1Font(text: detail?.title ?? "")
                    self.topNode = TopNode(imageURL: detail?.backdropPath ?? "",
                                              overview: detail?.overview ?? "No overview",
                                              status: detail?.status ?? "-",
                                              release: detail?.releaseDate ?? "-",
                                              popularity: detail?.popularity ?? 0,
                                              tagline: detail?.tagline ?? "No Tagline")
                    
                    self.middleNode = MiddleNode(runtime: detail?.runtime ?? 0,
                                                 voteAverage: detail?.voteAverage ?? 0,
                                                 voteCount: detail?.voteCount ?? 0,
                                                 genre: detail?.genres.map({ $0 }) ?? [""])
                    
                    self.bottomNode = BottomNode(lang: detail?.spokenLanguages ?? [],
                                                 production: detail?.productionCompanies ?? [])
                }
            }
            .disposed(by: disposeBag)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
