//
//  HomepageViewModel.swift
//  ShopBack
//
//  Created by SUNG HAO LIN on 2019/12/19.
//  Copyright © 2019 SUNG HAO LIN. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import IGListKit

final class HomepageViewModel: NSObject {

  private let disposeBag = DisposeBag()
  private var sectionRequest: Observable<[Story]> = Observable.empty()
  let items = BehaviorRelay<[Story]>(value: [])

  // MARK: - Initialization

  override init() {
    super.init()
    setupObservers()
  }

  // MARK: - Private Methods

  private func setupObservers() {
    let bannerRequest = APIManager.shared.fetchHomepageBanner()
    let articlesRequest = APIManager.shared.fetchHomepageArticle()
    let productRequest = APIManager.shared.fetchHomepageProduct()
    sectionRequest = Observable.zip(bannerRequest, articlesRequest, productRequest) { [$0, $1, $2] }
  }
}

// MARK: - ViewModelType

extension HomepageViewModel: ViewModelType {

  struct Input {
    let fetchContentTrigger: Observable<Void>
  }

  struct Output {
    let loadError: PublishSubject<Error>
  }

  func transform(input: Input) -> Output {
    let loadError = PublishSubject<Error>()

    input.fetchContentTrigger.flatMapLatest { (_) -> Observable<[Story]> in
      return self.sectionRequest
    }
      .bind(to: items)
      .disposed(by: disposeBag)
    return Output(loadError: loadError)
  }
}
