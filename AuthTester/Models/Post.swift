//
//  Post.swift
//  Post
//
//  Created by Ben Stone on 8/9/21.
//


import Foundation
import FirebaseFirestore

struct Post: FirebaseConvertable {
  let title: String
  let author: String
  let text: String
  let id: UUID
  let timestamp: Date

  init(title: String, text: String, author: String) {
    self.title = title
    self.author = author
    self.text = text
    self.id = UUID()
    self.timestamp = Date()
  }
  static let testPost = Post(title: "Title", text: "Content", author: "First Last")
}

protocol FirebaseConvertable: Codable {
  init(from jsonDict: [String: Any])
  var jsonDict: [String: Any] { get }
}

extension FirebaseConvertable {
  init(from jsonDict: [String: Any]) {
    let data = try! JSONSerialization.data(withJSONObject: jsonDict)
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .secondsSince1970
    self = try! decoder.decode(Self.self, from: data)
    // let newInstance = try! JSONDecoder().decode(Self.self, from: data)
    // self = newInstance
  }
  var jsonDict: [String: Any] {
    let encoder = JSONEncoder()
    encoder.dateEncodingStrategy = .secondsSince1970
    let data = try! encoder.encode(self)
    let jsonObject = try! JSONSerialization.jsonObject(with: data)
    return jsonObject as! [String: Any]
  }
}

@available(iOS 15.0.0, *)
struct PostService {
  static var postsReference: CollectionReference {
    let db = Firestore.firestore()
    return db.collection("posts")
  }

  static func getPosts() async throws -> [Post] {
    let postsSnapshots = try await postsReference.getDocuments()
    let posts = postsSnapshots.documents.map { Post(from: $0.data()) }
    return posts
  }

  static func upload(_ post: Post) async throws {
    try await postsReference.document(post.id.uuidString).setData(post.jsonDict)
  }
}

