//
//  ArticleDetailsViewController.swift
//  NYT
//
//  Created by Diana on 11/24/20.
//

import UIKit

class ArticleDetailsViewController: BaseViewController {
    
    var article: NewsObjectModel?
    
    @IBOutlet weak var newsImage: UIImageView! {
        didSet {
            newsImage.layer.cornerRadius = 10
        }
    }

    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.font      = UIFont.boldSystemFont(ofSize: 20)
            titleLabel.textColor = UIColor.label
        }
    }
    @IBOutlet weak var byLineLabel: UILabel! {
        didSet {
            byLineLabel.font      = UIFont.systemFont(ofSize: 15)
            byLineLabel.textColor = UIColor.label.withAlphaComponent(0.7)
        }
    }
    @IBOutlet weak var dateLabel: UILabel! {
        didSet {
            dateLabel.font      = UIFont.systemFont(ofSize: 12)
            dateLabel.textColor = UIColor.label
        }
    }
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.font      = UIFont.systemFont(ofSize: 17)
            descriptionLabel.textColor = UIColor.label
        }
    }
    @IBOutlet weak var sourceLabel: UILabel! {
        didSet {
            sourceLabel.font      = UIFont.systemFont(ofSize: 15)
            sourceLabel.textColor = UIColor.label
        }
    }

    @IBOutlet weak var moreButton: UIButton! {
        didSet {
            moreButton.setTitle(translate("view_more"), for: .normal)
            moreButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
        // Do any additional setup after loading the view.
    }
    
    func setupViews() {
        // Nav title
        self.setTitle(article?.section ?? "")
        // Load News Detail
        loadNewsDetail()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func loadNewsDetail() {
        guard let newsDetail = article else {
            return
        }
        Utils.delay(delay: 0) {
            self.view.backgroundColor = .white
        }
        // Set News detail
        titleLabel.text       = newsDetail.title
        byLineLabel.text      = newsDetail.byline
        dateLabel.text        = newsDetail.published_date
        descriptionLabel.text = newsDetail.abstract
        sourceLabel.text      = newsDetail.source
        
        // Set Image
        let media = newsDetail.media ?? []
        if media.count != 0 {
            let mediaItem = media[0]
            let mediaMetadata = mediaItem.mediaMetadata ?? []
            if mediaMetadata.count != 0 {
                var link = ""
                for mediaMetadataItem in mediaMetadata
                    where mediaMetadataItem.format == MediaFormat.medium440.rawValue {
                        link = mediaMetadataItem.url ?? ""
                }
                
                if !link.isEmpty {
                    let url = URL(string: link)
                    newsImage.kf.setImage(with: url,
                                          placeholder: UIImage(named: "placeholder"),
                                          options: [
                                            .scaleFactor(UIScreen.main.scale),
                                            .transition(.fade(0.3)),
                                            .cacheOriginalImage])
                } else {
                    self.newsImage.image = UIImage(named: "placeholder")
                }
            }
        }
    }
    
    @IBAction func viewMore(_ sender: Any) {
        guard let urlString = article?.url ?? "", let url = URL(string: urlString) else {
            return
        }
        // Open the URL in the external browser
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
