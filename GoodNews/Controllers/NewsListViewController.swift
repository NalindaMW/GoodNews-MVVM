//
//  ViewController.swift
//  GoodNews
//
//  Created by Nalinda Wickramarathna on 8/29/22.
//

import UIKit

class NewsListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var articleListVM: ArticleListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private func setup() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
        Webservice().fetchArticles { articles in
            if let safeArticles = articles {
                self.articleListVM = ArticleListViewModel(articles: safeArticles)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}

extension NewsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleListVM?.articles.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleCell
        
        let article = articleListVM?.articleAtIndex(indexPath.row)
        
        cell.titleLabel.text = article?.title
        cell.descriptionLabel.text = article?.description
        return cell
    }
    
    
}

