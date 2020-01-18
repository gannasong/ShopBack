//
//  SBNavigationController.swift
//  ShopBack
//
//  Created by Min on 2019/12/17.
//  Copyright © 2019 SUNG HAO LIN. All rights reserved.
//

import UIKit
import SnapKit

class SBNavigationController: UINavigationController {

  lazy var searchInputView: MainNavigationView = {
    return MainNavigationView()
  }()

  // MARK: - UIViewController

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setUserInterface()
  }

  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }

  // MARK: - private Methods

  private func setUserInterface() {
    navigationBar.setBackgroundImage(createImage(from: CGSize(width: navigationBar.frame.width, height: 64), with: .sp_scarlet), for: .default)
    navigationBar.addSubview(searchInputView)

    searchInputView.snp.makeConstraints {
      $0.centerX.centerY.equalToSuperview()
      $0.width.equalTo(navigationBar.frame.width - (10 * 2))
      $0.height.equalTo(navigationBar.frame.height)
    }
  }
}
