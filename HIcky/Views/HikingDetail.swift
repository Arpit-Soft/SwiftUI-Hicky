//
//  HikingDetail.swift
//  HIcky
//
//  Created by Arpit Dixit on 22/06/21.
//

import SwiftUI

struct HikingDetail: View {
    let hike: Hike
    @State private var zoomed: Bool = false
    var body: some View {
        VStack(content: {
            Image(hike.imageURL)
                .resizable()
                .aspectRatio(contentMode: zoomed ? .fill : .fit)
                .onTapGesture {
                    withAnimation {
                        zoomed.toggle()
                    }
                }
            Text(hike.name)
                .font(.title)
                .foregroundColor(.primary)
                .padding(5)
            Text(String(format: "%.2f miles", hike.miles))
                .font(.body)
                .foregroundColor(.secondary)
        })
    }
}

struct HikingDetail_Previews: PreviewProvider {
    static var previews: some View {
        HikingDetail(hike: Hike(name: "Kings Landing", imageURL: "sal", miles: 10.0))
    }
}
