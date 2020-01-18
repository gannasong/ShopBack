//
//  PhoneInfo.swift
//  ShopBack
//
//  Created by SUNG HAO LIN on 2019/12/19.
//  Copyright © 2019 SUNG HAO LIN. All rights reserved.
//

import Foundation

struct PhoneInfo: Codable {
  let countryCode: String
  let number: String
  let primary: Bool
  let verified: Bool

  enum PhoneInfoCodingKey: String, CodingKey {
    case countryCode = "country_code"
    case number
    case primary
    case verified
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: PhoneInfoCodingKey.self)
    countryCode = try container.decode(String.self, forKey: .countryCode)
    number = try container.decode(String.self, forKey: .number)
    primary = try container.decode(Bool.self, forKey: .primary)
    verified = try container.decode(Bool.self, forKey: .verified)
  }
}
