//
//  EmbeddedCollectionViewController.swift
//  ShopBack
//
//  Created by SUNG HAO LIN on 2019/12/23.
//  Copyright © 2019 SUNG HAO LIN. All rights reserved.
//

import UIKit
import IGListKit

class EmbeddedCollectionViewController: ListSectionController {

  var item: Any?
  var article: Article?
  var banner: Banner?
  var storyType: StoryType = .none

  // MARK: - Initialization

  override init() {
    super.init()

  }

  convenience init(withStoryType storyType: StoryType, withItme item: Any) {
    self.init()
    self.item = item
    self.storyType = storyType
    switch storyType {
      case .article, .banner:
        inset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
      default:
        inset = .zero
    }
  }

  override func sizeForItem(at index: Int) -> CGSize {
    switch self.storyType {
      case .article:
        return CGSize(width: Constants.articleItemWidth, height: Constants.articleItemHeight)
      case .banner:
        return CGSize(width: Constants.bannerItemWidth, height: Constants.bannerItemHeight)
      default:
        return .zero
    }
  }

  override func cellForItem(at index: Int) -> UICollectionViewCell {
    switch self.storyType {
      case .article:
        guard let cell = collectionContext?.dequeueReusableCell(of: ArticleCell.self, for: self, at: index) as? ArticleCell else {
          return UICollectionViewCell()
        }
        if let article = item as? Article {
          cell.configure(with: article)
        }
        return cell
      case .banner:
        guard let cell = collectionContext?.dequeueReusableCell(of: BannerCell.self, for: self, at: index) as? BannerCell else {
          return UICollectionViewCell()
        }
        if let banner = item as? Banner {
          cell.configure(with: banner)
        }
        return cell
      default:
        return UICollectionViewCell()
    }
  }

  override func didUpdate(to object: Any) {
    print("Embedded object: \(object)")
    switch storyType {
      case .article:
        item = object as? Article
      case .banner:
        item = object as? Banner
      default: return
    }
  }

  // MARK: - Private Methods

  private struct Constants {
    static let articleItemWidth: CGFloat = UIScreen.main.bounds.size.width * 0.75
    static let articleItemHeight: CGFloat = 200
    static let bannerItemWidth: CGFloat = UIScreen.main.bounds.size.width * 0.75
    static let bannerItemHeight: CGFloat = 330
  }
}
