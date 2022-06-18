//
//  ProfileVC.swift
//  BostaTask
//
//  Created by Samira Marassy on 17/06/2022.
//

import UIKit

class ProfileVC: BaseVC {

    //MARK: - Properties
    
    @IBOutlet weak var albumsTableView: UITableView!
    var viewModel: ProfileVM!
    private lazy var albumsDataSource = makeAlbumsDataSource()
    
    //MARK: - Inits
    init(viewModel: ProfileVM) {
        self.viewModel = viewModel
        super.init(viewModel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getUserProfileData()
        self.navigationController?.navigationBar.isHiddenIfNeeded = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHiddenIfNeeded = false
        self.navigationController?.navigationBar.topItem?.title = " "
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
    }
    
    //MARK: - Prepare view and data source
   
    func prepareView() {
        ProfileTableViewCell.register(with: albumsTableView)
        ProfileHeaderView.register(with: albumsTableView)
        albumsTableView.estimatedRowHeight = UITableView.automaticDimension
        albumsTableView.estimatedSectionFooterHeight = UITableView.automaticDimension
        albumsTableView.delegate = self
        albumsTableView.dataSource = albumsDataSource
    }

    func makeAlbumsDataSource() -> UITableViewDiffableDataSource<Sections, AlbumModel> {
        
      let dataSource = UITableViewDiffableDataSource<Sections, AlbumModel>(
        tableView: albumsTableView,
        cellProvider: { (tableView, indexPath, album) ->
          UITableViewCell? in
            if indexPath.row == tableView.numberOfRows(inSection: 0) - 1 {
                return ProfileTableViewCell.dequeue(from: self.albumsTableView, for: indexPath, with: album, lastCell: true)
            } else {
                return ProfileTableViewCell.dequeue(from: self.albumsTableView, for: indexPath, with: album)
            }
            
      })
      return dataSource
    }
    
    
    //MARK: - binding data
    override func updateViewWithData() {
        albumsTableView.reloadData()
        var snapshot = NSDiffableDataSourceSnapshot<Sections, AlbumModel>()
        snapshot.appendSections(Sections.allCases)
        snapshot.appendItems(viewModel.getUserAlbums() ?? [], toSection: .main)
        albumsDataSource.apply(snapshot, animatingDifferences: true)
    }
    
}

extension ProfileVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return ProfileHeaderView.dequeue(from: tableView, with: viewModel.getUserProfile())
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let album = albumsDataSource.itemIdentifier(for: indexPath) {
            self.navigationController?.pushViewController(VCsContainer.getAlbumDetailsScene(album: album), animated: true)
        }

    }
}

enum Sections: CaseIterable {
    case main
}
