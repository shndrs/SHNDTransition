//
//  AnimationTransformBuilder.swift
//  SHNDTransition
//
//  Created by Sahand Raeisi on 1/15/19.
//

import Foundation
import UIKit

// MARK: - Present Transform

public protocol PresentTransformProtocol {
    var parentView: UIView! { get }
    var transitionMode: PresentTransitionMode! { get }
}

public class PresentTransformBuilder: PresentTransformProtocol {
    
    public var parentView: UIView!
    public var transitionMode: PresentTransitionMode!
    
    public typealias BuilderClosure = (PresentTransformBuilder) -> Void
    
    init(builderClosure: BuilderClosure) {
        builderClosure(self)
    }
}

public class PresentTransformGenerator {
    
    private(set) var parentView: UIView
    private(set) var transitionMode: PresentTransitionMode
    
    public init(builder: PresentTransformBuilder) {
        self.parentView = builder.parentView
        self.transitionMode = builder.transitionMode
    }
    
    @discardableResult
    public func generate() -> CGAffineTransform {
        
        switch transitionMode {
            
        case .rightToLeft:
            return CGAffineTransform(translationX: parentView.bounds.width, y: 0)
        case .leftToRight:
            return CGAffineTransform(translationX: -parentView.bounds.width, y: 0)
        case .zoomIn:
            return CGAffineTransform(scaleX: 0.0, y: 0.0)
        case .downToUp:
            return CGAffineTransform(translationX: 0, y: -parentView.bounds.height)
        case .upToDown:
            return CGAffineTransform(translationX: 0, y: +parentView.bounds.height)
        }
    }
}

// MARK: - Dismiss Transform

public protocol DismissTransformProtocol {
    var parentView: UIView! { get }
    var transitionMode: DismissTransitionMode! { get }
}

public class DismissTransformBuilder: DismissTransformProtocol {
    
    public var parentView: UIView!
    public var transitionMode: DismissTransitionMode!
    
    public typealias BuilderClosure = (DismissTransformBuilder) -> Void
    
    init(builderClosure: BuilderClosure) {
        builderClosure(self)
    }
}

public class DismissTransformGenerator {
    
    private(set) var parentView: UIView
    private(set) var transitionMode: DismissTransitionMode
    
    public init(builder: DismissTransformBuilder) {
        self.parentView = builder.parentView
        self.transitionMode = builder.transitionMode
    }
    
    @discardableResult
    public func generate() -> CGAffineTransform {
        
        switch transitionMode {
            
        case .rightToLeft:
            return CGAffineTransform(translationX: parentView.bounds.width, y: 0)
        case .leftToRight:
            return CGAffineTransform(translationX: -parentView.bounds.width, y: 0)
        case .zoomOut:
            return CGAffineTransform(scaleX: 1.0, y: 1.0)
        case .downToUp:
            return CGAffineTransform(translationX: 0, y: -parentView.bounds.height)
        case .upToDown:
            return CGAffineTransform(translationX: 0, y: +parentView.bounds.height)
        }
    }
}

