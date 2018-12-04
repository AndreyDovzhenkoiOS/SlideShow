//
//  SlideShowViewController.swift
//  SlideShow
//
//  Created by Andrey on 17.07.2018.
//  Copyright © 2018 Andrey Dovzhenko. All rights reserved.
//

import UIKit

final class SlideShowViewController: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var numberSlideLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var showButtons: [UIButton]!
    @IBOutlet weak var switchButton: UIButton!
    
    //MARK: - Property
    
    let viewModel = SlideShowViewModel()
    
    //MARK: - Initialization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultSetting()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        settingExitButton()
    }
    
    //MARK: - Actions
    
    @IBAction func switchAction(_ sender: UIButton) {
        viewModel.switchSlideShow()
        switchButton.animateJump{}
    }
    
    @IBAction func rewindAction(_ sender: UIButton) {
        viewModel.rewindSlideShow(sender.tag)
        sender.animateJump{}
    }
    
    @IBAction func exitAction(_ sender: UIButton) {
        sender.animateJump{
            self.viewModel.completionHandlerEnd()
            self.transitionAnimate(nil, .popRoot, true)
        }
        
    }
    
    //MARK: - Functions
    
    private func defaultSetting() {
        settingViewModel()
    }
    
    private func settingExitButton() {
        let exitButton = showButtons[2]
        exitButton.layer.cornerRadius = exitButton.frame.height / 2
    }
    
    private func settingViewModel() {
        viewModelCompletionHandler()
        viewModel.playSlideShow()
    }
    
    private func viewModelCompletionHandler() {
        viewModel.completionHandler = {
            self.updateUIButtons($0)
        }
        
        viewModel.completionHandlerNext = {
            self.updateNumberSlide($1)
            self.imageView.animateTransitionRandom()
            self.viewModel.networkManager.getImage($0.url, completion: {
                self.imageView.image = $0
            })
        }
        
        viewModel.completionHandlerEnd = {
            self.transitionAnimate(nil, .popRoot, true)
        }
    }
    
    private func updateUIButtons(_ check: Bool) {
        setImageForSwitchButton(check)
        showRewindButtons(check)
    }
    
    private func setImageForSwitchButton(_ checkSwitch: Bool) {
        let image = checkSwitch ? #imageLiteral(resourceName: "pauseImage") : #imageLiteral(resourceName: "playImage")
        switchButton.setImage(image, for: .normal)
    }
    
    private func showRewindButtons(_ isShow: Bool) {
        showButtons.forEach {
            $0.animateJump{}
            $0.animateExtinction(!isShow)
        }
    }
    
    private func updateNumberSlide(_ number: Int) {
        numberSlideLabel.text = Constants.numberSlide + String(number + 1)
        numberSlideLabel.animateJump{}
    }
}
