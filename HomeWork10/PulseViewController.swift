//
//  PulseViewController.swift
//  HomeWork10
//
//  Created by Екатерина Лаптева on 12.03.22.
//

import UIKit

class PulseViewController: UIViewController {

    var animationCounter = 0
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var heartImageView: UIImageView!
    
    @IBOutlet weak var imageHeight: NSLayoutConstraint!
    

    
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //MARK: - Methods
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
      {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
      }
    
    @objc private func timer() {
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(heartBeat), userInfo: nil, repeats: true)
    }
    
    
    @objc private func heartBeat() {
        UIView.animate(withDuration: 1, delay: 0, options: [.curveEaseInOut, .allowUserInteraction], animations: {
            self.imageHeight.constant += 40
            self.view.layoutIfNeeded()
        }, completion:  {_ in
            self.imageHeight.constant -= 40
            self.view.layoutIfNeeded()
            self.animationCounter += 1
            if (self.animationCounter < 15) {
                self.heartBeat()
            } else { self.animationCounter = 0
            }
        })
    }
    
    
    //MARK: - IBActions
    
    @IBAction func startHeartBeatButton(_ sender: UIButton) {
        heartBeat()
    }
}
