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
    
    var presenter: HomePresenter
    
    private let disposeBag = DisposeBag()
    
    private var nowPlaying: LargeSection
    private var topRated: MediumSection
    private var popular: MediumSection
    private var upcoming: SmallSection

    init(presenter: HomePresenter) {
        self.presenter = presenter
        
        topRated = MediumSection(movies: [])
        popular = MediumSection(movies: [])
        nowPlaying = LargeSection(movies: [], presenter: presenter)
        upcoming = SmallSection(movies: [])
        
        super.init(node: ASScrollNode())

        node.automaticallyManagesSubnodes = true
        node.automaticallyManagesContentSize = true
        
        node.layoutSpecBlock = { _, _ in
            let stack = ASStackLayoutSpec(
                direction: .vertical,
                spacing: 16,
                justifyContent: .start,
                alignItems: .start,
                children: [self.nowPlaying, self.topRated, self.popular, self.upcoming])
            
            return ASInsetLayoutSpec(
                insets: UIEdgeInsets(top: 0, left: 0, bottom: 16, right: 0),
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
                self.nowPlaying = LargeSection(movies: movies, presenter: self.presenter)
                self.node.setNeedsLayout()
            })
            .disposed(by: disposeBag)
        
        presenter.topRatedMovies
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (movies) in
                self.topRated = MediumSection(title: "Top Rated", movies: movies)
                self.node.setNeedsLayout()
            })
            .disposed(by: disposeBag)
        
        presenter.popularMovies
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (movies) in
                self.popular = MediumSection(title: "Popular", movies: movies)
                self.node.setNeedsLayout()
            })
            .disposed(by: disposeBag)
        
        presenter.upcomingMovies
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (movies) in
                self.upcoming = SmallSection(title: "Upcoming", movies: movies)
                self.node.setNeedsLayout()
            })
            .disposed(by: disposeBag)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
