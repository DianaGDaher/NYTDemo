//
//  NewsListTableViewCell.swift
//  NYNews
//
//  Created by Diana on 11/24/20.
//

import UIKit
//import Kingfisher

class NewsTableViewCell: UITableViewCell {
    
    static var identifier = "NewsTableViewCell"
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.font = UIFont.systemFont(ofSize: 17)
            titleLabel.textColor = UIColor.label
        }
    }
    @IBOutlet weak var byLineLabel: UILabel! {
        didSet {
            byLineLabel.font = UIFont.systemFont(ofSize: 15)
            byLineLabel.textColor = UIColor.label
        }
    }
    @IBOutlet weak var dateLabel: UILabel! {
        didSet {
            dateLabel.font = UIFont.systemFont(ofSize: 12)
            dateLabel.textColor = UIColor.label.withAlphaComponent(0.7)
        }
    }
    @IBOutlet weak var img: UIImageView! {
        didSet {
            img.layer.cornerRadius = 10
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
