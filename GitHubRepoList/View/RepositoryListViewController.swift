//
//  ViewController.swift
//  GitHubRepoList
//
//  Created by Shohei Sugawa on 2018/02/02.
//  Copyright © 2018年 Shohei.Sugawa. All rights reserved.
//

import UIKit

class RepositoryListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var viewModel: RepositoryListViewModel = {
        return RepositoryListViewModel()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        
        collectionView?.register(RepositoryCell.nib, forCellWithReuseIdentifier: RepositoryCell.identifier)
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = UICollectionViewFlowLayoutAutomaticSize
        }
        
        loadData()
    }
    
    private func loadData() {
        // 受けたデータをどうするかはVCが決める
        viewModel.observeRepoObject = { [weak self] () in
            DispatchQueue.main.async {
                // reloadData()だと全ての更新が走るので、差分のみreloadできるようにする
                self?.collectionView.reloadData()
            }
        }
        viewModel.fetchRepos()
    }

}

extension RepositoryListViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let repos = viewModel.repoList else {
            return 0
        }
        return repos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RepositoryCell.identifier, for: indexPath) as! RepositoryCell
        let repo = viewModel.getRepo(at: indexPath)
        
        cell.nameLabel.text = repo.name
        cell.urlLabel.text = repo.url
        cell.authorLabel.text = repo.author
        cell.descriptionLabel.text = repo.repoDescription

        return cell
    }
}



