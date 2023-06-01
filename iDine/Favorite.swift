//
//  Favorite.swift
//  iDine
//
//  Created by Nicholas Gilbert on 5/22/23.
//

import SwiftUI

class Favorite: ObservableObject {
    @Published var favorites = [MenuItem]()
    
    func add(favorite: MenuItem) {
        if favorites.contains(favorite) {
            return
        } else {
            favorites.append(favorite)
        }
        
    }
}
