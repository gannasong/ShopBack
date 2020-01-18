//
//  Banner.swift
//  ShopBack
//
//  Created by SUNG HAO LIN on 2019/12/19.
//  Copyright © 2019 SUNG HAO LIN. All rights reserved.
//

import Foundation
import IGListKit

class Banner: Codable {
  let id: Int
  let object: String?
  let objectId: String?
  let desktopImage: URL?
  let mobileImage: URL?
  let mobileAppImage: URL?
  let position: Int
  let type: String
  let url: String

  enum BannerCodingKeys: String, CodingKey {
    case id
    case object
    case objectId = "object_id"
    case desktopImage = "desktop_image"
    case mobileImage = "mobile_image"
    case mobileAppImage = "mobile_app_image"
    case position
    case type
    case url
  }

  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: BannerCodingKeys.self)
    id = try container.decode(Int.self, forKey: .id)
    object = try? container.decode(String.self, forKey: .object)
    objectId = try? container.decode(String.self, forKey: .objectId)
    desktopImage = try? container.decode(URL.self, forKey: .desktopImage)
    mobileImage = try? container.decode(URL.self, forKey: .mobileImage)
    mobileAppImage = try? container.decode(URL.self, forKey: .mobileAppImage)
    position = try container.decode(Int.self, forKey: .position)
    type = try container.decode(String.self, forKey: .type)
    url = try container.decode(String.self, forKey: .url)
  }
}

// MARK: - ListDiffable

extension Banner: ListDiffable {
  func diffIdentifier() -> NSObjectProtocol {
    return id as NSObjectProtocol
  }

  func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    guard let banner = object as? Banner else { return false }
    return position == banner.position
      && type == banner.type
      && url == banner.url
  }
}
