//
//  APIType.swift
//  ShopBack
//
//  Created by SUNG HAO LIN on 2019/12/17.
//  Copyright © 2019 SUNG HAO LIN. All rights reserved.
//

import Foundation
import Moya

enum APIType {
  // Account
  case checkUniqueAccount(email: String)
  case signInWithEmail(password: String)

  // Member
  case fetchMemberData

  // Product
  case fetchHomepageTrip
  case fetchHomepageBanner
  case fetchHomepageArticle(page: Int)
  case fetchHomepageProduct

  // Cashbacks
  case fetchCashbackAmounts
}

extension APIType: UserSession, TargetType {

  var baseURL: URL {
    guard let url = URL(string: "https://api-app.shopback.com.tw/") else {
      fatalError("💥 BaseURL is nil")
    }
    return url
  }

  var path: String {
    switch self {
      // Account
      case .checkUniqueAccount: return "members/check-unique"
      case .signInWithEmail: return "members/sign-in"
      case .fetchMemberData: return "members/me"
      // Homepage
      case .fetchHomepageTrip: return "mobile-content/v1/components/5d6aa42df1f1ce3e49650aff"
      case .fetchHomepageBanner: return "mobile/banners"
      case .fetchHomepageArticle: return "mobile/wordpress-posts"
      case .fetchHomepageProduct: return "mobile-content/v1/components/5dd3b7a0dbaead21d7b0e17d"
      case .fetchCashbackAmounts: return "cashbacks/latest"
    }
  }

  var method: Moya.Method {
    switch self {
      case .signInWithEmail: return .post
      default: return .get
    }
  }

  var sampleData: Data {
    return Data()
  }

  var parameters: [String: Any]? {
    var parameters: [String: Any] = [:]
    switch self {
      case let .checkUniqueAccount(email):
        parameters = [
          "email": email
        ]
      case let .signInWithEmail(password):
        parameters = [
          "email": AccountManager.shared.email(),
          "password": password,
          "client_user_agent": clientUserAgent
        ]
      case .fetchHomepageTrip:
        parameters = [
          "displayType": "random",
          "limit": "6",
          "offset": "0"
        ]
      case let .fetchHomepageArticle(page):
        parameters = [
          "page": page,
          "limit": "10"
        ]
      case .fetchHomepageProduct:
        parameters = [
          "displayType": "random",
          "limit": "10",
          "offset": "0"
        ]
      case .fetchHomepageBanner, .fetchMemberData, .fetchCashbackAmounts:
        break
    }

    return parameters
  }

  var task: Task {
    guard let parameters = parameters else { return .requestPlain }
    switch self {
      case .signInWithEmail:
      return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
      default:
        return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
    }
  }

  var headers: [String : String]? {
    var headers = [
      "x-shopback-agent": shopbackAgent,
      "x-shopback-key": shopbackKey,
      "x-shopback-client-user-agent": clientUserAgent,
      "x-shopback-domain": shopbackDomain,
    ]

    switch self {
      case .fetchCashbackAmounts:
        headers["authorization"] = "JWT \(authAccessToken)"
        print(">>>>> authAccessToken: \(authAccessToken)")
      default: break
    }
    return headers
  }

}
