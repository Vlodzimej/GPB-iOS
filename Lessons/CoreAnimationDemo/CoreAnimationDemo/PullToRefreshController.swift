//
//  PullToRefreshController.swift
//  CoreAnimationDemo
//
//  Created by Владимир Амелькин on 16.11.2022.
//

import UIKit

class PullToRefreshController: UIViewController {
    
    var isAnimating = false
    let shapeLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(gestureAction))
        
        view.layer.addSublayer(shapeLayer)
        view.addGestureRecognizer(gestureRecognizer)
        
    }
    
    @objc func gestureAction(_ sender: UIPanGestureRecognizer) {
        let location = sender.location(in: view)
        
        switch sender.state {
        case .began:
            isAnimating = location.y < 190
            if isAnimating { view.layer.removeAllAnimations() }
        case .changed:
            guard isAnimating else { return }
            shapeLayer.path = createPath(location)
        case .failed, .ended, .cancelled:
            guard isAnimating else { return }
            startSpringAnimation(fromPoint: location)
        default:
            break
        }
    }
    
    private func createPath(_ point: CGPoint) -> CGPath {
        let bezierPath = UIBezierPath()
        
        let startPoint = CGPoint(x: 0, y: 0)
        let endPoint = CGPoint(x: view.bounds.maxX, y: view.bounds.minY)
        bezierPath.move(to: startPoint)
        bezierPath.addCurve(to: endPoint, controlPoint1: point, controlPoint2: point)
        bezierPath.close()
        
        return bezierPath.cgPath
    }
    
    func startSpringAnimation(fromPoint: CGPoint) {
        let animation = CASpringAnimation(keyPath: "path")
        animation.fromValue = createPath(fromPoint)
        animation.toValue = createPath(CGPoint(x: view.bounds.maxX / 2, y: view.bounds.minY))
        
        animation.damping = 10
        animation.initialVelocity = 20.0
        animation.mass = 2.0
        animation.stiffness = 1000.0
        
        //animation.delegate = self
        shapeLayer.add(animation, forKey: nil)
        shapeLayer.path = createPath(CGPoint(x: view.bounds.maxX / 2, y: view.bounds.minY))
    }
}
