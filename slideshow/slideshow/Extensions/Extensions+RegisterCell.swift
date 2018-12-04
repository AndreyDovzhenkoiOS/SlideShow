//
//  Extensions+RegisterCell.swift
//  SlideShow
//
//  Created by Andrey on 17.07.2018.
//  Copyright © 2018 Andrey Dovzhenko. All rights reserved.
//

import UIKit

extension UITableView {
   public func registerCell(_ identifier: String) {
        register(UINib(nibName: identifier, bundle: nil),
                 forCellReuseIdentifier: identifier)
    }
}

extension UICollectionView {
   public func registerCell(_ identifier: String) {
        register(UINib(nibName: identifier, bundle: nil),
                 forCellWithReuseIdentifier: identifier)
    }
}
