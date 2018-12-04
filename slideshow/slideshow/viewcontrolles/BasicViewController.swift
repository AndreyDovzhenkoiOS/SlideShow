//
//  BasicViewController.swift
//  SlideShow
//
//  Created by Andrey on 17.07.2018.
//  Copyright © 2018 Andrey Dovzhenko. All rights reserved.
//

import UIKit

class BasicViewController: UIViewController {
    
    //MARK: - Initialization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultSetting()
    }
    
    //MARK: - Functions
    
    private func defaultSetting() {
        navigationController?.isNavigationBarHidden = true
    }
    
}
