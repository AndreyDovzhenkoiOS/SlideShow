//
//  Extension+NSObject.swift
//  SlideShow
//
//  Created by Andrey on 17.07.2018.
//  Copyright © 2018 Andrey Dovzhenko. All rights reserved.
//

import Foundation

extension NSObject {
    static var identifier: String {
        return String(describing: self)
    }
    
   public func getRandomCount(_ count: Int) -> Int {
        return Int(arc4random_uniform(UInt32(count)))
    }
}
