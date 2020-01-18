//
//  TypeHelper.swift
//  ShopBack
//
//  Created by SUNG HAO LIN on 2019/12/23.
//  Copyright © 2019 SUNG HAO LIN. All rights reserved.
//

import Foundation

class TypeHelper: NSObject {
  class func convertToStoryType(byStory story: Any) -> StoryType {
    guard let story = story as? Story else { return .none }
    return story.type
  }
}
