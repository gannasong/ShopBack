//
//  BaseCollectionIGListController.swift
//  ShopBack
//
//  Created by SUNG HAO LIN on 2019/12/19.
//  Copyright © 2019 SUNG HAO LIN. All rights reserved.
//

import Foundation
import IGListKit

protocol BaseCollectionIGListController: class {
  var adapter: ListAdapter { get set }
  var collectionView: UICollectionView { get set }
}

extension BaseCollectionIGListController {

}
