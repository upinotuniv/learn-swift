//
//  DetailView.swift
//  CRUD Operation
//
//  Created by PRO M1 2020 8/256 on 05/08/23.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var viewModel: ViewModel
    @Environment(\.presentationMode) var presentationMode
    let item: PostModel
    @State var title = ""
    @State var post = ""
    var body: some View {
        ZStack {
            Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                Text("Create New Post")
                    .font(Font.system(size: 16, weight: .bold))
                TextField("Title", text: $title)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.bottom)
                
                TextField("Write Something", text: $post)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.bottom)
                
                Spacer()
                
            }.padding()
                .onAppear(perform: {
                    self.title = item.title
                    self.post = item.post
                })
        }
        
        .navigationBarTitle("Edit Post", displayMode: .inline)
        .navigationBarItems(trailing: trailing)
    }
    
    var trailing: some View {
        Button(action: {
            if title != "" && post != "" {
                let parameters: [String: Any] = ["id": item.id, "title": title, "post": post]
                viewModel.updatePosts(id: item.id, parameters: parameters)
                viewModel.fetchPosts()
                presentationMode.wrappedValue.dismiss()
            }
        }, label: {
            Text("Save").font(.footnote)
        })
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
