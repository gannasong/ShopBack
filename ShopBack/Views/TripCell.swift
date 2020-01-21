//
//  TripCell.swift
//  ShopBack
//
//  Created by SUNG HAO LIN on 2020/1/21.
//  Copyright © 2020 SUNG HAO LIN. All rights reserved.
//

import UIKit
import SnapKit

class TripCell: UICollectionViewCell {

  lazy var tripImageView: UIImageView = {
    let tripImageView = UIImageView()
    tripImageView.contentMode = .scaleAspectFill
    tripImageView.clipsToBounds = true
    return tripImageView
  }()

  lazy var logoImageView: UIImageView = {
    let logoImageView = UIImageView()
    logoImageView.contentMode = .scaleAspectFit
    logoImageView.backgroundColor = UIColor.white
    logoImageView.layer.borderColor = UIColor.black.cgColor
    logoImageView.layer.borderWidth = 0.1
    logoImageView.layer.cornerRadius = 2
    logoImageView.clipsToBounds = true
    return logoImageView
  }()

  lazy var voucherDescLabel: UILabel = {
    let voucherDescLabel = UILabel()
    voucherDescLabel.text = "國內外訂房2折起，優惠包山包海，睡好付少玩得飽！"
    voucherDescLabel.font = .systemFont(ofSize: 12)
    voucherDescLabel.textColor = .darkText
    voucherDescLabel.numberOfLines = 0
    voucherDescLabel.textAlignment = .center
    voucherDescLabel.lineBreakMode = .byWordWrapping
    voucherDescLabel.sizeToFit()
    return voucherDescLabel
  }()

  lazy var cashbackLabel: UILabel = {
    let cashbackLabel = UILabel()
    cashbackLabel.text = "最高 11% 現金回饋"
    cashbackLabel.font = .boldSystemFont(ofSize: 12)
    cashbackLabel.textColor = .sp_scarlet
    cashbackLabel.sizeToFit()
    return cashbackLabel
  }()

  lazy var originalCashbackLabel: UILabel = {
    let originalCashbackLabel = UILabel()
    originalCashbackLabel.text = "原最高 2%"
    originalCashbackLabel.font = .systemFont(ofSize: 12)
    originalCashbackLabel.textColor = .systemGray
    originalCashbackLabel.sizeToFit()
    return originalCashbackLabel
  }()

  lazy var tripButton: UIButton = {
    let tripButton = UIButton()
    tripButton.backgroundColor = .sp_scarlet
    tripButton.titleLabel?.font = .boldSystemFont(ofSize: 13)
    tripButton.titleLabel?.text = "查看優惠"
    tripButton.setTitle("查看優惠", for: .normal)
    tripButton.setTitleColor(.white, for: .normal)
    tripButton.layer.cornerRadius = 4
    tripButton.sizeToFit()
    return tripButton
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

  // MARK: Public Methods

  func configure(with trip: Trip) {
    if let url = trip.productUrl {
      tripImageView.nu_setImage(with: url)
    }
    if let logo = trip.logoUrl {
      logoImageView.nu_setImage(with: logo)
    }

    voucherDescLabel.text = trip.voucherDesc
    cashbackLabel.text = "最高 \(trip.cashback.amount)% 現金回饋"
    originalCashbackLabel.text = trip.originalCashback != nil ? "原價最高 \(trip.originalCashback!.amount)%" : ""
  }

  // MARK: Private Methods

  private func setupSubViews() {
    contentView.backgroundColor = .white
    layer.cornerRadius = 8
    clipsToBounds = true

    contentView.addSubview(tripImageView)
    contentView.addSubview(logoImageView)
    contentView.addSubview(voucherDescLabel)
    contentView.addSubview(cashbackLabel)
    contentView.addSubview(originalCashbackLabel)
    contentView.addSubview(tripButton)

    tripImageView.snp.makeConstraints {
      $0.top.right.left.equalToSuperview()
      $0.height.equalTo(100)
    }

    logoImageView.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.centerY.equalTo(tripImageView.snp.bottom)
      $0.width.equalTo(55)
      $0.height.equalTo(40)
    }

    voucherDescLabel.snp.makeConstraints {
      $0.top.equalTo(logoImageView.snp.bottom).offset(8)
      $0.left.equalTo(contentView.snp.left).offset(8)
      $0.right.equalTo(contentView.snp.right).offset(-6)
      $0.height.equalTo(50)
    }

    cashbackLabel.snp.makeConstraints {
      $0.top.equalTo(voucherDescLabel.snp.bottom).offset(-2)
      $0.height.equalTo(20)
      $0.centerX.equalToSuperview()
    }

    originalCashbackLabel.snp.makeConstraints {
      $0.top.equalTo(cashbackLabel.snp.bottom)
      $0.centerX.equalToSuperview()
      $0.height.equalTo(20)
    }

    tripButton.snp.makeConstraints {
      $0.left.equalTo(contentView.snp.left).offset(8)
      $0.right.equalTo(contentView.snp.right).offset(-8)
      $0.height.equalTo(30)
      $0.bottom.equalTo(contentView.snp.bottom).offset(-8)
    }
  }
}
