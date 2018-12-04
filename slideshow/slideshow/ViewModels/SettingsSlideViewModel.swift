//
//  SettingsSlideViewModel.swift
//  SlideShow
//
//  Created by Andrey on 27.07.2018.
//  Copyright © 2018 Andrey Dovzhenko. All rights reserved.
//

import UIKit

final class SettingsSlideViewModel: NSObject {
    
    //MARK: - Property
    
    let modelSlideManager = ModelSlideManager.shared
    let networkManager = NetworkManager.shared
    var modelAnimates: [ModelAnimate] = []
    var completionHandler = {(_ : ModelAnimate) -> () in}
    private let modelAnimateManager = ModelAnimateManager.shared
    
    //MARK: - Initialization
    
    override init() {
        modelAnimates = modelAnimateManager.modelAnimates
    }
    
    public func setupAnimate(_ index: Int) {
        let modelAnimate = modelAnimateManager.modelAnimates[index]
        modelSlideManager.settingModelSlide.modelAnimate.animate = modelAnimate.animate
        completionHandler(modelAnimate)
    }
}
