//
//  SPIndicatorView.swift
//  ShopBack
//
//  Created by Min on 2019/12/24.
//  Copyright © 2019 SUNG HAO LIN. All rights reserved.
//

import UIKit

struct SPIndicatorAnimationKeypath {
  static let strokeStart = "strokeStart"
  static let strokeEnd = "strokeEnd"
  static let rotation = "rotation"
}

class IndicatorAnimationView: UIView {

  lazy private var circleLayer: CAShapeLayer = {
    let layer = CAShapeLayer()
    layer.lineWidth = 10
    layer.fillColor = nil
    layer.lineCap = .round
    layer.strokeColor = UIColor.sp_scarlet.cgColor
    return layer
  }()

  lazy private var strokeStartAnimation: CAAnimation = {
    let animation = CABasicAnimation(keyPath: SPIndicatorAnimationKeypath.strokeStart)
    animation.beginTime = 0.8
    animation.fromValue = 0
    animation.toValue = 1
    animation.duration = 1.5
    animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)

    return setUpAnimationGroup(with: [animation])
  }()

  lazy private var strokeEndAnimation: CAAnimation = {
    let animation = CABasicAnimation(keyPath: SPIndicatorAnimationKeypath.strokeEnd)
    animation.fromValue = 0
    animation.toValue = 1
    animation.duration = 1.5
    animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)

    return setUpAnimationGroup(with: [animation])
  }()

  lazy private var rotationAnimation: CAAnimation = {
    let animation = CABasicAnimation(keyPath: "transform.rotation.z")
    animation.fromValue = 0
    animation.toValue = Double.pi * 2
    animation.duration = 3
    animation.repeatCount = MAXFLOAT
    return animation
  }()

  // MARK: - Initialization

  override init(frame: CGRect) {
    super.init(frame: frame)
    setUserInterface()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setUserInterface()
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    drawCircle()
  }

  func startAnimation() {
    circleLayer.add(strokeEndAnimation, forKey: SPIndicatorAnimationKeypath.strokeEnd)
    circleLayer.add(strokeStartAnimation, forKey: SPIndicatorAnimationKeypath.strokeStart)
    circleLayer.add(rotationAnimation, forKey: SPIndicatorAnimationKeypath.rotation)
  }

  func stopAnimation() {
    circleLayer.removeAnimation(forKey: SPIndicatorAnimationKeypath.strokeEnd)
    circleLayer.removeAnimation(forKey: SPIndicatorAnimationKeypath.strokeStart)
    circleLayer.removeAnimation(forKey: SPIndicatorAnimationKeypath.rotation)
  }

  // MARK: - Private Methods

  private func setUserInterface() {
    backgroundColor = .sp_whiteA60
    layer.cornerRadius = 8
    layer.addSublayer(circleLayer)
  }

  private func setUpAnimationGroup(with animations: [CAAnimation]) -> CAAnimationGroup {
    let group = CAAnimationGroup()
    group.duration = 2.3
    group.repeatCount = MAXFLOAT
    group.animations = animations
    return group
  }

  private func drawCircle() {
    circleLayer.position = CGPoint(x: bounds.midX, y: bounds.midY)

    let startAngle = CGFloat(-Double.pi / 2)
    let endAngle = startAngle + CGFloat(Double.pi * 2)
    circleLayer.path = UIBezierPath(arcCenter: .zero, radius: min(bounds.width - 24, bounds.height - 24) / 2 - circleLayer.lineWidth / 2, startAngle: startAngle, endAngle: endAngle, clockwise: true).cgPath
  }
}
