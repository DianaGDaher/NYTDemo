//
//  BaseViewController.swift
//  NYT
//
//  Created by Diana on 11/24/20.
//

import UIKit

class BaseViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override func viewDidLoad() {
        self.view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    func hideNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func showNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func setTitle(_ title:String?) {
        if let title = title {
            self.navigationItem.title = title
        } else {
            let imageView = UIImageView(image:UIImage(named: "logo"))
            self.navigationItem.titleView = imageView
        }
        self.navigationController?.navigationBar.barTintColor = UIColor(named: "whiteColor")
        self.navigationController?.navigationBar.tintColor = UIColor(named: "blackColor")
        self.navigationController?.navigationBar.isTranslucent = false
    }
}

