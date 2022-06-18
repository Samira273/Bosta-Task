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
    var isSearching = false
    
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
        if isSearching {
            updateView(with: viewModel.getSearchResults())
        } else {
            viewModel.loadAlbumDetailsData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.async {
            self.configureNavBar()
        }
        let singleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.singleTap(sender:)))
        singleTapGestureRecognizer.numberOfTapsRequired = 1
        singleTapGestureRecognizer.isEnabled = true
        singleTapGestureRecognizer.cancelsTouchesInView = false
        self.view.addGestureRecognizer(singleTapGestureRecognizer)
    }
    
    @objc func singleTap(sender: UITapGestureRecognizer) {
        self.searchBar.resignFirstResponder()
        if self.searchBar.text?.isEmpty ?? true {
            updateView(with: viewModel.getAlbumDetails())
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
        detailsCollectionView.delegate = self
        viewModel.updateSearchResult = updateView(with:)
    }
    
    func configureNavBar() {
        
        let button =  UIButton(type: .custom)
        button.addTarget(self, action: #selector(back), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 20, height: 31)
        let imageView = UIImageView.init(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        imageView.image = Asset.icBack.image
        button.addSubview(imageView)
        let label = UILabel(frame: CGRect(x: 25, y: 0, width: button.frame.width - 30, height: 20))
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.text = viewModel.getAlbum()?.title
        label.textAlignment = .center
        label.textColor = Asset.darkGray.color
        label.backgroundColor =  .clear
        label.lineBreakMode = .byTruncatingTail
        button.addSubview(label)
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.leftBarButtonItem = barButton
    }
    
    @objc func back() {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func updateViewWithData() {
        var snapshot = NSDiffableDataSourceSnapshot<Sections, AlbumDetailsModel>()
        snapshot.appendSections([.main])
        snapshot.appendItems(viewModel.getAlbumDetails() ?? [])
        albumDetailsCollectionViewDataSource.apply(snapshot, animatingDifferences: true)
    }
    
    func updateView(with models: [AlbumDetailsModel]?) {
        var currentSnapshot = albumDetailsCollectionViewDataSource.snapshot()
        currentSnapshot.deleteAllItems()
        currentSnapshot.appendSections([.main])
        currentSnapshot.appendItems(models ?? [], toSection: .main)
        albumDetailsCollectionViewDataSource.apply(currentSnapshot, animatingDifferences: false)
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

extension AlbumDetailsVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let cell = collectionView.cellForItem(at: indexPath) as? AlbumDetailsCollectionViewCell {

            guard let image = cell.imageData else { return }
            self.navigationController?.pushViewController(VCsContainer.getImageViewer(with: image), animated: true)
        }
    }
}

extension AlbumDetailsVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchBarDidChange(with: searchText)
        isSearching = true
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("searchBarSearchButtonClicked")
        if searchBar.text?.isEmpty ?? true {
            updateView(with: viewModel.getAlbumDetails())
            isSearching = false
        }
        searchBar.resignFirstResponder()
    }
    
}
