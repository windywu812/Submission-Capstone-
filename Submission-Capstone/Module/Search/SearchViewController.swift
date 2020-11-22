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
import Search

class SearchViewController: ASDKViewController<ASDisplayNode> {
    
    private let presenter: SearchPresenter
    private let disposeBag: DisposeBag
    private let searchController: UISearchController
    private let tableView: UITableView
    private let placeholderLabel: UILabel
    private let activityIndicator: UIActivityIndicatorView
    
    init(presenter: SearchPresenter) {
        searchController = UISearchController()
        tableView = UITableView()
        placeholderLabel = UILabel()
        disposeBag = DisposeBag()
        activityIndicator = UIActivityIndicatorView()
        
        self.presenter = presenter
        super.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupActivity()
        bind()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleDimiss))
        view.addGestureRecognizer(tap)
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
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                    guard let movies = try? self.presenter.listMovies.value(),
                          let keyword = self.searchController.searchBar.text else { return }
                    if movies.isEmpty {
                        let alert = UIAlertController(
                            title: "No result with \"\(keyword)\"",
                            message: "Please enter different keyword",
                            preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Okay", style: .default))
                        self.present(alert, animated: true)
                        self.activityIndicator.isHidden = true
                    }
                }
                self.searchController.dismiss(animated: true, completion: nil)
            })
            .disposed(by: disposeBag)
        
        presenter.listMovies
            .observeOn(MainScheduler.instance)
            .bind(to: tableView.rx.items(cellIdentifier: MovieRowCell.reuseIdentifier, cellType: MovieRowCell.self)) { _, model, cell in
                cell.searchModel = model
            }
            .disposed(by: disposeBag)
        
        tableView.rx
            .modelSelected(SearchModel.self)
            .subscribe(onNext: { [weak self] (movie) in
                if let index = self?.tableView.indexPathForSelectedRow {
                    self?.tableView.deselectRow(at: index, animated: true)
                    self?.presenter.goToDetail(idMovie: movie.idMovie)
                }
            })
            .disposed(by: disposeBag)
        
        presenter.listMovies
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] movie in
                if movie.isEmpty {
                    self?.activityIndicator.isHidden = false
                } else {
                    self?.activityIndicator.isHidden = true
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
    
    private func setupActivity() {
        activityIndicator.style = .large
        view.addSubview(activityIndicator)
        activityIndicator.alpha = 0
        activityIndicator.setConstraint(
            centerXAnchor: view.centerXAnchor,
            centerYAnchor: view.centerYAnchor, centerYAnchorConstant: -30)
    }
    
    @objc private func handleDimiss() {
        view.endEditing(true)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
