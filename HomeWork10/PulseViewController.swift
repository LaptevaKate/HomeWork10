//
//  PulseViewController.swift
//  HomeWork10
//
//  Created by Екатерина Лаптева on 12.03.22.
//

import UIKit

final class PulseViewController: UIViewController {
    
    private var animationCounter = 0
    
    @IBOutlet private weak var textField: UITextField!
    
    @IBOutlet private weak var heartImageView: UIImageView!
    
    @IBOutlet private weak var imageHeight: NSLayoutConstraint!
    @IBOutlet weak var imageWidth: NSLayoutConstraint!
    
    
    
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.keyboardType = .numberPad
        textField.returnKeyType = .done
        textField.placeholder = "Enter heart beats per minute"
        addDoneButtonOnKeyboard()
        textField.delegate = self
    }
    //MARK: - Methods
    
    private func addDoneButtonOnKeyboard(){
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "START", style: .done, target: self, action: #selector(self.doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        textField.inputAccessoryView = doneToolbar
    }
    
    @objc private func doneButtonAction(){
        textField.resignFirstResponder()
    }
    
    private func heartBeat(duration: Double) {
        UIView.animate(withDuration: 60 / duration, delay: 0, options: [.curveEaseInOut], animations: {
            self.imageHeight.constant += 40
            self.imageWidth.constant += 40
            self.view.layoutIfNeeded()
        }, completion:  {_ in
            self.imageHeight.constant -= 40
            self.imageWidth.constant -= 40
            self.view.layoutIfNeeded()
            self.animationCounter += 1
            if (self.animationCounter < 15) {
                self.heartBeat(duration: duration)
            } else {
                self.animationCounter = 0
                self.textField.isUserInteractionEnabled = true
                self.textField.text = ""
            }
        })
    }
}

//MARK: - UITextFieldDelegate
extension PulseViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,replacementString string: String) -> Bool {
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text, !text.isEmpty, text != "0"  {
            guard let textToDouble = Double(text) else { return }
            heartBeat(duration: textToDouble)
            textField.isUserInteractionEnabled = false
        }
    }
}
