//
//  APIManager+Articles.swift
//  ShopBack
//
//  Created by SUNG HAO LIN on 2019/12/20.
//  Copyright © 2019 SUNG HAO LIN. All rights reserved.
//

import Foundation
import RxSwift

extension APIManager {
  func fetchHomepageArticle(page: Int = 1) -> Observable<Story> {
    return provider.rx.request(.fetchHomepageArticle(page: page))
      .asObservable()
      .filterSuccessfulStatusCodes()
      .map([Article].self, atKeyPath: Keys.data.rawValue)
      .parseObjectToStory(type: .article)
  }
}
