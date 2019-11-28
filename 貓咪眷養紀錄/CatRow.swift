//
//  CatRow.swift
//  貓咪眷養紀錄
//
//  Created by User16 on 2019/11/28.
//  Copyright © 2019 00657018. All rights reserved.
//

import SwiftUI

struct CatRow: View {
    
    var pet: Pet

    var body: some View {
        HStack {
            Image(systemName: pet.Mark ? "mappin.and.ellipse" : "")
            Image(pet.Variety)
            .renderingMode(.original)
            .resizable()
            .scaledToFill()
            .frame(width:50, height: 50)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 3))
            .shadow(radius: 10)
            Text("大名:\(pet.name), 品種:\(pet.Variety)")
            Image(pet.Gender ? "male" : "female")
            Spacer()
            Text("\(pet.weight) kg")
        }
    }
}

struct CatRow_Previews: PreviewProvider {
    static var previews: some View {
        CatRow(pet: Pet(Mark: true, name: "penny", Variety: "暹羅貓", Gender: true, weight: 3))
    }
}
