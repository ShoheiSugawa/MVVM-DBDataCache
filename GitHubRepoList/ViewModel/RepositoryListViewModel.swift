//
//  RepositoryListViewModel.swift
//  GitHubRepoList
//
//  Created by Shohei Sugawa on 2018/02/02.
//  Copyright © 2018年 Shohei.Sugawa. All rights reserved.
//

import Foundation
import RealmSwift

class RepositoryListViewModel {
    
    lazy var dataSource: RepositoryDataSource = {
        return RepositoryDataSource()
    }()
    
    var repoList: Results<Repository>?
    
    // MARK: - closure
    var observeRepoObject:(() -> ())?
    
    // MARK: - functions
    init() {
        dataSource.observeRepoObject = { [weak self] repos in
            self?.repoList = repos
            self?.observeRepoObject!()
        }
    }
    func getRepo(at indexPath: IndexPath) -> Repository {
        return repoList![indexPath.item]
    }
    
    func fetchRepos() {
        dataSource.fetchRepoListFromDB()
    }

}
