//
//  UITableViewExtension.swift
//  NYT
//
//  Created by Diana on 11/24/20.
//
import UIKit

extension UITableView {
    func endRefreshing() {
        self.contentOffset = CGPoint.init(x: 0, y: 0)
        Utils.delay(delay: 0.1) {
            self.refreshControl?.endRefreshing()
        }
    }
    func beginRefreshing() {
        self.contentOffset = CGPoint.init(x: 0, y: -60)
        Utils.delay(delay: 0.1) {
            self.refreshControl?.beginRefreshing()
        }
    }
    func setRefreshcontrol(color:UIColor = .black, target:UIViewController, action:Selector)  {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = color
        refreshControl.addTarget(target, action: action, for: .valueChanged)
        self.refreshControl = refreshControl
    }
    func reloadAsync() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
    
    func restore() {
        self.backgroundView = nil
    }
    
    func emptyMessage(message:String, height:CGFloat? = nil, y:CGFloat? = nil) {
        
        var _height:CGFloat = 0
        var _y:CGFloat = 0
        if let height = height {
            _height = height
        } else {
            _height = self.bounds.size.height
        }
        if let y = y {
            _y = y
        } else {
            _y = self.center.y
        }
        let wrapper = UIView.init(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
        wrapper.backgroundColor = .clear
        
        let messageLabel = UILabel(frame: CGRect(x: self.center.x, y: _y, width: self.bounds.size.width, height: _height))
        messageLabel.text = message
        messageLabel.backgroundColor = .clear
        messageLabel.textColor = UIColor.lightGray
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = .center;
        messageLabel.sizeToFit()
        wrapper.addSubview(messageLabel)
        messageLabel.center.x = self.center.x
        self.backgroundView = wrapper
        self.separatorStyle = .none
    }
}
