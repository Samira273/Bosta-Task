//
//  AlbumDetailsVC.swift
//  BostaTask
//
//  Created by Samira Marassy on 17/06/2022.
//

import UIKit

class AlbumDetailsVC: BaseVC {
    
    @IBOutlet weak var detailsCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    private lazy var albumDetailsCollectionViewDataSource = makeDataSource()
    
    var viewModel: AlbumDetailsVM!
    init(viewModel: AlbumDetailsVM) {
        self.viewModel = viewModel
        super.init(viewModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.loadAlbumDetailsData()
        DispatchQueue.main.async {
            self.configureNavBar()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.async {
            self.configureNavBar()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
    }
    
    func prepareView() {
        AlbumDetailsCollectionViewCell.register(with: detailsCollectionView)
        detailsCollectionView.collectionViewLayout = createLayout()
        detailsCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        searchBar.delegate = self
        viewModel.updateSearchResult = updateView(with:)
    }
    
    func updateView(with models: [AlbumDetailsModel]?) {
        var currentSnapshot = albumDetailsCollectionViewDataSource.snapshot()
        currentSnapshot.deleteAllItems()
        currentSnapshot.appendSections([.main])
        currentSnapshot.appendItems(models ?? [], toSection: .main)
        albumDetailsCollectionViewDataSource.apply(currentSnapshot, animatingDifferences: false)
    }
    
    func configureNavBar() {
        let backBarBtnItem = UIBarButtonItem()
        backBarBtnItem.title = viewModel.getAlbum()?.title
        navigationController?.navigationBar.backItem?.backBarButtonItem = backBarBtnItem
    }
    
    override func updateViewWithData() {
        var snapshot = NSDiffableDataSourceSnapshot<Sections, AlbumDetailsModel>()
        snapshot.appendSections([.main])
        snapshot.appendItems(viewModel.getAlbumDetails() ?? [])
        albumDetailsCollectionViewDataSource.apply(snapshot, animatingDifferences: true)
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3333),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalWidth(0.2))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                         subitems: [item])

        let section = NSCollectionLayoutSection(group: group)

        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
    
    private func makeDataSource() -> UICollectionViewDiffableDataSource<Sections, AlbumDetailsModel> {
        return UICollectionViewDiffableDataSource<Sections, AlbumDetailsModel>(
            collectionView: detailsCollectionView) {(collectionView, indexPath, albumDetails) -> UICollectionViewCell? in
                return AlbumDetailsCollectionViewCell.dequeue(from: collectionView, for: indexPath, albumDetails: albumDetails)
        }
    }
    
}

extension AlbumDetailsVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchBarDidChange(with: searchText)
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("searchBarSearchButtonClicked")
        if searchBar.text?.isEmpty ?? true {
            updateView(with: viewModel.getAlbumDetails())
        }
        searchBar.resignFirstResponder()
    }
    
}
