//
//  Trip.swift
//  ShopBack
//
//  Created by SUNG HAO LIN on 2020/1/20.
//  Copyright © 2020 SUNG HAO LIN. All rights reserved.
//

import Foundation
import IGListKit

class Trip: Codable {
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
  let originalCashback: Cashback?
  let endDate: String?

  enum TripCodingKey: String, CodingKey {
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
    case originalCashback
    case endDate
  }

  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: TripCodingKey.self)
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
    originalCashback = try? container.decode(Cashback.self, forKey: .originalCashback)
    endDate = try? container.decode(String.self, forKey: .endDate)
  }
}

// MARK: - ListDiffable

extension Trip: ListDiffable {
  func diffIdentifier() -> NSObjectProtocol {
    return id as NSObjectProtocol
  }

  func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    guard let trip = object as? Trip else { return false }
    return id == trip.id
      && dealId == trip.dealId
      && voucherDesc == trip.voucherDesc
      && merchantId == trip.merchantId
  }
}
