//
//  MainViewModel.swift
//  SlideShow
//
//  Created by Andrey on 17.07.2018.
//  Copyright © 2018 Andrey Dovzhenko. All rights reserved.
//

import UIKit

final class MainViewModel: NSObject {
    
    //MARK: - Property
    
    let modelSlideManager = ModelSlideManager.shared
    var completionHandler = {(_: Bool) -> () in}
    
    //MARK: - Functions
    
    public func selectModelSlide(_ index: Int) {
        let selectModelSlide = modelSlideManager.modelSlides[index]
        
        selectModelSlide.select = !selectModelSlide.select
        selectModelSlide.select ? modelSlideManager.selectedModelSlides.append(selectModelSlide) : modelSlideManager.removeSelectedSlide(selectModelSlide)
        
        NotificationCenter.post(Notifications.notificationNameUpdate, selectModelSlide)
        
        AudioPlayerManager.shared.setSound(Constants.Sounds.SoundNames.select,
                                           Constants.Sounds.Types.mp3, false)
        
        completionHandler(!modelSlideManager.selectedModelSlides.isEmpty)
    }
    
    public func getModelSlide(_ index: Int) -> ModelSlide {
        return modelSlideManager.modelSlides[index]
    }
}
