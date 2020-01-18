//
//  APIManager+Product.swift
//  ShopBack
//
//  Created by SUNG HAO LIN on 2019/12/22.
//  Copyright © 2019 SUNG HAO LIN. All rights reserved.
//

import Foundation
import RxSwift

extension APIManager {
  func fetchHomepageProduct() -> Observable<Story> {
    return provider.rx.request(.fetchHomepageProduct)
      .asObservable()
      .filterSuccessfulStatusCodes()
      .map([Product].self, atKeyPath: Keys.data.rawValue)
      .parseObjectToStory(type: .product)
  }
}
