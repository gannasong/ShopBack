//
//  Amount.swift
//  ShopBack
//
//  Created by SUNG HAO LIN on 2020/1/20.
//  Copyright © 2020 SUNG HAO LIN. All rights reserved.
//

import Foundation

class Amount: Codable {
  let cashbacks: [CashbackItem]
  var totalAmounts: Double = 0.00

  enum AmountCodingKey: String, CodingKey {
    case cashbacks
  }

  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: AmountCodingKey.self)
    cashbacks = try container.decode([CashbackItem].self, forKey: .cashbacks)
  }
}
