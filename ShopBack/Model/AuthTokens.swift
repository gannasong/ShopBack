//
//  AuthTokens.swift
//  ShopBack
//
//  Created by SUNG HAO LIN on 2019/12/18.
//  Copyright © 2019 SUNG HAO LIN. All rights reserved.
//

import Foundation

struct AuthTokens: Codable {
  // Auth
  let authAccessToken: String
  let authTokenType: String
  let authExpiresIn: Int
  let authRefreshToken: String

  // UserTokens
  let userAccessToken: Token
  let userRefreshToken: Token

  let id: Int
  let uuid: String

  enum AuthTokensKeys: String, CodingKey {
    case id
    case uuid
    case auth
    case userTokens
  }

  enum AuthCodingKeys: String, CodingKey {
    case tokenType = "token_type"
    case accessToken = "access_token"
    case refreshToken = "refresh_token"
    case expiresIn = "expires_in"
  }

  enum UserCodingKeys: String, CodingKey {
    case accessToken
    case refreshToken
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: AuthTokensKeys.self)
    id = try container.decode(Int.self, forKey: .id)
    uuid = try container.decode(String.self, forKey: .uuid)

    let auth = try container.nestedContainer(keyedBy: AuthCodingKeys.self, forKey: .auth)
    authAccessToken = try auth.decode(String.self, forKey: .accessToken)
    authTokenType = try auth.decode(String.self, forKey: .tokenType)
    authRefreshToken = try auth.decode(String.self, forKey: .refreshToken)
    authExpiresIn = try auth.decode(Int.self, forKey: .expiresIn)

    let userTokens = try container.nestedContainer(keyedBy: UserCodingKeys.self, forKey: .userTokens)
    userAccessToken = try userTokens.decode(Token.self, forKey: .accessToken)
    userRefreshToken = try userTokens.decode(Token.self, forKey: .refreshToken)
  }

}

struct Token: Codable {
  let id: String
  let expiration: Int
}
