//
//  SettingsSlideCollectionViewCell.swift
//  SlideShow
//
//  Created by Andrey on 03.08.2018.
//  Copyright © 2018 Andrey Dovzhenko. All rights reserved.
//

import UIKit

class SettingsSlideCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    //MARK: - Property
    
    var modelAnimate: ModelAnimate! {
        didSet {updateUI()}
    }
    
    //MARK: - Initialiazation
    
    override func draw(_ rect: CGRect) {
        layer.cornerRadius = frame.height / 2
    }
    
    //MARK: - Functions
    
    private func updateUI() {
        nameLabel.text = modelAnimate.name
    }
    
}
