//
//  SettingsSlideViewController.swift
//  SlideShow
//
//  Created by Andrey on 27.07.2018.
//  Copyright © 2018 Andrey Dovzhenko. All rights reserved.
//

import UIKit

final class SettingsSlideViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var exitButton: UIButton!
    
    //MARK: - Property
    
    let viewModel = SettingsSlideViewModel()
    
    //MARK: - Initialization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultSetting()
    }
    
    override func viewDidLayoutSubviews() {
        exitButton.layer.cornerRadius = exitButton.frame.height / 2
    }
    
    //MARK: - Functions
    
    private func defaultSetting() {
        viewModelCompletionHandle()
        collectionView.registerCell(SettingsSlideCollectionViewCell.identifier)
        showImage()
    }
    
    private func viewModelCompletionHandle() {
        viewModel.completionHandler = {
            self.imageView.animayteTransition($0.animate)
        }
    }
    
    private func showImage() {
        viewModel.networkManager.getImage(viewModel.modelSlideManager.settingModelSlide.url) {
            self.imageView.image = $0
        }
    }
    
    //MARK: - Actions
    
    @IBAction func exitAction(_ sender: UIButton) {
        sender.animateJump {
            self.transitionAnimate(nil, .dismiss, true)
        }
    }
}

//MARK: - CollectionView

extension SettingsSlideViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    //MARK: - CollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.modelAnimates.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SettingsSlideCollectionViewCell.identifier,
                                                      for: indexPath) as? SettingsSlideCollectionViewCell
        cell?.modelAnimate = viewModel.modelAnimates[indexPath.row]
        return cell!
    }
    
    //MARK: - CollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.cellForItem(at: indexPath)?.animateSelect {
           self.viewModel.setupAnimate(indexPath.row)
        }
    }
    
    //MARK: - CollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 5,
                      height: collectionView.frame.height / 2.63)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(15, 0, 0, 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 13
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
}
