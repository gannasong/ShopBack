//
//  Member.swift
//  ShopBack
//
//  Created by SUNG HAO LIN on 2019/12/19.
//  Copyright © 2019 SUNG HAO LIN. All rights reserved.
//

import Foundation

struct Member: Codable {

  let accountId: Int
  let email: String
  let fullName: String
  var birthday: String?
  let idcardNumber: String?
  let hasPassword: Bool
  let hasFbAuth: Bool
  let hasGoogleAuth: Bool
  let phoneNumbers: [PhoneInfo]
  let postalCode: String?
  let country: String?
  let state: String?
  let city: String?
  let street: String?

  enum MemberCodingKeys: String, CodingKey {
    case accountId = "account_id"
    case email
    case fullName = "full_name"
    case birthday
    case idcardNumber = "idcard_number"
    case hasPassword = "has_password"
    case hasFbAuth = "has_fb_auth"
    case hasGoogleAuth = "has_google_auth"
    case postalCode = "postal_code"
    case country
    case state
    case city
    case street
    case phoneNumbers = "phone_numbers"
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: MemberCodingKeys.self)
    accountId = try container.decode(Int.self, forKey: .accountId)
    email = try container.decode(String.self, forKey: .email)
    fullName = try container.decode(String.self, forKey: .fullName)
    birthday = try? container.decode(String.self, forKey: .birthday)
    idcardNumber = try? container.decode(String.self, forKey: .idcardNumber)
    hasPassword = try container.decode(Bool.self, forKey: .hasPassword)
    hasFbAuth = try container.decode(Bool.self, forKey: .hasFbAuth)
    hasGoogleAuth = try container.decode(Bool.self, forKey: .hasGoogleAuth)
    phoneNumbers = try container.decode([PhoneInfo].self, forKey: .phoneNumbers)
    postalCode = try? container.decode(String.self, forKey: .postalCode)
    country = try? container.decode(String.self, forKey: .country)
    state = try? container.decode(String.self, forKey: .state)
    city = try? container.decode(String.self, forKey: .city)
    street = try? container.decode(String.self, forKey: .street)
  }
}
