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
  case fetchHomepageBanner
  case fetchHomepageArticle(page: Int)
  case fetchHomepageProduct
}

extension APIType: UserSession, TargetType {

  var baseURL: URL {
    return URL(string: "https://api-app.shopback.com.tw/")!
  }

  var path: String {
    switch self {
      // Account
      case .checkUniqueAccount: return "members/check-unique"
      case .signInWithEmail: return "members/sign-in"
      case .fetchMemberData: return "members/me"
      // Homepage
      case .fetchHomepageBanner: return "mobile/banners"
      case .fetchHomepageArticle: return "mobile/wordpress-posts"
      case .fetchHomepageProduct: return "mobile-content/v1/components/5dd3b7a0dbaead21d7b0e17d"
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
      case .fetchHomepageBanner, .fetchMemberData:
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
    return [
      "x-shopback-agent": shopbackAgent,
      "x-shopback-key": shopbackKey,
      "x-shopback-client-user-agent": clientUserAgent,
      "x-shopback-domain": shopbackDomain,
    ]
  }

}
