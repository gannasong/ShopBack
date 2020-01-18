//
//  APIManager+Parser.swift
//  ShopBack
//
//  Created by SUNG HAO LIN on 2019/12/21.
//  Copyright © 2019 SUNG HAO LIN. All rights reserved.
//

import Foundation
import RxSwift

extension Observable {
  func parseObjectToStory(type: StoryType) -> Observable<Story> {
    return map { (object) -> Story in
      guard let items = object as? [Any] else {
        fatalError("💥 Parse object to story fail")
      }
      return Story(with: type, items: items)
    }
  }
}
