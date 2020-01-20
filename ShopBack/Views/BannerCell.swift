//
//  BannerCell.swift
//  ShopBack
//
//  Created by SUNG HAO LIN on 2020/1/20.
//  Copyright © 2020 SUNG HAO LIN. All rights reserved.
//

import UIKit
import SnapKit

class BannerCell: UICollectionViewCell {

  lazy var bannerImageView: UIImageView = {
    let bannerImageView = UIImageView()
    bannerImageView.contentMode = .scaleAspectFill
    bannerImageView.clipsToBounds = true
    return bannerImageView
  }()

  // MARK: - Initialization

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupSubViews()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func prepareForReuse() {
    super.prepareForReuse()
  }

  // MARK: - Public Methods

  func configure(with banner: Banner) {
    if let url = banner.mobileImage {
      bannerImageView.nu_setImage(with: url)
    }
  }

  // MARK: - Private Methods

  private func setupSubViews() {
    layer.cornerRadius = 8
    clipsToBounds = true

    contentView.addSubview(bannerImageView)
    bannerImageView.snp.makeConstraints {
      $0.top.left.right.bottom.equalToSuperview()
    }
  }
}
