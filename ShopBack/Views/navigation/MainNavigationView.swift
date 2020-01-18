//
//  MainNavigationView.swift
//  ShopBack
//
//  Created by Min on 2019/12/19.
//  Copyright © 2019 SUNG HAO LIN. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

class MainNavigationView: UIView {

  private let disposeBag = DisposeBag()

  lazy var searchInputTextField: MainSearchTextField = {
    return MainSearchTextField()
  }()

  lazy var profileButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle(nil, for: .normal)
    button.setImage("Main_profile_naviIcon".toImage, for: .normal)
    button.imageView?.contentMode = .scaleAspectFit
    let space: CGFloat = 6
    button.imageEdgeInsets = UIEdgeInsets(top: space, left: space, bottom: space, right: space)
    return button
  }()

  lazy var notifyButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle(nil, for: .normal)
    button.setImage("Main_notify_naviIcon".toImage, for: .normal)
    button.imageView?.contentMode = .scaleAspectFit
    let space: CGFloat = 6
    button.imageEdgeInsets = UIEdgeInsets(top: space, left: space, bottom: space, right: space)
    return button
  }()

  // MARK: - Initialization

  init() {
    super.init(frame: .zero)
    setupViews()
    setUpObservers()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupViews()
    setUpObservers()
  }

  // MARK: - Private Methods

  private func setupViews() {
    backgroundColor = .clear
    addSubview(notifyButton)
    addSubview(profileButton)
    addSubview(searchInputTextField)

    notifyButton.snp.makeConstraints {
      $0.right.equalTo(self.snp.right)
      $0.height.equalToSuperview()
      $0.width.equalTo(34)
    }

    profileButton.snp.makeConstraints {
      $0.right.equalTo(notifyButton.snp.left)
      $0.height.equalToSuperview()
      $0.width.equalTo(34)
    }

    searchInputTextField.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.right.equalTo(profileButton.snp.left).offset(-2)
      $0.left.equalToSuperview()
      $0.top.equalToSuperview().offset(6)
      $0.bottom.equalToSuperview().offset(-6)
    }
  }

  private func setUpObservers() {
    // 這邊應該是 ShopBack app 行為應該是點擊 textfiled 後跳 child viewController
    // 因為按取消是被 dismiss 掉

//    searchInputTextField.rx
//      .controlEvent(.editingDidBegin)
//      .map { true }
//      .subscribe(onNext: { [weak self] result in
//        self?.profileButton.isHidden = result
//        self?.notifyButton.isHidden = result
//        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.3, delay: 0, animations: {
//          self?.searchInputTextField.isBeginEditing = result
//          self?.searchInputTextField.snp.updateConstraints({ make in
//            make.width.equalTo(self?.bounds.width ?? 0)
//          })
//          self?.layoutIfNeeded()
//        })
//        if let clearButton = self?.searchInputTextField.value(forKey: "_clearButton") as? UIButton {
//          clearButton.setImage("Main_searchBar_clearIcon".toImage, for: .normal)
//          clearButton.setImage("Main_searchBar_clearIcon".toImage, for: .highlighted)
//          clearButton.imageView?.contentMode = .scaleAspectFill
//          let space: CGFloat = 2
//          clearButton.imageEdgeInsets = UIEdgeInsets(top: space, left: space, bottom: space, right: space)
//        }
//      }).disposed(by: disposeBag)

//    searchInputTextField.rx
//      .controlEvent(.editingDidEnd)
//      .subscribe(onNext: { [weak self] in
//        guard let strongSelf = self, let searchText = strongSelf.searchInputTextField.text, searchText.isEmpty else { return }
////        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.3, delay: 0, animations: {
////          self?.searchInputTextField.isBeginEditing = false
////          self?.searchInputTextField.snp.updateConstraints({
////            $0.width.equalTo(280)
////          })
////          self?.layoutIfNeeded()
////        }, completion: { _ in
////          self?.profileButton.isHidden = false
////          self?.notifyButton.isHidden = false
////        })
//      }).disposed(by: disposeBag)
  }
}
