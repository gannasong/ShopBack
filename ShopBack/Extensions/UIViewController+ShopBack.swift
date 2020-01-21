//
//  UIViewController+ShopBack.swift
//  ShopBack
//
//  Created by Min on 2019/12/19.
//  Copyright © 2019 SUNG HAO LIN. All rights reserved.
//

import UIKit

extension UIViewController {
  func createImage(from size: CGSize, with color: UIColor) -> UIImage? {
    UIGraphicsBeginImageContext(size)
    guard let context = UIGraphicsGetCurrentContext() else { return nil }
    context.setFillColor(color.cgColor)
    context.fill(CGRect(origin: .zero, size: size))

    let viewImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return viewImage
  }
}
