//
//  CircleViewController.swift
//  HomeWork10
//
//  Created by Екатерина Лаптева on 12.03.22.
//

import UIKit

class CircleViewController: UIViewController {
    
    private let sizeConst: CGFloat = 60
    
    @IBOutlet weak var startButton: UIButton!
    
    var circleLabel: UILabel!
    var isMoving = false
    let attrStart = NSAttributedString(string: "START", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 34)])
    let attrStop = NSAttributedString(string: "STOP", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 34)])
    
    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initLabel()
        startButton.setAttributedTitle(attrStart, for: .normal)
    }
    
    //MARK: - Methods
    
    func initLabel() {
        circleLabel = UILabel()
        circleLabel.frame.size = CGSize(width: sizeConst, height: sizeConst)
        circleLabel.layer.cornerRadius = sizeConst / 2
        circleLabel.backgroundColor = .white
        circleLabel.layer.masksToBounds = true
        circleLabel.center.x = view.center.x - 100
        circleLabel.center.y = view.center.y - 50
        self.view.addSubview(circleLabel)
    }
    
    func animateCircle() {
        UIView.animate(withDuration: 0.5,
                       animations: {
            self.circleLabel.center.x += 200.0
        },
                       completion: { [weak self] _ in
            UIView.animate(withDuration: 0.5,
                           animations: {
                self?.circleLabel.center.y += 100.0
            },
                           completion: { _ in
                UIView.animate(withDuration: 0.5,
                               animations: {
                    self?.circleLabel.center.x -= 200.0
                },
                               completion: { [weak self] _ in
                    UIView.animate(withDuration: 0.5,
                                   animations: {
                        self?.circleLabel.center.y -= 100.0
                    }, completion: { [weak self] _ in
                        self?.isMoving == false ? self?.initialState() : self?.animateCircle()
                    }
                    )
                }
                )
            }
            )
        }
        )
    }
    
    func initialState() {
        circleLabel.layer.removeAllAnimations()
        circleLabel.center.x = view.center.x - 100
        circleLabel.center.y = view.center.y - 50
    }
    
    //MARK: - IBActions
    
    @IBAction func startCircleToMove(_ sender: UIButton) {
        isMoving.toggle()
        if isMoving {
            startButton.setAttributedTitle(attrStop, for: .normal)
            animateCircle()
        } else {
            startButton.setAttributedTitle(attrStart, for: .normal)
        }
    }
}
