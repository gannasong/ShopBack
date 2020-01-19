//
//  ArticleCell.swift
//  ShopBack
//
//  Created by SUNG HAO LIN on 2019/12/23.
//  Copyright © 2019 SUNG HAO LIN. All rights reserved.
//

import UIKit
import SnapKit

class ArticleCell: UICollectionViewCell {

  lazy var coverImageView: UIImageView = {
    let coverImageView = UIImageView()
    coverImageView.contentMode = .scaleAspectFill
    coverImageView.clipsToBounds = true
    return coverImageView
  }()

  lazy var postTitleLable: UILabel = {
    let postTitleLable = UILabel()
    postTitleLable.text = "永遠少個包？淘寶女包推薦店家，日系、韓系質感人氣款隨你挑"
    postTitleLable.font = .systemFont(ofSize: 13)
    postTitleLable.textColor = .darkText
    postTitleLable.numberOfLines = 0
    postTitleLable.textAlignment = .center
    postTitleLable.lineBreakMode = .byWordWrapping
    postTitleLable.sizeToFit()
    return postTitleLable
  }()

  lazy var postAuthorLable: UILabel = {
    let postAuthorLable = UILabel()
    postAuthorLable.text = "stacysha"
    postAuthorLable.font = .systemFont(ofSize: 11)
    postAuthorLable.textColor = .systemGray
    postAuthorLable.sizeToFit()
    return postAuthorLable
  }()

  lazy var postDateLabel: UILabel = {
    let postDateLabel = UILabel()
    postDateLabel.text = "・14 小時前"
    postDateLabel.font = .systemFont(ofSize: 11)
    postDateLabel.textColor = .systemGray
    postDateLabel.sizeToFit()
    return postDateLabel
  }()

  // MARL: - Initialization

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

  func configure(with article: Article) {
    if let url = article.postImage {
      print("ArticleCell url: \(url)")
      coverImageView.nu_setImage(with: url)
    }
    print(">>>> \(article.postUrl?.absoluteString)")
    postTitleLable.text = article.postTitle
    postAuthorLable.text = article.postAuthorName
//    postDateLabel.text = article.postDate
  }

  // MARK: - Private Methods

  private func setupSubViews() {
    contentView.backgroundColor = .white
    layer.cornerRadius = 8
    clipsToBounds = true

    contentView.addSubview(coverImageView)
    contentView.addSubview(postTitleLable)
    contentView.addSubview(postAuthorLable)
    contentView.addSubview(postDateLabel)

    coverImageView.snp.makeConstraints {
      $0.top.left.right.equalToSuperview()
      $0.height.equalTo(120)
    }

    postTitleLable.snp.makeConstraints {
      $0.top.equalTo(coverImageView.snp.bottom).offset(10)
      $0.left.equalTo(contentView.snp.left).offset(8)
      $0.right.equalTo(contentView.snp.right).offset(-8)
    }

    postAuthorLable.snp.makeConstraints {
      $0.top.equalTo(postTitleLable.snp.bottom).offset(6)
      $0.right.equalTo(contentView.snp.centerX).offset(-10)
    }

    postDateLabel.snp.makeConstraints {
      $0.top.equalTo(postTitleLable.snp.bottom).offset(6)
      $0.left.equalTo(contentView.snp.centerX).offset(-10)
    }
  }
}
