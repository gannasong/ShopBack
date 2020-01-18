//
//  String+ShopBack.swift
//  ShopBack
//
//  Created by Min on 2019/12/19.
//  Copyright © 2019 SUNG HAO LIN. All rights reserved.
//

import UIKit

extension String {
  var toImage: UIImage? {
    return UIImage(named: self)?.withRenderingMode(.alwaysOriginal)
  }
}
