//
//  HorizontalSectionViewController.swift
//  ShopBack
//
//  Created by SUNG HAO LIN on 2019/12/21.
//  Copyright © 2019 SUNG HAO LIN. All rights reserved.
//

import UIKit
import IGListKit
import RxSwift
import RxCocoa

class HorizontalSectionViewController: ListSectionController, ListAdapterDataSource {

  private var story: Story?
  private var storyType: StoryType = .none

  struct Constant {
    static let articleItemHeight: CGFloat = 204
  }

  lazy var adapter: ListAdapter = {
    let adapter = ListAdapter(updater: ListAdapterUpdater(),
                              viewController: self.viewController,
                              workingRangeSize: 0)
    adapter.dataSource = self
    return adapter
  }()

  // MARK: - Initialization

  override init() {
    super.init()
    inset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
  }

  override func sizeForItem(at index: Int) -> CGSize {
    guard let storyType = story?.type, let width = collectionContext?.containerSize.width else { return .zero }
    switch storyType {
      case .article:
        let height = collectionViewItemHeight(storyType: storyType)
        print(">>>>> width: \(width), height: \(height)")
        return CGSize(width: width, height: height)
      default:
      break
    }
    return .zero
  }

  override func cellForItem(at index: Int) -> UICollectionViewCell {
    guard let storyType = story?.type else { return UICollectionViewCell() }
    switch storyType {
      case .article:
        guard let cell = collectionContext?.dequeueReusableCell(of: HomepageIGCollectionViewCell.self, for: self, at: index) as? HomepageIGCollectionViewCell else {
          return UICollectionViewCell()
        }
        adapter.collectionView = cell.collectionView
        return cell
      default:
      return UICollectionViewCell()
    }
  }

  override func didUpdate(to object: Any) {
    story = object as? Story
    storyType = story!.type
    print("Horizontal story: \(story)")
    print("Horizontal storyType: \(storyType)")
  }

  // MARK: - ListAdapterDataSource

  func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
    guard let items = story?.items as? [ListDiffable] else { return [] }
    print("Horizontal items: \(items)")
    return items
  }

  func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
    print("Horizontal object: \(object)")
    switch self.storyType {
      case .article:
        print("Horizontal 近來 article")
        // 役要改 EmbeddedCollectionViewController 傳入的東西
        return EmbeddedCollectionViewController(withStoryType: .article, withItme: story)
      default:
        return ListSectionController()
    }
    return ListSectionController()
  }

  func emptyView(for listAdapter: ListAdapter) -> UIView? {
    return nil
  }

  // MARK: - Private Methods

  private func collectionViewItemHeight(storyType: StoryType) -> CGFloat {
    switch storyType {
      case .article:
        return Constant.articleItemHeight
      default:
        return 0
    }
  }
}
