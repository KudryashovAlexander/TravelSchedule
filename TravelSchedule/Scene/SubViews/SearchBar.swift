//
//  SearchBar.swift
//  SwiftUIProject
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var searchText: String
    @State var isSearching: Bool = false
    var placeholder = L.CheckCity.addRequest
    
    var body: some View {
            HStack (spacing: 0) {
                HStack (spacing: 0) {
                    HStack {
                        TextField(placeholder, text: $searchText)
                            .font(.system(size: 17))
                            .padding(.leading, 8)
                            .autocorrectionDisabled(true)
                            .autocapitalization(.none)
                    }
                    .padding()
                    .cornerRadius(16)
                    .padding(.horizontal)
                    .onTapGesture(perform: {
                        isSearching = true
                    })
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .frame(width: 17, height: 17)
                                .foregroundColor(.tsGray)
                            
                            Spacer()
                            
                            if isSearching && searchText.count > 0 {
                                Button(action: { searchText = "" }, label: {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.tsGray)
                                        .padding(.vertical)
                                })
                                
                            }
                            
//                            if isSearching {
//                                Button(action: {
//                                    isSearching = false
//                                    searchText = ""
//                                    
//                                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
//                                    
//                                }, label: {
//                                    Image(systemName: "xmark.circle.fill")
//                                        .resizable()
//                                        .frame(width: 18, height: 18)
//                                        .scaledToFill()
//                                        .foregroundColor(.tsGray)
//                                })
//                            }
                            
                        }.padding(.horizontal, 10)
                            .foregroundColor(.gray)
                    )
                }
                .frame(height: 37)
                .background(Color.tsLightGray.opacity(0.24))
                .cornerRadius(10)
            }
        .frame(height: 37)
        .padding(.horizontal, 16)
    }
}

#Preview {
    @State var text: String = ""
    return SearchBar(searchText: $text)
}
