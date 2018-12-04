//
//  Extension+View.swift
//  SlideShow
//
//  Created by Andrey on 18.07.2018.
//  Copyright © 2018 Andrey Dovzhenko. All rights reserved.
//

import UIKit

public extension UIView {
    public func animateExtinction(_ extinction: Bool) {
        UIView.animate(withDuration: 0.5) {
            self.alpha = extinction ? 1 : 0
        }
    }
    
    public func animateTransitionRandomFlip() {
        let options: [UIViewAnimationOptions] = [.transitionFlipFromBottom,
                                                 .transitionFlipFromTop,
                                                 .transitionFlipFromLeft,
                                                 .transitionFlipFromRight]
        let option = options[getRandomCount(options.count)]
        UIView.transition(with: self, duration: 0.5, options: option, animations: nil, completion: nil)
    }
    
    public func animateTransitionRandom() {
        let transitions: [UIViewAnimationOptions] = [.transitionFlipFromRight,
                                                     .transitionCurlUp,
                                                     .transitionCurlDown,
                                                     .transitionFlipFromTop,
                                                     .transitionFlipFromLeft,
                                                     .transitionCrossDissolve,
                                                     .transitionFlipFromBottom]
        
        let transitionRandom = transitions[getRandomCount(transitions.count)]
        
        UIView.transition(with: self, duration: 1,
                          options: transitionRandom,
                          animations: nil,
                          completion: nil)
    }
    
    public func animayteTransition(_ animate: UIViewAnimationOptions)  {
        UIView.transition(with: self, duration: 1,
                          options: animate,
                          animations: nil,
                          completion: nil)
    }
    
    public func animateJump(completion: @escaping() -> ()) {
        let duration = 0.5
        UIView.animate(withDuration: duration, animations: {
            self.transform = CGAffineTransform(scaleX: 1, y: 1)
        }) { _ in
            UIView.animate(withDuration: duration / 1.5, animations: {
                self.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            }) { _  in
                UIView.animate(withDuration: duration / 1.5, animations: {
                    self.transform = .identity
                }) { _ in completion()}
            }
        }
    }
    
    public func animateSelect(completion: @escaping() -> ()) {
        let duration = 0.2
        UIView.animate(withDuration: duration, animations: {
            self.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
            self.alpha = 0.3
        }) { _ in
            UIView.animate(withDuration: duration, animations: {
                self.transform = CGAffineTransform(scaleX: 1, y: 1)
                self.alpha = 1
            }) { _ in completion()}
        }
    }
}
