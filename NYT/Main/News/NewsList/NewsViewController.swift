//
//  NewsViewController.swift
//  NYNews
//
//  Created by Diana on 11/24/20.
//

import UIKit
import Kingfisher

class NewsViewController: BaseViewController {
    
    // The Model that contains the business of the Controller
    let model = NewsModel()
    var tableArray = [NewsObjectModel]()
    
    // Table View
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.tableFooterView = UIView()
            // Setup the Table View delegate and datasource
            tableView.delegate   = self
            tableView.dataSource = self
            // Register TableCell
            tableView.register(UINib(nibName: NewsTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: NewsTableViewCell.identifier)
            // Setup the Refresh Control
            tableView.setRefreshcontrol(target: self, action: #selector(refreshData))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Navigation title
        self.setTitle(translate("news_title"))
//        self.setTitle(nil)
    }
    
    func setupViews() {
        // api call
        self.getData()
    }
    
    func getData() {
        self.tableView.beginRefreshing()
        model.getNews { (error, data) in
            self.tableView.endRefreshing()
            if let error = error {
                Utils.showAlert(title: translate("error"), message: error, cancelButton: translate("ok"), style: .alert)
            } else {
                self.tableArray = data ?? []
                self.buildTableView()
            }
        }
    }
    
    @objc func refreshData() {
        // api call
        self.getData()
    }
    
    func buildTableView() {
        if self.tableArray.count == 0 {
            self.tableView.emptyMessage(message: translate("empty_results"))
        } else {
            self.tableView.restore()
        }
        self.tableView.reloadAsync()
    }
}
extension NewsViewController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier) as? NewsTableViewCell else {
            return UITableViewCell()
        }
        let newsDetail = self.tableArray[indexPath.row]
        cell.titleLabel.text  = newsDetail.title
        cell.byLineLabel.text = newsDetail.byline
        cell.dateLabel.text   = newsDetail.published_date
        
        let media = newsDetail.media ?? []
        if media.count != 0 {
            let mediaItem = media.first
            let mediaMetadata = mediaItem?.mediaMetadata ?? []
            if mediaMetadata.count != 0 {
                var link = ""
                for mediaMetadataItem in mediaMetadata
                where mediaMetadataItem.format == MediaFormat.standard_Thumbnail.rawValue {
                    link = mediaMetadataItem.url ?? ""
                }
                
                if !link.isEmpty {
                    let url = URL(string: link)
                    cell.img.kf.setImage(with: url, placeholder: UIImage(named: "placeholder"))
                }
            }
        } else {
            cell.img.image = UIImage(named: "placeholder")
        }
        return cell
    }
}

extension NewsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //open details
        guard let child = coreapp.articleDetailsStoryboard.instantiateViewController(withIdentifier: "ArticleDetailsViewController") as? ArticleDetailsViewController else { return }
        child.article = self.tableArray[indexPath.row]
        self.navigationController?.pushViewController(child, animated: true)
    }
}
