//
//  ViewController.swift
//  Submission-Capstone
//
//  Created by Windy on 27/10/20.
//

import AsyncDisplayKit
import RxSwift
import RxCocoa
import Movie

class MovieViewController: ASDKViewController<ASScrollNode> {
    
    private let disposeBag = DisposeBag()
    private var nowPlaying: LargeSection
    private var topRated: MediumSection
    private var popular: MediumSection
    private var upcoming: SmallSection
    
    let presenter: MoviePresenter

    init(presenter: MoviePresenter) {
        self.presenter = presenter
        
        topRated = MediumSection(movies: [], presenter: presenter)
        popular = MediumSection(movies: [], presenter: presenter)
        nowPlaying = LargeSection(movies: [], presenter: presenter)
        upcoming = SmallSection(movies: [], presenter: presenter)
        
        super.init(node: ASScrollNode())

        node.automaticallyManagesSubnodes = true
        node.automaticallyManagesContentSize = true
        
        node.layoutSpecBlock = { _, _ in
            let stack = ASStackLayoutSpec(
                direction: .vertical,
                spacing: 32,
                justifyContent: .start,
                alignItems: .start,
                children: [self.nowPlaying, self.topRated, self.popular, self.upcoming])
            
            return ASInsetLayoutSpec(
                insets: UIEdgeInsets(top: 0, left: 0, bottom: 32, right: 0),
                child: stack)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
    }
    
    private func bind() {
                
        presenter.nowPlayingMovies
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (movies) in
                self.nowPlaying = LargeSection(
                    movies: movies,
                    presenter: self.presenter)
                self.node.setNeedsLayout()
            })
            .disposed(by: disposeBag)
        
        presenter.topRatedMovies
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (movies) in
                self.topRated = MediumSection(
                    title: "top_rated".localized(identifier: "com.windy.Common"),
                    movies: movies,
                    presenter: self.presenter)
                self.node.setNeedsLayout()
            })
            .disposed(by: disposeBag)
        
        presenter.popularMovies
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (movies) in
                self.popular = MediumSection(
                    title: "popular".localized(identifier: "com.windy.Common"),
                    movies: movies,
                    presenter: self.presenter)
                self.node.setNeedsLayout()
            })
            .disposed(by: disposeBag)
        
        presenter.upcomingMovies
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (movies) in
                self.upcoming = SmallSection(
                    title: "upcoming".localized(identifier: "com.windy.Common"),
                    movies: movies,
                    presenter: self.presenter)
                self.node.setNeedsLayout()
            })
            .disposed(by: disposeBag)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
