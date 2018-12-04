//
//  ModelAnimate.swift
//  SlideShow
//
//  Created by Andrey on 03.08.2018.
//  Copyright © 2018 Andrey Dovzhenko. All rights reserved.
//

import UIKit

final class ModelAnimate: NSObject {

    //MARK: - Property
    
    var name: String!
    var animate: UIViewAnimationOptions!
    
    //MARK: - Initialization
    
    init(_ name: String, _ animate: UIViewAnimationOptions) {
        self.name = name
        self.animate = animate
    }
}
