//
//  ProductCell.swift
//  ShopBack
//
//  Created by SUNG HAO LIN on 2019/12/22.
//  Copyright © 2019 SUNG HAO LIN. All rights reserved.
//

import UIKit
import SnapKit

class ProductCell: UICollectionViewCell {

  lazy var coverImageView: UIImageView = {
    let coverImageView = UIImageView()
    coverImageView.contentMode = .scaleAspectFill
    return coverImageView
  }()

  lazy var oldPriceLabel: UILabel = {
    let oldPriceLabel = UILabel()
    oldPriceLabel.text = "$10,000"
    oldPriceLabel.sizeToFit()
    return oldPriceLabel
  }()

  lazy var newPriceLabel: UILabel = {
    let newPriceLabel = UILabel()
    newPriceLabel.text = "8,900 起"
    newPriceLabel.sizeToFit()
    return newPriceLabel
  }()

  lazy var offerTextLabel: UILabel = {
    let offerTextLabel = UILabel()
    offerTextLabel.text = "賺現金回饋"
    offerTextLabel.sizeToFit()
    return offerTextLabel
  }()

  lazy var voucherTextLabel: UILabel = {
    let voucherTextLabel = UILabel()
    voucherTextLabel.text = "Sony 超不抗罩耳機"
    voucherTextLabel.sizeToFit()
    return voucherTextLabel
  }()

  lazy var viaLabel: UILabel = {
    let viaLabel = UILabel()
    viaLabel.text = "via Pchome"
    viaLabel.sizeToFit()
    return viaLabel
  }()

  // MARK: - Initialization

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupSubViews()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupSubViews()
  }

  override func prepareForReuse() {
    super.prepareForReuse()

  }

  // MARK: - Public Methods

  func configure(with product: Product) {
    if let url = product.productUrl {
      coverImageView.nu_setImage(with: url)
    }
    newPriceLabel.text = product.newPrice
    oldPriceLabel.text = product.oldPrice
    offerTextLabel.text = product.offerText
    voucherTextLabel.text = product.voucherDesc
    viaLabel.text = "via \(product.merchantName)"
  }

  // MARK: - Private Methods

  private func setupSubViews() {
    contentView.addSubview(coverImageView)
//    contentView.addSubview(newPriceLabel)
//    contentView.addSubview(oldPriceLabel)
//    contentView.addSubview(offerTextLabel)
//    contentView.addSubview(voucherTextLabel)
//    contentView.addSubview(viaLabel)

    coverImageView.snp.makeConstraints {
      $0.top.left.right.equalToSuperview()
      $0.height.equalTo(100)
    }

//    newPriceLabel.snp.makeConstraints {
//      $0.top.equalTo(coverImageView.snp.bottom).offset(-5)
//      $0.height.equalTo(20)
//      $0.left.equalTo(contentView.snp.left).offset(15)
//    }
//
//    oldPriceLabel.snp.makeConstraints {
//      $0.top.equalTo(newPriceLabel.snp.bottom).offset(-5)
//      $0.height.equalTo(20)
//      $0.left.equalTo(contentView.snp.left).offset(15)
//    }
//
//    offerTextLabel.snp.makeConstraints {
//      $0.top.equalTo(oldPriceLabel.snp.bottom).offset(-5)
//      $0.height.equalTo(20)
//      $0.left.equalTo(contentView.snp.left).offset(15)
//    }
//
//    voucherTextLabel.snp.makeConstraints {
//      $0.top.equalTo(offerTextLabel.snp.bottom).offset(-5)
//      $0.height.equalTo(20)
//      $0.left.equalTo(contentView.snp.left).offset(15)
//    }
//
//    viaLabel.snp.makeConstraints {
//      $0.top.equalTo(voucherTextLabel.snp.bottom).offset(-5)
//      $0.height.equalTo(20)
//      $0.left.equalTo(contentView.snp.left).offset(15)
//    }
  }
}
