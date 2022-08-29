//
//  NewsModel.swift
//  GoodNews
//
//  Created by Nalinda Wickramarathna on 2022-08-29.
//

import Foundation

struct NewsModel: Decodable {
    let totalResults: Int
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String?
    let author: String?
}
