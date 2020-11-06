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
    private let disposeBag: DisposeBag
    private let searchController: UISearchController
    private let tableView: UITableView
    private let placeholderLabel: UILabel
    
    init(presenter: SearchPresenter) {
        searchController = UISearchController()
        tableView = UITableView()
        placeholderLabel = UILabel()
        disposeBag = DisposeBag()
        
        self.presenter = presenter
        super.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        bind()
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
        
        searchController.searchBar.rx.searchButtonClicked
            .subscribe(onNext: {
                guard let movies = try? self.presenter.listMovies.value(),
                      let keyword = self.searchController.searchBar.text else { return }
                if movies.isEmpty {
                    let alert = UIAlertController(
                        title: "No result with \"\(keyword)\"",
                        message: "Please enter different keyword",
                        preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Okay", style: .default))
                    self.present(alert, animated: true)
                }
            })
            .disposed(by: disposeBag)
        
        presenter.listMovies
            .observeOn(MainScheduler.instance)
            .bind(to: tableView.rx.items(cellIdentifier: MovieRowCell.reuseIdentifier, cellType: MovieRowCell.self)) { _, model, cell in
                cell.movieModel = model
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
        navigationItem.searchController = searchController
        
        tableView.register(MovieRowCell.self, forCellReuseIdentifier: MovieRowCell.reuseIdentifier)
        tableView.rowHeight = 200
        tableView.separatorStyle = .none
        view.addSubview(tableView)
        
        tableView.setConstraint(
            topAnchor: view.safeAreaLayoutGuide.topAnchor,
            bottomAnchor: view.safeAreaLayoutGuide.bottomAnchor,
            leadingAnchor: view.safeAreaLayoutGuide.leadingAnchor,
            trailingAnchor: view.safeAreaLayoutGuide.trailingAnchor)
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn) {
            self.view.alpha = 1
            self.navigationController?.navigationBar.prefersLargeTitles = true
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn) {
            self.view.alpha = 0
            self.navigationController?.navigationBar.prefersLargeTitles = false
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
