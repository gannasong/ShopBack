//
//  UserSession.swift
//  ShopBack
//
//  Created by SUNG HAO LIN on 2019/12/19.
//  Copyright © 2019 SUNG HAO LIN. All rights reserved.
//

import Foundation
import Moya

protocol UserSession {
  var shopbackAgent: String { get }
  var shopbackKey: String { get }
  var clientUserAgent: String { get }
}

extension UserSession {

  // MARK: - ConfigureHTTPHeader

  var shopbackAgent: String {
    return "sbiosagent/authenticationFramework"
  }

  var shopbackKey: String {
    return "q452R0g0muV3OXP8VoE7q3wshmm2rdI3"
  }

  var clientUserAgent: String {
    return "02091E45-D2DA-46A5-88C0-3B26D47C16DC"
  }

  var userAccessToken: String {
    let token = AccountManager.shared.userAccessToken()
    assert(!token.isEmpty, "💥 - User's access token shouldn't be null string.")
    return token
  }

  var shopbackDomain: String {
    return "www.shopback.com.tw"
  }
}
