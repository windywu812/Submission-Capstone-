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
    
    let titleNode = ASTextNode()
    
    private let disposeBag = DisposeBag()
    
    init(presenter: DetailPresenter) {
        
        self.presenter = presenter
        
        super.init(node: ASScrollNode())
        
        node.automaticallyManagesSubnodes = true
        node.automaticallyManagesContentSize = true
        
        node.layoutSpecBlock = { _, _ in
            return ASCenterLayoutSpec(centeringOptions: .XY, sizingOptions: [], child: self.titleNode)
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        presenter.detailMovie
            .observeOn(MainScheduler.instance)
            .subscribe { (detailMovie) in
                self.titleNode.attributedText = NSAttributedString.setFont(
                    text: detailMovie.element??.title ?? "sfdfdfdf", fontSize: 34, color: .label, weight: .regular)
            }
            .disposed(by: disposeBag)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
