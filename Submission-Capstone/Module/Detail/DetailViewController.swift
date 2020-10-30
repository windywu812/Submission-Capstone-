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
    
    var presenter: DetailPresenter
    
    var headerNode: TopNode
    
    let runtime = ASTextNode()
    let voteAverage = ASTextNode()
    let voteCount = ASTextNode()
    
    let genre = ASTextNode()
    let spokenLang = ASTextNode()
    let production = ASTextNode()
    
    let titleNode: ASTextNode
    
    private let disposeBag = DisposeBag()
    
    init(presenter: DetailPresenter) {
        
        self.presenter = presenter
        headerNode = TopNode()
        titleNode = ASTextNode()
        
        super.init(node: ASScrollNode())
        
        node.automaticallyManagesSubnodes = true
        node.automaticallyManagesContentSize = true
        
        node.layoutSpecBlock = { _, _ in
            
            let titleInset = ASInsetLayoutSpec(
                insets: UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 16),
                child: self.titleNode)
            
            let mainStack = ASStackLayoutSpec(
                direction: .vertical,
                spacing: 16,
                justifyContent: .start,
                alignItems: .start,
                children: [titleInset, self.headerNode])
        
            return ASInsetLayoutSpec(
                insets: UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0),
                child: mainStack)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
    }
    
    private func bind() {
        presenter.detailMovie
            .observeOn(MainScheduler.instance)
            .subscribe { (detailMovie) in
                
                if let detail = detailMovie.element {
                    
                    self.title = "Detail"
                    
                    self.titleNode.attributedText = NSAttributedString.title1Font(text: detail?.title ?? "")
                    self.headerNode = TopNode(imageURL: detail?.backdropPath ?? "",
                                              overview: detail?.overview ?? "No overview",
                                              status: detail?.status ?? "-",
                                              release: detail?.releaseDate ?? "-",
                                              popularity: detail?.popularity ?? 0, tagline: detail?.tagline ?? "No tagline")
                }
            }
            .disposed(by: disposeBag)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
