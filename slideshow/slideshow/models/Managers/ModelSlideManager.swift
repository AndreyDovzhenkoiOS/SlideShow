//
//  ModelSlideManager.swift
//  SlideShow
//
//  Created by Andrey on 17.07.2018.
//  Copyright © 2018 Andrey Dovzhenko. All rights reserved.
//

import UIKit

final class ModelSlideManager: NSObject {
    
    //MARK: - Property
    
    var modelAnimateManager = ModelAnimateManager.shared
    var selectedModelSlides: [ModelSlide] = []
    var modelSlides: [ModelSlide] = []
    var settingModelSlide: ModelSlide!
    
    //MARK: - Iniatilization
    
    static let shared = ModelSlideManager()
    
    private override init() {
        super.init()
        fillModelSlides()
    }
    
    //MARK: - Functions
    
    public func resetModelSlides() {
        modelSlides.forEach {$0.select = false}
        selectedModelSlides.removeAll()
    }
    
    public func removeSelectedSlide(_ modelSlide: ModelSlide) {
        let indexOfObject = selectedModelSlides.index(where: {$0 == modelSlide})
        selectedModelSlides.remove(at: indexOfObject!)
    }
    
    public func addNewModelSlide(_ urlString: String)  {
        if urlString.contains(Constants.isUrl),
            urlString.contains(Constants.isCom){
            let modelSlide = getModelSlide(modelSlides.count, urlString)
            modelSlides.append(modelSlide)
            sortModelSlides()
        }
    }
    
    private func fillModelSlides() {
        for (id, urlString) in Constants.urls.enumerated() {
            let modelSlide = getModelSlide(id, urlString)
            modelSlides.append(modelSlide)
        }
    }

    private func getModelSlide(_ id: Int, _ urlString: String) -> ModelSlide {
        let url = URL(string: urlString)
        let modelAnimate = modelAnimateManager.getRandomModelAnimate()
        let modelSlide = ModelSlide(modelSlides.count, url!, false, modelAnimate)
        return modelSlide
    }
    
    private func sortModelSlides() {
        for index in 0..<modelSlides.count {
            modelSlides.swapAt(index, modelSlides.count - 1)
        }
    }
}
