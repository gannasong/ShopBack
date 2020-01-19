//
//  HomepageIGCollectionViewCell.swift
//  ShopBack
//
//  Created by SUNG HAO LIN on 2019/12/23.
//  Copyright © 2019 SUNG HAO LIN. All rights reserved.
//

import UIKit
import IGListKit
import RxSwift
import SnapKit

class HomepageIGCollectionViewCell: UICollectionViewCell {

  lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
    view.alwaysBounceVertical = false
    view.alwaysBounceHorizontal = false
    view.showsHorizontalScrollIndicator = false
    return view
  }()

  // MARK: - Initialization

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupSubviews()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupSubviews()
  }

  override func prepareForReuse() {
    super.prepareForReuse()
  }

  // MARK: - Private Methods

  private func setupSubviews() {
    collectionView.backgroundColor = .clear
    contentView.addSubview(collectionView)
    collectionView.snp.makeConstraints {
      $0.top.bottom.right.left.equalToSuperview()
    }
  }
}
