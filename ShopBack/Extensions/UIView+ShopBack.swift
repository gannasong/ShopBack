//
//  UIView+ShopBack.swift
//  ShopBack
//
//  Created by Min on 2019/12/17.
//  Copyright © 2019 SUNG HAO LIN. All rights reserved.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach { addSubview($0) }
    }
}
