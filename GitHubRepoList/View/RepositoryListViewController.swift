//
//  ViewController.swift
//  GitHubRepoList
//
//  Created by Shohei Sugawa on 2018/02/02.
//  Copyright © 2018年 Shohei.Sugawa. All rights reserved.
//

import UIKit

class RepositoryListController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    

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
        
    }

}

extension RepositoryListController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RepositoryCell.identifier, for: indexPath)
        return cell
    }
}



