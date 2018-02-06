//
//  RepositoryDataSource.swift
//  GitHubRepoList
//
//  Created by Shohei Sugawa on 2018/02/02.
//  Copyright © 2018年 Shohei.Sugawa. All rights reserved.
//

import Foundation
import RealmSwift

class RepositoryDataSource/*: RepositoryDataSourceProtocol*/ {
    
    let apiService: APIServiceProtocol
    
    private var realm: Realm!
    private var repoList: Results<Repository>!
    private var notificationToken: NotificationToken!

    // MARK: - closure
    var observeRepoObject: ((Results<Repository>) -> ())?
    
    // MARK: - functions
    init(apiService: APIServiceProtocol = APIService()) {
        self.apiService = apiService
        
        // TODO: DBにデータがあればVMに渡す
        // APIリクエストをしてDBを更新
        // 差分があればVMのmodel objectを更新
        
        realm = try! Realm()
        repoList = realm.objects(Repository.self)
        notificationToken = repoList.observe{ [weak self] changes in
            switch changes {
            case .initial:
                self?.observeRepoObject?((self?.repoList)!)
                break
            case .update:
                self?.observeRepoObject?((self?.repoList)!)
                break
            case .error:
                break
                
            }
        }
        
        fetchRepoListViaAPI()
    }
    
    deinit {
        notificationToken.invalidate()
    }
    
    // API経由でデータを取得
    func fetchRepoListViaAPI() {
        apiService.fetchRepoList { (success, repos) in
            if success {
                self.saveRepoListToDB(items: repos)
            }
        }
    }
    
    // DBからデータを取得
    func fetchRepoListFromDB() {
        repoList = realm.objects(Repository.self)
    }
    
    // APIから取得したデータをDBに保存
    func saveRepoListToDB(items: [Repository]) {
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        try! realm.write {
            let results = realm.objects(Repository.self)
            realm.delete(results)
            realm.add(items)
        }
    }
}
