//
//  APIManager+Members.swift
//  ShopBack
//
//  Created by SUNG HAO LIN on 2019/12/19.
//  Copyright © 2019 SUNG HAO LIN. All rights reserved.
//

import Foundation
import Moya
import RxSwift

extension APIManager {
  // When User login need to call this method to update authToken.
  func fetchMemberData() -> Observable<Member> {
    return provider.rx.request(.fetchMemberData)
      .asObservable()
      .filterSuccessfulStatusCodes()
      .map(Member.self)
  }
}
