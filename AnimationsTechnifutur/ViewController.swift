//
//  ViewController.swift
//  AnimationsTechnifutur
//
//  Created by Roman Muzikantov on 07/11/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mView: UIView!
    @IBOutlet weak var mButton: UIButton!
    @IBOutlet weak var mWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var mHeightConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.mWidthConstraint.constant = 200
        self.mHeightConstraint.constant = 200
        self.mView.layer.cornerRadius = 100
        self.mView.layer.shadowColor = UIColor.blue.cgColor
        self.mView.layer.shadowOpacity = 1.0
        self.mView.layer.shadowRadius = 30.0
        
        // Ajout d'un gradient au background
        let startColor = UIColor.red.cgColor
        let endColor = UIColor.green.cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [startColor, endColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        // Ajout d'une animation (CoreAnimation) sur le gradient pour changer sa couleur
        let animation = CABasicAnimation(keyPath: "colors")
        animation.fromValue = [startColor, endColor]
        animation.toValue = [endColor, startColor]
        animation.duration = 2
        animation.autoreverses = true
        animation.repeatCount = .infinity
        gradientLayer.add(animation, forKey: nil)
        
        // Ajout d'une animation (CoreAnimation) sur le radius de l'ombre de la vue
        let shadowRadiusAnimation = CABasicAnimation(keyPath: "shadowRadius")
        shadowRadiusAnimation.fromValue = 30.0
        shadowRadiusAnimation.toValue = 100.0
        shadowRadiusAnimation.duration = 2
        shadowRadiusAnimation.autoreverses = true
        shadowRadiusAnimation.repeatCount = .infinity
        mView.layer.add(shadowRadiusAnimation, forKey: nil)
        
        // Ajout d'une animation (CoreAnimation) sur la position de la vue
        let positionAnimation = CABasicAnimation(keyPath: "position")
        positionAnimation.fromValue = CGPoint(x: -50, y: -50)
        positionAnimation.toValue = CGPoint(x: mView.layer.position.x, y: mView.layer.position.y)
        positionAnimation.duration = 2
        mView.layer.add(positionAnimation, forKey: nil)
        mView.layer.position = CGPoint(x: mView.layer.position.x, y: mView.layer.position.y)
    }
    
    @IBAction func didTapButton() {
        // Animation UIView.animate() sur la position et la couleur de la vue avec un effet spring et un retour en arrière à la complétion
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.3) {
            self.mView.transform = CGAffineTransform(translationX: 0, y: 200)
            self.mView.layoutIfNeeded()
            self.mView.backgroundColor = .green
        } completion: { isFinished in
            if (isFinished) {
                UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.3) {
                    self.mView.transform = CGAffineTransform(translationX: 0, y: 0)
                    self.mView.layoutIfNeeded()
                    self.mView.backgroundColor = .red
                }
            }
        }
    }


}

