//
//  AccountManager.swift
//  ShopBack
//
//  Created by SUNG HAO LIN on 2019/12/18.
//  Copyright © 2019 SUNG HAO LIN. All rights reserved.
//

import Foundation

class AccountManager: NSObject {

  // TODO: 這邊用來記錄使用者的相關資訊
  // 使用 Userdefault 去紀錄

  static let shared = AccountManager()

  // MARK: - Public Properties

  func email() -> String {
    return UserDefaults.standard.string(forKey: UserDefaultsEmailKey) ?? ""
  }

  func userAccessToken() -> String {
    return UserDefaults.standard.string(forKey: UserDefaultsUserAccessTokenKey) ?? ""
  }

  func authAccessToken() -> String {
    return UserDefaults.standard.string(forKey: UserDefaultsAuthAccessTokenKey) ?? ""
  }

  // MARK: - Set Account Properties

  func setAuthTokens(with authTokens: AuthTokens) {
    UserDefaults.standard.set(authTokens.authAccessToken, forKey: UserDefaultsAuthAccessTokenKey)
    UserDefaults.standard.set(authTokens.userAccessToken.id, forKey: UserDefaultsUserAccessTokenKey)
  }
}
