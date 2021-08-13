//
//  PostData.swift
//  PostData
//
//  Created by Ben Stone on 8/9/21.
//

import Foundation

@available(iOS 15.0, *)
@MainActor class PostData: ObservableObject {
    @Published var posts: [Post] = []
    
  init() {
        Task {
            await loadPosts()
        }
    }
  
    func loadPosts() async {
        do {
            let posts = try await PostService.getPosts()
            self.posts = posts
        }
        catch {
            print(error)
        }
    }
  
}
