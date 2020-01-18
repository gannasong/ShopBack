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
    return coverImageView
  }()

  lazy var postTitleLable: UILabel = {
    let postTitleLable = UILabel()
    postTitleLable.text = "永遠少個包？淘寶女包推薦店家，日系、韓系質感人氣款隨你挑"
    postTitleLable.sizeToFit()
    return postTitleLable
  }()

  lazy var postAuthorLable: UILabel = {
    let postAuthorLable = UILabel()
    postAuthorLable.text = "stacysha"
    postAuthorLable.sizeToFit()
    return postAuthorLable
  }()

  lazy var postDateLabel: UILabel = {
    let postDateLabel = UILabel()
    postDateLabel.text = "2天前"
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

  // MARK: - Public Methods

  func configure(with article: Article) {
    if let url = article.postImage {
      print("ArticleCell url: \(url)")
      coverImageView.nu_setImage(with: url)
    }
    print(">>>> \(article.postUrl?.absoluteString)")
    postTitleLable.text = article.postTitle
    postAuthorLable.text = article.postAuthorName
    postDateLabel.text = article.postDate
  }

  // MARK: - Private Methods

  private func setupSubViews() {
    contentView.addSubview(coverImageView)
    contentView.addSubview(postTitleLable)
    contentView.addSubview(postAuthorLable)
    contentView.addSubview(postDateLabel)

    coverImageView.snp.makeConstraints {
      $0.top.left.right.equalToSuperview()
      $0.height.equalTo(80)
    }

    postTitleLable.snp.makeConstraints {
      $0.top.equalTo(coverImageView.snp.bottom).offset(-10)
      $0.left.equalTo(contentView.snp.left).offset(10)
      $0.right.equalTo(contentView.snp.right).offset(-10)
    }

    postAuthorLable.snp.makeConstraints {
      $0.top.equalTo(postTitleLable.snp.bottom).offset(-5)
      $0.right.equalTo(contentView.snp.centerX).offset(-5)
    }

    postDateLabel.snp.makeConstraints {
      $0.top.equalTo(postTitleLable.snp.bottom).offset(-5)
      $0.left.equalTo(contentView.snp.centerX).offset(5)
    }
  }
}
