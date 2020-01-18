//
//  APIManager.swift
//  ShopBack
//
//  Created by SUNG HAO LIN on 2019/12/17.
//  Copyright © 2019 SUNG HAO LIN. All rights reserved.
//

import Foundation
import Moya

final class APIManager: NSObject {

  static let shared = APIManager()

  let provider = MoyaProvider<APIType>()

  enum Keys: String {
    case data
  }
}
