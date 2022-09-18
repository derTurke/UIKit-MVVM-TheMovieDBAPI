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
}
