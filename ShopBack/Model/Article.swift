//
//  Article.swift
//  ShopBack
//
//  Created by SUNG HAO LIN on 2019/12/20.
//  Copyright © 2019 SUNG HAO LIN. All rights reserved.
//

import Foundation
import IGListKit

final class Article: Codable {
  let id: Int
  let postDate: String
  let postAuthor: Int
  let postAuthorName: String
  let postTitle: String
  let postExcerpt: String
  let postName: String
  let postType: String
  let postUrl: URL?
  let postImage: URL?

  enum ArticleCodingKeys: String, CodingKey {
    case id
    case postDate
    case postAuthor
    case postAuthorName
    case postTitle
    case postExcerpt
    case postName
    case postType
    case postUrl
    case postImage
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: ArticleCodingKeys.self)
    id = try container.decode(Int.self, forKey: .id)
    postDate = try container.decode(String.self, forKey: .postDate)
    postAuthor = try container.decode(Int.self, forKey: .postAuthor)
    postAuthorName = try container.decode(String.self, forKey: .postAuthorName)
    postTitle = try container.decode(String.self, forKey: .postTitle)
    postExcerpt = try container.decode(String.self, forKey: .postExcerpt)
    postName = try container.decode(String.self, forKey: .postName)
    postType = try container.decode(String.self, forKey: .postType)
    postUrl = try? container.decode(URL.self, forKey: .postUrl)
    postImage = try? container.decode(URL.self, forKey: .postImage)
  }
}

// MARK: - ListDiffable

extension Article: ListDiffable {
  func diffIdentifier() -> NSObjectProtocol {
    return id as NSObjectProtocol
  }

  func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    guard let article = object as? Article else { return false }
    return postAuthor == article.postAuthor
      && postTitle == article.postTitle
      && postExcerpt == article.postExcerpt
  }
}
