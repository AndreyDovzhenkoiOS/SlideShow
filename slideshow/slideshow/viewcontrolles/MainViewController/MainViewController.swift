//
//  MainViewController.swift
//  SlideShow
//
//  Created by Andrey on 17.07.2018.
//  Copyright © 2018 Andrey Dovzhenko. All rights reserved.
//

import UIKit

final class MainViewController: BasicViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var numberSelectedLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    //MARK: - Property
    
    let viewModel = MainViewModel()
    var textField: UITextField!
    var addHandler:UIAlertAction?
    
    //MARK: - Initialization
    
    override func viewWillAppear(_ animated: Bool) {
        defaultSetting()
    }
    
    //MARK: - Actions
    
    @IBAction func nextAction(_ sender: UIButton) {
        transitionToViewController(PreviewViewController.storyboardName,
                                   identifier: PreviewViewController.identifier,
                                   .push)
    }
    
    @IBAction func addAction(_ sender: UIButton) {
        setupAlertController()
    }
    
    //MARK: - Functions
    
    private func defaultSetting(){
        settingViewModel()
        settingCollectionView()
    }
    
    private func settingTextField() {
        textField.delegate = self
        textField.placeholder = Constants.Alerts.addUrl
    }
    
    private func settingViewModel() {
        viewModelCompletionHandler()
        viewModel.completionHandler(false)
        viewModel.modelSlideManager.resetModelSlides()
    }
    
    private func settingCollectionView() {
        collectionView.registerCell(MainCollectionViewCell.identifier)
        collectionView.reloadData()
    }
    
    private func viewModelCompletionHandler() {
        viewModel.completionHandler = {
            self.nextButton.isEnabled = $0
            self.updateNumberSlected()
        }
    }
    
    private func updateNumberSlected() {
        let numberSelected = viewModel.modelSlideManager.selectedModelSlides.count
        numberSelectedLabel.text = Constants.numberSelected + String(numberSelected)
    }
    
    private func setupAlertController() {
        let alertController = UIAlertController(title: Constants.Alerts.message,
                                                message: Constants.Alerts.addUrl,
                                                preferredStyle: .alert)
        alertController.addTextField {self.textField = $0}
        alertController.addAction(UIAlertAction(title: Constants.Alerts.cancel, style: .default, handler: nil))
        addHandler = UIAlertAction(title: Constants.Alerts.add, style: .destructive, handler: { _ in
            self.viewModel.modelSlideManager.addNewModelSlide(self.textField.text!)
            self.collectionView.reloadData()
        })
        settingTextField()
        addHandler?.isEnabled = false
        alertController.addAction(addHandler!)
        transitionAnimate(alertController, .present, true)
    }
}

//MARK: - CollectionView

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout {
    
    //MARK: - CollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.modelSlideManager.modelSlides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.identifier, for: indexPath) as? MainCollectionViewCell
        cell?.modelSlide = viewModel.getModelSlide(indexPath.item)
        return cell!
    }
    
    //MARK: - CollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.selectModelSlide(indexPath.item)
    }
    
    //MARK: - CollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width,
                      height: collectionView.frame.height / 3.13)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return view.frame.origin.y
    }
}

extension MainViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let add = string.count > 0
        let delete = string == "" && textField.text?.count == 1
        
        if add {addHandler?.isEnabled = true}
        if delete {addHandler?.isEnabled = false}
        return true
    }
}
