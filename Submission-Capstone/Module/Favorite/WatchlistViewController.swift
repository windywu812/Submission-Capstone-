//
//  FavoriteViewController.swift
//  Submission-Capstone
//
//  Created by Windy on 30/10/20.
//

import AsyncDisplayKit
import RxCocoa
import RxSwift
import SDWebImage

class WatchlistViewController: ASDKViewController<ASDisplayNode> {
    
    private let presenter: WatchlistPresenter
    private let disposeBag = DisposeBag()
    private var tableView: UITableView!
    
    private var placeholderLabel: UILabel!

    init(presenter: WatchlistPresenter ) {
        self.presenter = presenter
        
        super.init(node: ASDisplayNode())
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupLabel()

        bind()
    }
    
    private func setupLabel() {
        placeholderLabel = UILabel()
        placeholderLabel.text = "Currently you don't have any watchlist"
        placeholderLabel.font = .preferredFont(forTextStyle: .title1)
        placeholderLabel.textColor = .secondaryLabel
        placeholderLabel.numberOfLines = 0
        placeholderLabel.textAlignment = .center
        
        view.addSubview(placeholderLabel)
        
        placeholderLabel.setConstraint(
            leadingAnchor: view.leadingAnchor, leadingAnchorConstant: 16,
            trailingAnchor: view.trailingAnchor, trailingAnchorConstant: -16,
            centerXAnchor: view.centerXAnchor,
            centerYAnchor: view.centerYAnchor)
    }

    private func bind() {

         presenter.listMovies
            .observeOn(MainScheduler.instance)
            .bind(to: tableView.rx.items(cellIdentifier: MovieRowCell.reuseIdentifier, cellType: MovieRowCell.self)) { _, model, cell in

                cell.titleLabel.text = model.title
                cell.overviewLabel.text = model.overview
                cell.imagePoster.sd_setImage(with: URL(string: model.posterPath ?? ""))
            }
            .disposed(by: disposeBag)
        
        presenter.listMovies
            .observeOn(MainScheduler.instance)
            .bind { (movies) in
                if movies.isEmpty {
                    self.placeholderLabel.isHidden = false
                } else {
                    self.placeholderLabel.isHidden = true
                }
            }
            .disposed(by: disposeBag)

        tableView.rx
            .modelSelected(MovieModel.self)
            .subscribe(onNext: { [weak self] (movie) in
                if let index = self?.tableView.indexPathForSelectedRow {
                    self?.tableView.deselectRow(at: index, animated: true)
//                    self?.presenter.goToDetail(idMovie: movie.idMovie)
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