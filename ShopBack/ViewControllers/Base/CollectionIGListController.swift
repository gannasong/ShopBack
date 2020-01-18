//
//  CollectionIGListController.swift
//  ShopBack
//
//  Created by SUNG HAO LIN on 2019/12/19.
//  Copyright © 2019 SUNG HAO LIN. All rights reserved.
//

import Foundation
import IGListKit
import RxSwift
import RxCocoa
import SnapKit

class CollectionIGListController: UIViewController, BaseCollectionIGListController {

  lazy var adapter: ListAdapter = {
    ListAdapter(updater: ListAdapterUpdater(), viewController: self, workingRangeSize: 1)
  }()

  lazy var collectionView: UICollectionView = {
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
    flowLayout.minimumLineSpacing = 10
    flowLayout.minimumInteritemSpacing = 10
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    collectionView.isPrefetchingEnabled = false
    collectionView.contentInsetAdjustmentBehavior = .never
    collectionView.alwaysBounceVertical = true
    return collectionView
  }()

  // MARK: - Initialization

  init() {
    super.init(nibName: nil, bundle: nil)
  }

  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }

  // MARK: - UIViewController

  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
    adapter.collectionView = collectionView
    adapter.dataSource = self
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    // Deselected the cell in collectionView
    collectionView.selectItem(at: nil, animated: animated, scrollPosition: [])
  }

  func adjustCollectionContentTopInset(with topInset: CGFloat) {
    collectionView.contentInset = UIEdgeInsets(top: topInset, left: 0, bottom: 0, right: 0)
  }

  // MARK: - Private Methods

  private func setupViews() {
    collectionView.backgroundColor = .tertiarySystemBackground
    collectionView.frame = view.bounds
    collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    collectionView.collectionViewLayout = UICollectionViewFlowLayout()
    view.addSubview(collectionView)
  }

}

// MARK: - ListAdapterDataSource

extension CollectionIGListController: ListAdapterDataSource {
  func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
    return []
  }

  func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
    return ListSectionController()
  }

  func emptyView(for listAdapter: ListAdapter) -> UIView? {
    return UIView()
  }
}
