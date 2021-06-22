//
//  ContentView.swift
//  HIcky
//
//  Created by Arpit Dixit on 22/06/21.
//

import SwiftUI

struct HikingList: View {
    let hikes = Hike.all()
    var body: some View {
        NavigationView(content: {
            List(hikes, id: \.name) { hike in
                NavigationLink(
                    destination: HikingDetail(hike: hike),
                    label: {
                        HikeCell(hike: hike)
                    })
            }
            .navigationTitle("Hikings")
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HikingList()
    }
}

struct HikeCell: View {
    let hike: Hike
    var body: some View {
        HStack(content: {
            Image(hike.imageURL)
                .resizable()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                .cornerRadius(16)
            VStack(alignment: .leading, spacing: 0, content: {
                Text(hike.name)
                    .font(.title3)
                    .foregroundColor(.primary)
                    .padding(4)
                Text(String(format: "%.2f miles", hike.miles))
                    .font(.body)
                    .foregroundColor(.secondary)
                    .padding(4)
            })
        })
    }
}
