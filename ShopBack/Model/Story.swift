//
//  Story.swift
//  ShopBack
//
//  Created by SUNG HAO LIN on 2019/12/21.
//  Copyright © 2019 SUNG HAO LIN. All rights reserved.
//

import Foundation
import IGListKit

enum StoryType {
  case none
  case banner
  case article
  case product
  case trip
}

class Story {
  let type: StoryType
  let items: [Any]

  init(with type: StoryType, items: [Any]) {
    self.type = type
    self.items = items
  }
}

extension Story: ListDiffable {
  func diffIdentifier() -> NSObjectProtocol {
    return self as! NSObjectProtocol
  }

  func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    guard let story = object as? Story else { return false }
    return type == story.type
  }
}
