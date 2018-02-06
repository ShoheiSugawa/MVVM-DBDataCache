//
//  Repository.swift
//  GitHubRepoList
//
//  Created by Shohei Sugawa on 2018/02/02.
//  Copyright © 2018年 Shohei.Sugawa. All rights reserved.
//

import Foundation
import RealmSwift

class Repository: Object, Codable {
    @objc dynamic var name: String = ""
    @objc dynamic var url: String = ""
    @objc dynamic var author: String = ""
    @objc dynamic var repoDescription: String = ""
    @objc dynamic var avatarUrl: String = ""
}
