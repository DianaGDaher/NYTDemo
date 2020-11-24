//
//  Constants.swift
//  NYT
//
//  Created by Diana on 11/24/20.
//

import UIKit

let appDelegate: AppDelegate? = {
    guard let _appDelegate = UIApplication.shared.delegate as? AppDelegate else {
        return nil
    }
    return _appDelegate
}()

//Shared
let coreapp = AppConfig.shared
let coreapi = APIConfig.shared
let Services = APIManager.shared

public func translate(_ key:String) -> String {
    return NSLocalizedString(key, comment: "")
}

//Enums

//Period
enum Period: String {
    case seven = "7.json"
    case one = "1.json"
    case thirty = "30.json"
}
//Media format
enum MediaFormat: String {
    case standard_Thumbnail = "Standard Thumbnail"
    case medium210 = "mediumThreeByTwo210"
    case medium440 = "mediumThreeByTwo440"
}
