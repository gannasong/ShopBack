//
//  Product.swift
//  ShopBack
//
//  Created by SUNG HAO LIN on 2019/12/22.
//  Copyright © 2019 SUNG HAO LIN. All rights reserved.
//

import Foundation
import IGListKit

class Product: Codable {
  let id: String
  let dealId: Int
  let voucherCode: String
  let voucherDesc: String
  let productUrl: URL?
  let type: String
  let merchantId: Int
  let merchantName: String
  let logoUrl: URL?
  let cashback: Cashback
  let oldPrice: String
  let newPrice: String
  let offerText: String
  let endDate: String?

  enum ProductCodingKeys: String, CodingKey {
    case id
    case dealId
    case voucherCode
    case voucherDesc
    case productUrl
    case type
    case merchantId
    case merchantName
    case logoUrl
    case cashback
    case oldPrice
    case newPrice
    case offerText
    case endDate
  }

  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: ProductCodingKeys.self)
    id = try container.decode(String.self, forKey: .id)
    dealId = try container.decode(Int.self, forKey: .dealId)
    voucherCode = try container.decode(String.self, forKey: .voucherCode)
    voucherDesc = try container.decode(String.self, forKey: .voucherDesc)
    productUrl = try? container.decode(URL.self, forKey: .productUrl)
    type = try container.decode(String.self, forKey: .type)
    merchantId = try container.decode(Int.self, forKey: .merchantId)
    merchantName = try container.decode(String.self, forKey: .merchantName)
    logoUrl = try? container.decode(URL.self, forKey: .logoUrl)
    cashback = try container.decode(Cashback.self, forKey: .cashback)
    oldPrice = try container.decode(String.self, forKey: .oldPrice)
    newPrice = try container.decode(String.self, forKey: .newPrice)
    offerText = try container.decode(String.self, forKey: .offerText)
    endDate = try? container.decode(String.self, forKey: .endDate)
  }
}

struct Cashback: Codable {
  let amount: String
  let description: String
  let modifier: String
  let sign: String
}
