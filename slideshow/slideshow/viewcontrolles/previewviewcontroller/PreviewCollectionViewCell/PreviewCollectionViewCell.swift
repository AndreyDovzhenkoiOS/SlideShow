//
//  PreviewCollectionViewCell.swift
//  SlideShow
//
//  Created by Andrey on 26.07.2018.
//  Copyright © 2018 Andrey Dovzhenko. All rights reserved.
//

import UIKit

final class PreviewCollectionViewCell: UICollectionViewCell {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    //MARK: - Property
    
    var selectModelSlide: ModelSlide! {didSet {updateUI()}}
    private let networkManager = NetworkManager.shared
    
    override func awakeFromNib() {
        imageView.layer.cornerRadius = imageView.frame.height / 18
    }
    
    //MARK: - Functions
    
    private func updateUI() {
        networkManager.getImage(selectModelSlide.url) {
            self.imageView.image = $0
            self.activityIndicatorView.stopAnimating()
        }
    }
}
