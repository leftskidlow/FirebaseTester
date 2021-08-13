//
//  PostView.swift
//  PostView
//
//  Created by Ben Stone on 8/9/21.
//

import SwiftUI

@available(iOS 15.0, *)
struct PostRow: View {
    let post: Post
  @EnvironmentObject var signInViewModel: SignInViewModel
  @ObservedObject var postData: PostData
    var body: some View {
        VStack {
            Text(post.title)
                .font(.largeTitle)
                .padding()
            Text(post.text)
                .font(.body)
                .padding()
          HStack {
            Text(post.author)
              .padding()
            Button {
              if post.author == signInViewModel.getUser() {
                Task {
                  do {
                    try await PostService.delete(post)
                  }
                  catch {
                    print(error)
                  }
                  await postData.loadPosts()
                }
              }
            } label: {
              Text("Delete Post")
            }
          }
        }
    }
}

@available(iOS 15.0, *)
struct PostRow_Previews: PreviewProvider {
    static var previews: some View {
      PostRow(post: Post.testPost, postData: PostData())
    }
}
