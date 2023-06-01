//
//  ItemDetail.swift
//  iDine
//
//  Created by Nicholas Gilbert on 5/15/23.
//

import SwiftUI

struct ItemDetail: View {
    @EnvironmentObject var order: Order
    @EnvironmentObject var favorite: Favorite
    let item: MenuItem
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            Text(item.description)
                .padding()
            Button("Order This") {
                order.add(item: item)
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
            .font(.title2)
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button {
                favorite.add(favorite: item)
            } label: {
                Image(systemName: "star")
            }
        }
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ItemDetail(item: MenuItem.example)
                .environmentObject(Order())
                .environmentObject(Favorite())
        }
    }
}
