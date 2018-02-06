//
//  APIService.swift
//  GitHubRepoList
//
//  Created by Shohei Sugawa on 2018/02/02.
//  Copyright © 2018年 Shohei.Sugawa. All rights reserved.
//

import Foundation

protocol APIServiceProtocol {
    func fetchRepoList(completion: @escaping (_ success: Bool, _ repoList: [Repository]) -> ())
}

class APIService: APIServiceProtocol {
    func fetchRepoList(completion: @escaping (Bool, [Repository]) -> ()) {
        let repos = try? JSONDecoder().decode([Repository].self, from: MockData.list)
        completion(true, repos!)
    }
}
