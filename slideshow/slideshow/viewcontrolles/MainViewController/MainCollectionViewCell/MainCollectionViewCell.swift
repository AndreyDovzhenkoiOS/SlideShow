//
//  MainCollectionViewCell.swift
//  SlideShow
//
//  Created by Andrey on 17.07.2018.
//  Copyright © 2018 Andrey Dovzhenko. All rights reserved.
//

import UIKit

final class MainCollectionViewCell: UICollectionViewCell {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet var selectImageViews: [UIImageView]!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var blurView: UIView!
    
    //MARK: - Property
    
    var modelSlide: ModelSlide! {didSet {updateUI()}}
    private var networkmanager = NetworkManager.shared
    
    //MARK: - Iniatilization
    
    override func awakeFromNib() {
        defaultSettingUI()
        NotificationCenter.addObserver(self, #selector(updateCell(_:)),
                                       Notifications.notificationNameUpdate)
    }
    
    //MARK: - Functions
    
    @objc func updateCell(_ notification: Notification) {
        if let modelSlide = notification.object as? ModelSlide {
            if self.modelSlide == modelSlide {updateUI()}
        }
    }
    
    private func defaultSettingUI() {
        imageView.layer.cornerRadius = imageView.frame.height / 18
        blurView.layer.cornerRadius = imageView.frame.height / 18
    }
    
    private func updateUI() {
        animateTransitionRandomFlip()
        selectUpdateUI()
        networkmanager.getImage(modelSlide.url) {
            self.imageView.image = $0
            self.activityIndicatorView.stopAnimating()
        }
    }
    
    private func selectUpdateUI() {
        blurView.animateExtinction(!modelSlide.select)
        selectImageViews.forEach {
            $0.animateExtinction(self.modelSlide.select)
        }
    }
}
