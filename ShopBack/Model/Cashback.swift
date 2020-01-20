//
//  Cashback.swift
//  ShopBack
//
//  Created by SUNG HAO LIN on 2020/1/20.
//  Copyright © 2020 SUNG HAO LIN. All rights reserved.
//

import Foundation

struct CashbackItem: Codable {
  let id: Int
  let uuid: String
  let shoppingtripUuid: String?
  let name: String
  let amount: String
  let points: Int
  let orderId: String
  let orderDate: String
  let availableByDate: String?
  let additionalInformation: String
  let userStatus: String
  let enquiredDate: String?
  let displayRedeemable: String?
  let affiliateType: String
  let affiliateNetwork: String

  enum CashbackItemCodingKeys: String, CodingKey {
    case id
    case uuid
    case shoppingtripUuid
    case name
    case amount
    case points
    case orderId
    case orderDate
    case availableByDate
    case additionalInformation
    case userStatus
    case enquiredDate
    case displayRedeemable
    case affiliateType
    case affiliateNetwork
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CashbackItemCodingKeys.self)
    id = try container.decode(Int.self, forKey: .id)
    uuid = try container.decode(String.self, forKey: .uuid)
    shoppingtripUuid = try? container.decode(String.self, forKey: .shoppingtripUuid)
    name = try container.decode(String.self, forKey: .name)
    amount = try container.decode(String.self, forKey: .amount)
    points = try container.decode(Int.self, forKey: .points)
    orderId = try container.decode(String.self, forKey: .orderId)
    orderDate = try container.decode(String.self, forKey: .orderDate)
    availableByDate = try? container.decode(String.self, forKey: .availableByDate)
    additionalInformation = try container.decode(String.self, forKey: .additionalInformation)
    userStatus = try container.decode(String.self, forKey: .userStatus)
    enquiredDate = try? container.decode(String.self, forKey: .enquiredDate)
    displayRedeemable = try? container.decode(String.self, forKey: .displayRedeemable)
    affiliateType = try container.decode(String.self, forKey: .affiliateType)
    affiliateNetwork = try container.decode(String.self, forKey: .affiliateNetwork)
  }
}
