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

  lazy var newPriceLabel: UILabel = {
    let newPriceLabel = UILabel()
    newPriceLabel.text = "8,900 起"
    newPriceLabel.font = .boldSystemFont(ofSize: 14)
    newPriceLabel.textColor = .sp_scarlet
    newPriceLabel.sizeToFit()
    return newPriceLabel
  }()

  lazy var oldPriceLabel: UILabel = {
    let oldPriceLabel = UILabel()
    oldPriceLabel.text = "$10,000"
    oldPriceLabel.font = .systemFont(ofSize: 13)
    oldPriceLabel.textColor = .systemGray
    let attributeStr = NSMutableAttributedString(string: oldPriceLabel.text!)
    attributeStr.addAttribute(.strikethroughStyle, value: NSNumber(value: NSUnderlineStyle.single.rawValue), range: NSRange(location: 0, length: attributeStr.length))
    oldPriceLabel.attributedText = attributeStr
    oldPriceLabel.sizeToFit()
    return oldPriceLabel
  }()

  lazy var offerTextLabel: UILabel = {
    let offerTextLabel = UILabel()
    offerTextLabel.text = "賺現金回饋"
    offerTextLabel.font = .systemFont(ofSize: 12)
    offerTextLabel.textColor = .sp_scarlet
    offerTextLabel.sizeToFit()
    return offerTextLabel
  }()

  lazy var voucherTextLabel: UILabel = {
    let voucherTextLabel = UILabel()
    voucherTextLabel.text = "Sony 超不抗罩耳機"
    voucherTextLabel.font = .systemFont(ofSize: 12)
    voucherTextLabel.textColor = .darkGray
    voucherTextLabel.numberOfLines = 0
    voucherTextLabel.sizeToFit()
    return voucherTextLabel
  }()

  lazy var viaLabel: UILabel = {
    let viaLabel = UILabel()
    viaLabel.text = "via Pchome"
    viaLabel.font = .systemFont(ofSize: 10)
    viaLabel.textColor = .systemGray
    viaLabel.sizeToFit()
    return viaLabel
  }()

  lazy var endDateLabel: UILabel = {
    let endDateLabel = UILabel()
    endDateLabel.font = .systemFont(ofSize: 12)
    endDateLabel.textColor = .white
    endDateLabel.textAlignment = .center
    endDateLabel.text = "43 天數 09:34:05"
    endDateLabel.sizeToFit()
    return endDateLabel
  }()

  lazy var gradientLayer: CAGradientLayer = {
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = CGRect(x: 0, y: 0, width: contentView.frame.width, height: 30)
    gradientLayer.colors = [UIColor.darkGray.cgColor, UIColor.clear.cgColor]
    gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
    gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
    return gradientLayer
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
//    endDateLabel.text = product.endDate
    print(">>>> endDate: \(product.endDate)")
  }

  // MARK: - Private Methods

  private func setupSubViews() {
    contentView.backgroundColor = .white
    layer.cornerRadius = 8
    clipsToBounds = true

    contentView.addSubview(coverImageView)
    contentView.layer.addSublayer(gradientLayer)
    contentView.addSubview(newPriceLabel)
    contentView.addSubview(oldPriceLabel)
    contentView.addSubview(offerTextLabel)
    contentView.addSubview(voucherTextLabel)
    contentView.addSubview(viaLabel)
    contentView.addSubview(endDateLabel)

    coverImageView.snp.makeConstraints {
      $0.top.left.right.equalToSuperview()
      $0.height.equalTo(170)
    }

    endDateLabel.snp.makeConstraints {
      $0.top.right.left.equalToSuperview()
      $0.height.equalTo(30)
    }

    newPriceLabel.snp.makeConstraints {
      $0.top.equalTo(coverImageView.snp.bottom).offset(24)
      $0.height.equalTo(20)
      $0.left.equalTo(contentView.snp.left).offset(8)
    }

    oldPriceLabel.snp.makeConstraints {
      $0.top.equalTo(newPriceLabel.snp.bottom).offset(-2)
      $0.height.equalTo(20)
      $0.left.equalTo(contentView.snp.left).offset(8)
    }

    offerTextLabel.snp.makeConstraints {
      $0.top.equalTo(oldPriceLabel.snp.bottom).offset(-2)
      $0.height.equalTo(20)
      $0.left.equalTo(contentView.snp.left).offset(8)
    }

    voucherTextLabel.snp.makeConstraints {
      $0.top.equalTo(offerTextLabel.snp.bottom).offset(4)
      $0.right.equalTo(contentView.snp.right).offset(-2)
      $0.left.equalTo(contentView.snp.left).offset(8)
    }

    viaLabel.snp.makeConstraints {
      $0.bottom.equalTo(contentView.snp.bottom).offset(-6)
      $0.height.equalTo(20)
      $0.left.equalTo(contentView.snp.left).offset(8)
    }
  }
}
