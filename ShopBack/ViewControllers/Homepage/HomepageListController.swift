//
//  HomepageListController.swift
//  ShopBack
//
//  Created by SUNG HAO LIN on 2019/12/19.
//  Copyright © 2019 SUNG HAO LIN. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import IGListKit

class HomepageListController: CollectionIGListController {

  private let disposeBag = DisposeBag()
  private var viewModel: HomepageViewModel?
  private let fetchContentTrigger = PublishSubject<Void>()

  // MARK: - Initialization

  override init() {
    super.init()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }

  // MARK: - UIViewController

  override func viewDidLoad() {
    super.viewDidLoad()
    adjustCollectionContentTopInset(with: (44 + 10))
    viewModel = HomepageViewModel()
    bindViewModel()
    // 模擬使用者登入，這樣才能接續拿到合法的 token 去打 API
    loginShopBackTestAccount()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("Run Trigger !!!")
    fetchContentTrigger.onNext(())
  }

  // MARK: - Private Methods

  private func loginShopBackTestAccount() {
    // 推上 github 上傳前記得清掉
    UserDefaults.standard.set("shopbackdemo@email5.net", forKey: UserDefaultsEmailKey)
    APIManager.shared.signInWithEmail(password: "shopback6666")
      .asObservable()
      .subscribe(onNext: { (authToken) in
        AccountManager.shared.setAuthTokens(with: authToken)
        _ = APIManager.shared.fetchMemberData()
      }, onError: { (error) in
        print("error: \(error.localizedDescription)")
      }).disposed(by: disposeBag)
  }

  private func bindViewModel() {
    viewModel?.items
      .subscribe(onNext: { [weak self] _ in
        self?.adapter.performUpdates(animated: true, completion: nil)
      }).disposed(by: disposeBag)

    let input = HomepageViewModel.Input(fetchContentTrigger: fetchContentTrigger)
    let output = viewModel?.transform(input: input)

    output?.loadError
      .asObservable()
      .subscribe(onNext: { (error) in
        print(">>>>> loadError: \(error.localizedDescription)")
      }).disposed(by: disposeBag)
  }
}

// MARK: - ListAdapterDataSource

extension HomepageListController {

  override func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
    guard let items = viewModel?.items.value else { return [] }
    // 這邊會拿到首頁每一個 section 的資料 -> [ShopBack.Story, ShopBack.Story]
    print("Homepage items: \(items)")
    return items
  }

  override func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
    let storyType = TypeHelper.convertToStoryType(byStory: object)

    // 這邊會根據 [ShopBack.Story, ShopBack.Story] 裡面每一個 Story type 去 return 對應的 sectionController
    print("Homepage type: \(storyType)")
    switch storyType {
      case .product:
        return VerticalSectionController()
      case .article:
        return HorizontalSectionViewController()
      default:
        return ListSectionController()
    }
  }
}
