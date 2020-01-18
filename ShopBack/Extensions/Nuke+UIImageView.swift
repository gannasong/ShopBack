//
//  Nuke+UIImageView.swift
//  ShopBack
//
//  Created by SUNG HAO LIN on 2019/12/22.
//  Copyright © 2019 SUNG HAO LIN. All rights reserved.
//

import Foundation
import Nuke

extension UIImageView {
  func nu_setImage(with url: URL, placeholderImage placeholder: UIImage? = nil, progress: ImageTask.ProgressHandler? = nil) {
    Nuke.loadImage(with: url,
                   options: ImageLoadingOptions(placeholder: placeholder, transition: .fadeIn(duration: 0.33)),
                      into: self,
                      progress: progress,
                      completion: nil)
  }
}
