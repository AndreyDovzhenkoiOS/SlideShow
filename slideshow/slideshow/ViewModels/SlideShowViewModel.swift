//
//  SlideShowViewModel.swift
//  SlideShow
//
//  Created by Andrey on 17.07.2018.
//  Copyright © 2018 Andrey Dovzhenko. All rights reserved.
//

import UIKit

final class SlideShowViewModel: NSObject {
    
    //MARK: - Property
    
    let networkManager = NetworkManager.shared
    private let modelSlideManager = ModelSlideManager.shared
    private var slideShowPlayerManager: SlideShowPlayerManager!
    
    var completionHandler = {(_ : Bool) -> () in}
    var completionHandlerNext = {(_ : ModelSlide, _ : Int) -> () in}
    var completionHandlerEnd = {() -> () in}
    
    //MARK: - Functions
    
    override init() {
        super.init()
        setupSlideShowPlayerManager()
    }
    
    public func playSlideShow()  {
        completionHandlerNext(modelSlideManager.selectedModelSlides.first!,
                              slideShowPlayerManager.count)
        slideShowPlayerManager.checkPlay()
    }
    
    public func rewindSlideShow(_ tag: Int) {
        let result = !Bool(truncating: tag as NSNumber)
        slideShowPlayerManager.rewindSlideShow(result) {
            let modelSlide = self.modelSlideManager.selectedModelSlides[$0]
            self.completionHandlerNext(modelSlide, $0)
        }
    }
    
    public func switchSlideShow() {
        slideShowPlayerManager.isPlay = !slideShowPlayerManager.isPlay
        slideShowPlayerManager.checkPlay()
        completionHandler(slideShowPlayerManager.isPlay)
    }
    
    private func setupSlideShowPlayerManager() {
        let number = modelSlideManager.selectedModelSlides.count
        slideShowPlayerManager = SlideShowPlayerManager(number)
        slideShowPlayerManagerCompletionHandler()
    }
    
    private func slideShowPlayerManagerCompletionHandler() {
        slideShowPlayerManager.completionHandlerNext = {
            let modelSlide = self.modelSlideManager.selectedModelSlides[$0]
            self.completionHandlerNext(modelSlide, $0)
        }
        
        slideShowPlayerManager.completionHandlerEnd = {
            self.completionHandlerEnd()
        }
    }
}
