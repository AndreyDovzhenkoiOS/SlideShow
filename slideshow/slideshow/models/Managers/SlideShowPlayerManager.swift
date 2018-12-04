//
//  SlideShowPlayerManager.swift
//  SlideShow
//
//  Created by Andrey on 19.07.2018.
//  Copyright © 2018 Andrey Dovzhenko. All rights reserved.
//

import UIKit

final class SlideShowPlayerManager: NSObject {
    
    //MARK: - Property
    
    var count = 0
    var isPlay = true
    
    var completionHandlerNext = {(_ : Int) -> () in}
    var completionHandlerEnd = {() -> () in}
    
    private var endNumber: Int!
    private var timerSlideShow: Timer?
    
    //MARK: - Initialization
    
    private override init() {}
    
    init(_ endNumber: Int) {
        self.endNumber = (endNumber - 1)
    }
    
    //MARK: - Functions
    
    public func checkPlay() {
        isPlay ? playSlideShow() : timerSlideShow?.invalidate()
    }
    
    public func rewindSlideShow(_ isRewind: Bool, completion: @escaping(_ : Int) -> ()) {
        func backRewind() {if count != 0 {count -= 1}}
        func forwardRewind() {if count != endNumber {count += 1}}
        isRewind ? backRewind() : forwardRewind()
        completion(count)
    }
    
    private func playSlideShow() {
        timerSlideShow?.invalidate()
        timerSlideShow = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
            self.checkEndSlideShow()
        }
    }
    
    private func checkEndSlideShow() {
        let equality = count == endNumber
        equality ? endSlideShow() : next()
    }
    
    private func next() {
        count += 1
        completionHandlerNext(count)
    }
    
    private func endSlideShow()  {
        timerSlideShow?.invalidate()
        completionHandlerEnd()
    }
}
