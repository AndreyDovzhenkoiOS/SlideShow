//
//  PreviewViewModel.swift
//  SlideShow
//
//  Created by Andrey on 26.07.2018.
//  Copyright © 2018 Andrey Dovzhenko. All rights reserved.
//

import UIKit

final class PreviewViewModel: NSObject {
    
    //MARK: - Property
    
    let modelSlideManager = ModelSlideManager.shared
    var completionHandler = {(_ : Int!, _ : Bool) -> () in}
    private var selectModelSlide: ModelSlide!
    
    
    //MARK: - Functions
    
    public func selectSlide(_ index: Int) {
        selectModelSlide = modelSlideManager.selectedModelSlides[index]
        modelSlideManager.settingModelSlide = selectModelSlide
        AudioPlayerManager.shared.setSound(Constants.Sounds.SoundNames.select,
                                           Constants.Sounds.Types.mp3,
                                           false)
    }
    
    public func removeSlide() {
        removeCell()
        checkEndSlide {self.completionHandler(nil, true)}
    }
    
    private func removeCell() {
        let indexOfObject = modelSlideManager.selectedModelSlides.index(where: {$0 == selectModelSlide})
        modelSlideManager.removeSelectedSlide(selectModelSlide)
        completionHandler(indexOfObject!, false)
    }
    
    private func checkEndSlide(completion: @escaping() -> ()) {
        let isEmpty = modelSlideManager.selectedModelSlides.isEmpty
        if isEmpty {completion()}
    }
}
