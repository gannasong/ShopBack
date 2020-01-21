//
//  APIManager+Trip.swift
//  ShopBack
//
//  Created by SUNG HAO LIN on 2020/1/20.
//  Copyright © 2020 SUNG HAO LIN. All rights reserved.
//

import Foundation
import RxSwift

extension APIManager {
  func fetchHomepageTrip() -> Observable<Story> {
    return provider.rx.request(.fetchHomepageTrip)
      .asObservable()
      .filterSuccessfulStatusCodes()
      .map([Trip].self, atKeyPath: Keys.data.rawValue)
      .parseObjectToStory(type: .trip)
  }
}
