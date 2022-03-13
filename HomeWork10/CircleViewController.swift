//
//  CircleViewController.swift
//  HomeWork10
//
//  Created by Екатерина Лаптева on 12.03.22.
//

import UIKit

class CircleViewController: UIViewController {
    
    private let sizeConst: CGFloat = 60
    
    var circlelabel: UILabel!
    var isMoving = false
    
    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initLabel()
    }
    
    //MARK: - Methods
    
    func initLabel() {
        circlelabel = UILabel()
        circlelabel.frame.size = CGSize(width: sizeConst, height: sizeConst)
        circlelabel.layer.cornerRadius = sizeConst / 2
        circlelabel.backgroundColor = .white
        circlelabel.layer.masksToBounds = true
        circlelabel.center.x = view.center.x - 100
        circlelabel.center.y = view.center.y - 50
        self.view.addSubview(circlelabel)
    }
    
    //MARK: - IBActions
    
    @IBAction func startCircleToMove(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.5,
                       animations: {
            self.circlelabel.center.x += 200.0
        },
                       completion: { _ in
            UIView.animate(withDuration: 0.5,
                           animations: {
                self.circlelabel.center.y += 100.0
            },
                           completion: { _ in
                UIView.animate(withDuration: 0.5,
                               animations: {
                    self.circlelabel.center.x -= 200.0
                },
                               completion: { _ in
                    UIView.animate(withDuration: 0.5,
                                   animations: {
                        self.circlelabel.center.y -= 100.0
                    }, completion: { _ in
                        self.startCircleToMove(sender)
                    }
                    )
                }
                )
            }
            )
        }
        )
    }
}
