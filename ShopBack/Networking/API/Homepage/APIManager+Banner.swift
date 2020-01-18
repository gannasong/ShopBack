//
//  APIManager+Banner.swift
//  ShopBack
//
//  Created by SUNG HAO LIN on 2019/12/19.
//  Copyright © 2019 SUNG HAO LIN. All rights reserved.
//

import Foundation
import RxSwift

extension APIManager {
  func fetchHomepageBanner() -> Observable<Story> {
    return provider.rx.request(.fetchHomepageBanner)
      .asObservable()
      .filterSuccessfulStatusCodes()
      .map([Banner].self, atKeyPath: Keys.data.rawValue)
      .parseObjectToStory(type: .banner)
  }
}
