//
//  UIColor+ShopBack.swift
//  ShopBack
//
//  Created by Min on 2019/12/17.
//  Copyright © 2019 SUNG HAO LIN. All rights reserved.
//

import UIKit

extension UIColor {

  // MARK: - Initialization

  convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
    self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a / 100.0)
  }

  // MARK: - Customization

  class var sp_scarlet: UIColor {
    return .init(r: 252, g: 80, b: 77, a: 100)
  }

  class var sp_sapphire: UIColor {
    return .init(r: 93, g: 100, b: 118, a: 100)
  }

  class var sp_blackA10: UIColor {
    return .init(r: 0, g: 0, b: 0, a: 10)
  }

  class var sp_whiteA60: UIColor {
    return .init(r: 255, g: 255, b: 255, a: 60)
  }

  class var sp_mainSearchBarPlaceholder_lightGray: UIColor {
    return .init(r: 140, g: 140, b: 146, a: 100)
  }
}
