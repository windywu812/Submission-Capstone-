//
//  SearchViewController.swift
//  Submission-Capstone
//
//  Created by Windy on 30/10/20.
//

import AsyncDisplayKit
import RxSwift
import RxCocoa
import SDWebImage

class SearchViewController: ASDKViewController<ASDisplayNode> {
    
    private let presenter: SearchPresenter
    private let disposeBag = DisposeBag()
    private let searchController: UISearchController
    private var tableView: UITableView!
    
    init(presenter: SearchPresenter) {
        
        searchController = UISearchController()
        self.presenter = presenter
        
        super.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.searchController = searchController
        
        setupTableView()
        bind()
        
        presenter.getMovies(keyword: "a")
    }
    
    private func bind() {
        
        searchController.searchBar.rx.text.orEmpty
            .debounce(.milliseconds(400), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .filter({ !$0.isEmpty })
            .subscribe(onNext: { (string) in
                self.presenter.getMovies(keyword: string)
            })
            .disposed(by: disposeBag)
        
        presenter.listMovies
            .observeOn(MainScheduler.instance)
            .bind(to: tableView.rx.items(cellIdentifier: MovieRowCell.reuseIdentifier, cellType: MovieRowCell.self)) { _, model, cell in
                
                cell.titleLabel.text = model.title
                cell.overviewLabel.text = model.overview
                cell.imagePoster.sd_setImage(with: URL(string: model.posterPath))
            }
            .disposed(by: disposeBag)
        
        tableView.rx
            .modelSelected(MovieModel.self)
            .subscribe(onNext: { [weak self] (movie) in
                if let index = self?.tableView.indexPathForSelectedRow {
                    self?.tableView.deselectRow(at: index, animated: true)
                    self?.presenter.goToDetail(idMovie: movie.idMovie)
                }
            })
            .disposed(by: disposeBag)
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: UIScreen.main.bounds)
        tableView.register(MovieRowCell.self, forCellReuseIdentifier: MovieRowCell.reuseIdentifier)
        tableView.rowHeight = 200
        tableView.separatorStyle = .none
        
        view.addSubview(tableView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn) {
            self.view.alpha = 1
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn) {
            self.view.alpha = 0
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
