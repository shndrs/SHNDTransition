//
//  SHNDTransitionController.swift
//  SHNDTransition
//
//  Created by Sahand Raeisi on 1/15/19.
//

import Foundation
import UIKit

public enum PresentTransitionMode {
    case rightToLeft
    case leftToRight
    case zoomIn
    case downToUp
    case upToDown
}

public enum DismissTransitionMode {
    case rightToLeft
    case leftToRight
    case zoomOut
    case downToUp
    case upToDown
}

public enum TransitionMode {
    case present
    case dismiss
}

public class SHNDTransitionController: NSObject {
    
    private let animationDuration: Double
    private let presentTransitionMode: PresentTransitionMode
    private let dismissTransitionMode: DismissTransitionMode
    public var currentTransitionMode:TransitionMode = .present
    
    init(animationDuration: Double, presentTransitionMode: PresentTransitionMode, dismissTransitionMode: DismissTransitionMode) {
        self.animationDuration = animationDuration
        self.presentTransitionMode = presentTransitionMode
        self.dismissTransitionMode = dismissTransitionMode
    }
}

extension SHNDTransitionController: UIViewControllerAnimatedTransitioning {
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return TimeInterval(exactly: animationDuration) ?? 0
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let toVC = transitionContext.viewController(forKey: .to),
            let fromVC = transitionContext.viewController(forKey: .from) else {
                transitionContext.completeTransition(false)
                return
        }
        
        switch currentTransitionMode {
            
        case .present:
            currentTransitionMode = .dismiss
            transitionContext.containerView.addSubview(toVC.view)
            customPresentAnimation(with: transitionContext, viewToAnimate: toVC.view, presentTransitionMode: presentTransitionMode)
        case .dismiss:
            currentTransitionMode = .present
            transitionContext.containerView.addSubview(toVC.view)
            transitionContext.containerView.addSubview(fromVC.view)
            customDismissAnimation(with: transitionContext, viewToAnimate: fromVC.view, dismissTransitionMode: dismissTransitionMode)
        }
        
    }
    
    func customPresentAnimation(with transitionContext:UIViewControllerContextTransitioning, viewToAnimate:UIView, presentTransitionMode: PresentTransitionMode) {
        
        viewToAnimate.clipsToBounds = true
        
        let builderObject = PresentTransformBuilder { (builder) in
            builder.parentView = viewToAnimate
            builder.transitionMode = presentTransitionMode
        }
        let transform = PresentTransformGenerator(builder: builderObject).generate()
        
        viewToAnimate.transform = transform
        
        let duration = transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration, delay: 0.0,
                       usingSpringWithDamping: 0.80,
                       initialSpringVelocity: 0.1, options: .curveEaseInOut,
                       animations: {
                        viewToAnimate.transform = .identity
                        
        }) { (success) in
            transitionContext.completeTransition(success)
        }
    }
    
    func customDismissAnimation(with transitionContext:UIViewControllerContextTransitioning, viewToAnimate:UIView, dismissTransitionMode: DismissTransitionMode) {
        
        let duration = transitionDuration(using: transitionContext)
        let builderObject = DismissTransformBuilder { (builder) in
            builder.parentView = viewToAnimate
            builder.transitionMode = dismissTransitionMode
        }
        let transform = DismissTransformGenerator(builder: builderObject).generate()
        
        UIView.animate(withDuration: duration, delay: 0.0, options: .transitionCurlUp, animations: {
            viewToAnimate.transform = transform
        }) { (success) in
            transitionContext.completeTransition(success)
        }
    }
}

extension SHNDTransitionController: UIViewControllerTransitioningDelegate {
    
    private func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    private func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
}

