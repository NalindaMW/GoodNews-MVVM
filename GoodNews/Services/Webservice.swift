//
//  Webservice.swift
//  GoodNews
//
//  Created by Nalinda Wickramarathna on 2022-08-29.
//

import Foundation

struct Webservice {
    
    let urlString = "https://newsapi.org/v2/top-headlines?country=us&apiKey=7c691534cc1041e49cb7bdf2c7af86e1"
    
    func fetchArticles(completion: @escaping ([Article]?) -> Void) {
        
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data, response, error in
                if let safeError = error {
                    print(safeError.localizedDescription)
                    completion(nil)
                }
                
                if let safeData = data {
                    if let newsModel = parseJSON(newsData: safeData) {
                        completion(newsModel.articles)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(newsData: Data) -> NewsModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(NewsModel.self, from: newsData)
            return decodedData
        } catch {
            print(error)
            return nil
        }
    }
}
