//
//  APIManager+Cashbacks.swift
//  ShopBack
//
//  Created by SUNG HAO LIN on 2020/1/20.
//  Copyright © 2020 SUNG HAO LIN. All rights reserved.
//

import Foundation
import RxSwift

extension APIManager {
  func fetchCashbackAmounts() -> Observable<Amount> {
    return provider.rx.request(.fetchCashbackAmounts)
      .asObservable()
      .filterSuccessfulStatusCodes()
      .map(Amount.self, atKeyPath: Keys.data.rawValue)
      .calculateTotalAmounts()
  }
}

private extension Observable {
  func calculateTotalAmounts() -> Observable<Amount> {
    return map { (object) -> Amount in
      guard let amount = object as? Amount else {
        fatalError("💥 Calculate total amounts fail")
      }

      amount.cashbacks.forEach { (item) in
        let itemAmount = (item.amount as NSString).doubleValue
        amount.totalAmounts += itemAmount
      }

      #if DEBUG
      print("Calculate user total amounts: \(amount.totalAmounts)")
      #endif
      return amount
    }
  }
}
