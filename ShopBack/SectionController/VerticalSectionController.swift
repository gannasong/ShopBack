//
//  VerticalSectionController.swift
//  ShopBack
//
//  Created by SUNG HAO LIN on 2019/12/22.
//  Copyright © 2019 SUNG HAO LIN. All rights reserved.
//

import Foundation
import IGListKit

class VerticalSectionController: ListSectionController {

  private var story: Story?

  // MARK: - Initialization

  override init() {
    super.init()
    inset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
    minimumLineSpacing = 10
  }

  // MARK: - ListSectionController

  override func sizeForItem(at index: Int) -> CGSize {
    guard let width = collectionContext?.containerSize.width else { return .zero }
    return CGSize(width: (width - 30) / 2, height: 320)
  }

  override func numberOfItems() -> Int {
    guard let count = story?.items.count else { return 0 }
    return count
  }

  override func cellForItem(at index: Int) -> UICollectionViewCell {
    guard let cell = collectionContext?.dequeueReusableCell(of: ProductCell.self, for: self, at: index) as? ProductCell else {
      fatalError("ListSectionController reuse \(String(describing: ProductCell.self)) error")
    }
    if let items = story?.items as? [Product] {
      cell.configure(with: items[index])
    }
    return cell
  }

  override func didUpdate(to object: Any) {
    story = object as? Story
  }

  override func didSelectItem(at index: Int) {
    print("did select index: \(index)")
  }
}
