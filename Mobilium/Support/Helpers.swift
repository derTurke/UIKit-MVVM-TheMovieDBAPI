//
//  Helpers.swift
//  Mobilium
//
//  Created by GÜRHAN YUVARLAK on 18.09.2022.
//

import Foundation
import UIKit

class Helpers {
    static let shared = Helpers()
    
    public func presentViewController(_ view: UIViewController, detailView: UIViewController) {
        detailView.modalPresentationStyle = .fullScreen
        detailView.modalTransitionStyle = .flipHorizontal
        view.present(detailView, animated: true)
    }
    
    public func dateFormat(_ date: String?, format: String) -> String{
        guard let date = date else {
            return ""
        }
        let fmt = DateFormatter()
        fmt.locale = Locale(identifier: "en_US_POSIX")
        fmt.dateFormat = "yyyy-MM-dd"
        let dt = fmt.date(from: date)!
        fmt.dateFormat = format
        return fmt.string(from: dt)
    }
}
