//
//  SearchViewController.swift
//  Submission-Capstone
//
//  Created by Windy on 30/10/20.
//

import AsyncDisplayKit
import RxSwift
import RxCocoa

class SearchViewController: ASDKViewController<ASDisplayNode> {
    
    private let presenter: SearchPresenter
    private let disposeBag = DisposeBag()
    
    private let tableView: UITableView
    
    private let searchController = UISearchController()
    
    init(presenter: SearchPresenter) {
        
        self.presenter = presenter
        
        tableView = UITableView(frame: UIScreen.main.bounds)
        
        super.init(node: ASDisplayNode())
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.getMovies(keyword: ".")
        
        navigationItem.searchController = searchController
        
        bind()
        
        setupTableView()
    }
    
    private func bind() {
        
        searchController.searchBar.rx.text.orEmpty
            .debounce(.milliseconds(500), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .filter({ !$0.isEmpty })
            .subscribe { (keyword) in
                self.presenter.getMovies(keyword: keyword)
            }
            .disposed(by: disposeBag)

        presenter.listMovies
            .observeOn(MainScheduler.instance)
            .bind(to: tableView.rx.items(cellIdentifier: "Cell")) { index, model, cell in
                cell.textLabel?.text = model.title
            }
            .disposed(by: disposeBag)
        
    }
    
    private func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
//        tableView.register(MovieRowCell.self, forCellReuseIdentifier: MovieRowCell.reuseIdentifier)
        
        view.addSubview(tableView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class MovieRowCell: ASCellNode {
    
    static let reuseIdentifier = "MovieCell"
    
    let imageNode: ASNetworkImageNode
    let titleNode: ASTextNode
    let overviewNode: ASTextNode
    
    init(imageURL: String, title: String, overview: String) {
        
        imageNode = ASNetworkImageNode()
        titleNode = ASTextNode()
        overviewNode = ASTextNode()
        
        super.init()
        
        automaticallyManagesSubnodes = true
        
        imageNode.style.preferredSize = CGSize(width: 100, height: 200)
        imageNode.backgroundColor = .systemGray4
        imageNode.url = URL(string: imageURL)
        
        titleNode.attributedText = NSAttributedString.title3Font(text: title)
        overviewNode.attributedText = NSAttributedString.bodyFont(text: overview)
        overviewNode.maximumNumberOfLines = 3
        overviewNode.truncationMode = .byTruncatingTail
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        let rightStack = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 8,
            justifyContent: .start,
            alignItems: .start,
            children: [titleNode, overviewNode])
        
        let mainStack = ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 16,
            justifyContent: .start,
            alignItems: .baselineFirst,
            children: [imageNode, rightStack])
        
        return ASInsetLayoutSpec(
            insets: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16),
            child: mainStack)
    }
 
}
