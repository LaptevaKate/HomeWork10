//
//  ViewController.swift
//  HomeWork10
//
//  Created by Екатерина Лаптева on 12.03.22.
//

import UIKit

class MainViewController: UIViewController {

    
    @IBOutlet weak var viewButtons: UIView!
    @IBOutlet weak var pulseView: UIImageView!
    @IBOutlet weak var endlessView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewButtons.layer.cornerRadius = 50
        pulseView.layer.cornerRadius = 50
        endlessView.layer.cornerRadius = 50
    }


}

