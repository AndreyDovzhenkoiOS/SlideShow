//
//  PreviewViewController.swift
//  SlideShow
//
//  Created by Andrey on 26.07.2018.
//  Copyright © 2018 Andrey Dovzhenko. All rights reserved.
//

import UIKit

final class PreviewViewController: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - Property
    
    let viewModel = PreviewViewModel()
    
    //MARK: - Initialization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultSettings()
    }
    
    //MARK: - Actions
    
    @IBAction func slideShowAction(_ sender: UIButton) {
        transitionToViewController(SlideShowViewController.storyboardName,
                                   identifier: SlideShowViewController.identifier,
                                   .push)
    }
    
    //MARK: - Functions
    
    private func defaultSettings() {
        collectionView.registerCell(PreviewCollectionViewCell.identifier)
        viewModelCompletionHandler()
    }
    
    private func viewModelCompletionHandler() {
        viewModel.completionHandler = {
            if !$1 {
                self.removeCell($0!, $1)
            } else {
                self.transitionAnimate(nil, .popRoot, true)
            }
        }
    }
    
    private func removeCell(_ index: Int, _ end: Bool) {
            DispatchQueue.main.async {
                self.collectionView.deleteItems(at:
                    [IndexPath(item: index, section: 0)])
            }
    }
    
    private func setupAlertController() {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: Constants.Alerts.cancel, style: .cancel, handler: nil))
        alertController.addAction(UIAlertAction(title: Constants.Alerts.settings, style: .default, handler: { _ in
            self.transitionToViewController(SettingsSlideViewController.storyboardName,
                                            identifier: SettingsSlideViewController.identifier,
                                            .present)
        }))
        alertController.addAction(UIAlertAction(title: Constants.Alerts.delete, style: .destructive, handler: { _ in
            self.viewModel.removeSlide()
        }))
        
        transitionAnimate(alertController, .present, true)
    }
}

//MARK: - CollectionView

extension PreviewViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    //MARK: - CollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.modelSlideManager.selectedModelSlides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PreviewCollectionViewCell.identifier, for: indexPath) as? PreviewCollectionViewCell
        cell?.selectModelSlide = viewModel.modelSlideManager.selectedModelSlides[indexPath.item]
        return cell!
    }
    
    //MARK: - CollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.selectSlide(indexPath.item)
        collectionView.cellForItem(at: indexPath)?.animateSelect {
            self.setupAlertController()
        }
    }
    
    //MARK: - CollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2,
                      height: collectionView.frame.height / 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return view.frame.origin.y
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
