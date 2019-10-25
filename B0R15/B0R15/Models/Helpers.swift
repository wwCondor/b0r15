//
//  Helpers.swift
//  B0R15
//
//  Created by Wouter Willebrands on 24/10/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import UIKit

extension UIView {
    
    public func addConstraintsWithFormat(_ format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary))
    }
}
