//
//  APIManager+Account.swift
//  ShopBack
//
//  Created by SUNG HAO LIN on 2019/12/18.
//  Copyright © 2019 SUNG HAO LIN. All rights reserved.
//

import Foundation
import Moya
import RxSwift

extension APIManager {
  // If user's account is exist should return false
  func isUniqueAccount(with email: String) -> Observable<Bool> {
    return Observable.create { [weak self] (observer) -> Disposable in
      _ = self?.provider.rx.request(.checkUniqueAccount(email: email))
        .asObservable()
        .mapJSON()
        .subscribe(onNext: { (res) in
          var isUnique: Bool = true
          if let json = res as? [String: Any], let error = json["error"] as? [String: Any], let message = error["message"] as? String {
            #if DEBUG
              print("message: \(message)")
            #endif
            isUnique = !(message == "duplicated email")
            observer.onNext(isUnique)
          } else {
            observer.onNext(isUnique)
          }

          UserDefaults.standard.set(email, forKey: UserDefaultsEmailKey)
          observer.onCompleted()
        }, onError: { (error) in
          observer.onError(error)
        })
      return Disposables.create()
    }
  }

  func signInWithEmail(password: String) -> Observable<AuthTokens> {
    return provider.rx.request(.signInWithEmail(password: password))
      .asObservable()
      .filterSuccessfulStatusCodes()
      .map(AuthTokens.self)
  }
}
