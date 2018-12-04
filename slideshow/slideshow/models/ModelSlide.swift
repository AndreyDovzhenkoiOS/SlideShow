//
//  ModelSlide.swift
//  SlideShow
//
//  Created by Andrey on 17.07.2018.
//  Copyright © 2018 Andrey Dovzhenko. All rights reserved.
//

import UIKit

final class ModelSlide: NSObject {
    
    //MARK: - Property
    
    var id: Int!
    var url: URL!
    var select: Bool!
    var modelAnimate: ModelAnimate!
    
    //MARK: - Initialization
    
    init(_ id: Int, _ url: URL, _ select: Bool, _ modelAnimate: ModelAnimate) {
        self.id = id
        self.url = url
        self.select = select
        self.modelAnimate = modelAnimate
    }
}

