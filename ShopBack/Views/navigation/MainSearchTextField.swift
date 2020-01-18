//
//  MainSearchTextField.swift
//  ShopBack
//
//  Created by Min on 2019/12/19.
//  Copyright © 2019 SUNG HAO LIN. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MainSearchTextField: UITextField {

  lazy private var leftIconImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()

  var isBeginEditing = false {
    didSet {
      backgroundColor = isBeginEditing ? .white : .sp_blackA10
      leftIconImageView.image = isBeginEditing ? "Main_searchBar_gray_leftIcon".toImage : "Main_searchBar_white_leftIcon".toImage
      setPlaceholder(with: isBeginEditing ? .sp_mainSearchBarPlaceholder_lightGray : .white)
    }
  }

  // MARK: - Initialization

  init() {
    super.init(frame: .zero)
    setUserInterface()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setUserInterface()
  }

  override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
    return CGRect(x: 5, y: 5, width: 35, height: bounds.height - (5 * 2))
  }

  // MARK: - Private Methods

  private func setUserInterface() {
    borderStyle = .none
    layer.cornerRadius = 10
    backgroundColor = UIColor(r: 0, g: 0, b: 0, a: 15)
    leftView = leftIconImageView
    leftViewMode = .always
    isBeginEditing = false
    clearButtonMode = .whileEditing
    tintColor = .sp_scarlet
    textColor = .sp_sapphire
  }

  private func setPlaceholder(with color: UIColor) {
    attributedPlaceholder = NSMutableAttributedString(string: "搜尋商品,商店及分類",
                                                      attributes: [.font: UIFont.systemFont(ofSize: 16), .foregroundColor: color])
  }
}
