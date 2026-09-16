//
//  SearchBarView.swift
//  Cryptic
//
//  Created by Saverio Negro on 9/16/26.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    var isSearchTextEmpty: Bool {
        return searchText.isEmpty
    }
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(
                    isSearchTextEmpty ? Color.theme.secondaryText : Color.theme.accent
                )
            
            TextField("Search by name or symbol", text: $searchText)
                .autocorrectionDisabled()
                .foregroundStyle(Color.theme.accent)
                .overlay(alignment: .trailing) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(Color.theme.accent)
                        .padding()
                        .opacity(
                            isSearchTextEmpty ? 0 : 1
                        )
                        .rotationEffect(
                            isSearchTextEmpty ?
                                .degrees(0) : .degrees(360)
                        )
                        .offset(x: 10)
                        .onTapGesture {
                            UIApplication.shared.endEditing()
                            searchText = ""
                        }
                        .animation(.spring(duration: 0.8), value: isSearchTextEmpty)
                }
                
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.theme.background)
                .shadow(
                    color: Color.theme.accent.opacity(0.15),
                    radius: 10,
                    x: 0,
                    y: 0
                )
        )
        .padding()
    }
}

#Preview("SearchBarView: Light Mode", traits: .sizeThatFitsLayout) {
    SearchBarView(searchText: .constant(""))
        .preferredColorScheme(.light)
}

#Preview("SearchBarView: Dark Mode", traits: .sizeThatFitsLayout) {
    SearchBarView(searchText: .constant(""))
        .preferredColorScheme(.dark)
}

//struct SearchBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchBarView()
//    }
//}
