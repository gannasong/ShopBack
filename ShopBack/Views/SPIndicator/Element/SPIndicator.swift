//
//  SPIndicator.swift
//  ShopBack
//
//  Created by Min on 2019/12/24.
//  Copyright © 2019 SUNG HAO LIN. All rights reserved.
//

import UIKit
import SnapKit

class SPIndicator: UIView {

  lazy private var indicator: IndicatorAnimationView = {
    return IndicatorAnimationView()
  }()

  private static var isLoading = false
  private static var indicatorView: SPIndicator?

  // MARK: - Initialization

  init() {
    super.init(frame: UIScreen.main.bounds)
    setUserInterface()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setUserInterface()
  }

  override func removeFromSuperview() {
    super.removeFromSuperview()
    indicator.stopAnimation()
  }

  class func show() {
    guard !isLoading else { return }
    isLoading = true
    indicatorView = SPIndicator()
  }

  class func dismiss() {
    guard isLoading else { return }
    isLoading = false
    indicatorView?.removeFromSuperview()
    indicatorView = nil
  }

  // MARK: - Private Methods

  private func setUserInterface() {
    addSubview(indicator)

    setUpLayout()

    var window: UIWindow?
    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
        window = windowScene.windows.first
    }
    window?.addSubview(self)
    indicator.startAnimation()
  }

  private func setUpLayout() {
    indicator.snp.makeConstraints {
      $0.centerX.centerY.equalToSuperview()
      $0.width.height.equalTo(74)
    }
  }
}
