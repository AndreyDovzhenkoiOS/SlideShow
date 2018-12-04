//
//  Extension+NotificationCenter.swift
//  SlideShow
//
//  Created by Andrey on 18.07.2018.
//  Copyright © 2018 Andrey Dovzhenko. All rights reserved.
//

import Foundation

extension NotificationCenter {
    static func post(_ name: Notification.Name, _ object: Any) {
        NotificationCenter.default.post(name: name, object: object)
    }
    
    static func addObserver(_ observer: Any, _ selector: Selector, _ name: Notification.Name) {
        NotificationCenter.default.addObserver(observer, selector: selector,
                                               name: name,
                                               object: nil)
    }
}
