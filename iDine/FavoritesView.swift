//
//  FavoritesView.swift
//  iDine
//
//  Created by Nicholas Gilbert on 5/22/23.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favorite: Favorite
    var body: some View {
        NavigationStack {
            List {
                ForEach(favorite.favorites) { fav in
                    Text(fav.name)
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("Favorite Items")
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        favorite.favorites.remove(atOffsets: offsets)
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView().environmentObject(Favorite())
    }
}
