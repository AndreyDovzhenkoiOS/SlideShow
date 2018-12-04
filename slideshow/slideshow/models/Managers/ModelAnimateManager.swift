//
//  ModelAnimateManager.swift
//  SlideShow
//
//  Created by Andrey on 03.08.2018.
//  Copyright © 2018 Andrey Dovzhenko. All rights reserved.
//

import UIKit

final class ModelAnimateManager: NSObject {
    
    //MARK: - Property
    
    var modelAnimates: [ModelAnimate] = []
    
    //MARK: - Initialization
    
    static let shared = ModelAnimateManager()
    
    private override init() {
        super.init()
        fillModelAnimates()
    }
    
    //MARK: - Functions
    
    public func fillModelAnimates() {
        let transitions: [UIViewAnimationOptions] = [.transitionFlipFromRight,
                                                     .transitionFlipFromLeft,
                                                     .transitionFlipFromBottom,
                                                     .transitionFlipFromTop,
                                                     .transitionCurlUp,
                                                     .transitionCurlDown ,
                                                     .transitionCrossDissolve,
                                                     .showHideTransitionViews]
        
        
        for (index, value) in Constants.animationNames.enumerated(){
            let transitionRandom = transitions[index]
            let modelAnimate = ModelAnimate(value, transitionRandom)
            modelAnimates.append(modelAnimate)
        }
    }
    
    public func getRandomModelAnimate() -> ModelAnimate {
        return modelAnimates[getRandomCount(modelAnimates.count)]
    }
}

