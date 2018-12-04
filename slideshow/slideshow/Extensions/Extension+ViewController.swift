//
//  ExtensionViewController.swift
//  SlideShow
//
//  Created by Andrey on 17.07.2018.
//  Copyright © 2018 Andrey Dovzhenko. All rights reserved.
//

import UIKit

extension UIViewController {
    static var storyboardName: String {
        let storyboardName = identifier as NSString
        let range = storyboardName.range(of: Constants.viewConrtoller)
        return storyboardName.substring(to: range.location)
    }
    
    func transitionToViewController(_ storyboardName: String, identifier: String, _ transition: Transitions) {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: identifier)
        transitionAnimate(viewController, transition, true)
    }
    
    func transitionAnimate(_ viewController: UIViewController!, _ transition: Transitions, _ animate: Bool) {
        switch transition {
        case .show:
            show(viewController, sender: nil)
        case .dismiss:
            dismiss(animated: animate, completion: nil)
        case .present:
            present(viewController, animated: animate, completion: nil)
        case .popRoot:
            navigationController?.popToRootViewController(animated: animate)
        case .pop:
            navigationController?.popViewController(animated: animate)
        case .push:
            navigationController?.pushViewController(viewController, animated: animate)
        }
    }
}
