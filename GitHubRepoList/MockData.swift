//
//  MockData.swift
//  GitHubRepoList
//
//  Created by Shohei Sugawa on 2018/02/02.
//  Copyright © 2018年 Shohei.Sugawa. All rights reserved.
//

import Foundation

struct MockData {
    static let list = """
[
    {
        "name": "xi-mac",
        "url": "https://github.com/google/xi-mac",
        "author": "google",
        "repoDescription":"No description, website, or topics provided." ,
        "avatarUrl": "https://avatars1.githubusercontent.com/u/1342004?v=4"
    },
    {
        "name": "DeepDiff",
        "url": "https://github.com/onmyway133/DeepDiff",
        "author": "onmyway133",
        "repoDescription": "🦀 Very fast diffing in Swift",
        "avatarUrl": "https://avatars1.githubusercontent.com/u/2284279?v=4"
    },
    {
        "name": "terminal",
        "url": "https://github.com/louisdh/terminal",
        "author": "louisdh",
        "repoDescription": "OpenTerm, a sandboxed command line interface for iOS",
        "avatarUrl": "https://avatars0.githubusercontent.com/u/1129119?v=4"
    }
]
""".data(using: .utf8)!
}

