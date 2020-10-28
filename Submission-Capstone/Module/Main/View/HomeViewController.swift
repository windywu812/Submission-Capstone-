//
//  ViewController.swift
//  Submission-Capstone
//
//  Created by Windy on 27/10/20.
//

import AsyncDisplayKit
import RxSwift
import RxCocoa

class HomeViewController: ASDKViewController<ASScrollNode> {
    
    var presenter: HomePresenter?
    
    private let disposeBag = DisposeBag()
    
    private let nameTitle = ASTextNode()
    private var highlightNode: NowPlayingNode
    
    
    override init() {
        
        highlightNode = NowPlayingNode()
        
        super.init(node: ASScrollNode())
        node.automaticallyManagesSubnodes = true
        
        node.automaticallyManagesContentSize = true
        
        nameTitle.attributedText = NSAttributedString(
            string: "Now Playing",
            attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 28, weight: .bold),
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
        presenter?.nowPlayingMovies
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (movies) in
                self.highlightNode = NowPlayingNode(movies: movies)
                self.node.setNeedsLayout()
            })
            .disposed(by: disposeBag)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
