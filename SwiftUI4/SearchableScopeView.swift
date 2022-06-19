//
//  SearchableScopeView.swift
//  SwiftUI4
//
//  Created by sebastiao Gazolla Costa Junior on 19/06/22.
//

import SwiftUI

struct Message:Identifiable, Codable {
    let id:Int
    var user: String
    var text: String
}

enum SearchScope: String, CaseIterable {
    case inbox, favorites
}

struct SearchableScopeView: View {
    @State private var messages = [Message]()
    
    @State private var searchText = ""
    @State private var searchScope = SearchScope.inbox
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(filteredMessages) { message in
                    VStack(alignment: .leading){
                        Text(message.user)
                            .font(.headline)
                        Text(message.text)
                    }
                }
            }
            .searchable(text: $searchText, scope: $searchScope){
                ForEach(SearchScope.allCases, id:\.self) { scope in
                    Text(scope.rawValue.capitalized)
                }
            }
            .navigationTitle("Messages")
        }
        .onSubmit (of: .search, runSearch)
        .onChange(of: searchScope) { _ in runSearch() }
    }
    
    func runSearch(){
        
    }
    
    var filteredMessages:[Message]{
        if searchText.isEmpty {
            return messages
        } else {
            return messages.filter { $0.text.localizedCaseInsensitiveContains(searchText)}
        }
    }
}

struct SearchableScopeView_Previews: PreviewProvider {
    static var previews: some View {
        SearchableScopeView()
    }
}
