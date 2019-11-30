//
//  CatEditor.swift
//  貓咪眷養紀錄
//
//  Created by User16 on 2019/11/28.
//  Copyright © 2019 00657018. All rights reserved.
//

import SwiftUI

struct CatEditor: View {
    
    @Environment(\.presentationMode) var presentationMode
    var catsData: CatsData
    var varietys = ["暹羅貓", "加菲貓", "狸花貓", "黑貓", "白貓", "折耳貓", "英短貓", "美短貓", "波斯貓"]
    @State private var Mark = true
    @State private var name = ""
    @State private var Variety = "暹羅貓"
    @State private var Gender = true
    @State private var weight = 3
    @State private var pickupTime = Date()
    let dateFormatter: DateFormatter = {
       let dateFormatter = DateFormatter()
       dateFormatter.dateStyle = .medium
       dateFormatter.timeStyle = .medium
       return dateFormatter
    }()
    var editCat: Pet?
    
    var body: some View {
        Form {
            Toggle("Mark it up?", isOn: $Mark)
            Text("輸入名字 or 綽號 :")
            TextField("名字", text: $name)
            .font(.largeTitle)
            .overlay(RoundedRectangle(cornerRadius:20).stroke(Color.black, lineWidth: 5))
            .frame(width: 380, height: 50)
            .multilineTextAlignment(.center)
            Picker(selection: $Variety, label: Text("選擇品種")) {
               ForEach(varietys, id: \.self) { (variety) in
                  Text(variety)
               }
            }
            .frame(width: 300, height: 50)
            .cornerRadius(30)
            .shadow(radius: 30)
            .clipped()
            Toggle("性別(男/女)", isOn: $Gender)
            Stepper("體重 \(weight)", value: $weight, in: 3...7)
            VStack {
               DatePicker("紀錄貓咪到達時間", selection: $pickupTime, displayedComponents: .date)
               Text("選擇工具人來接送我的日期")
            }
            
        }
        .navigationBarTitle(editCat == nil ? "Enter the 發囉ing info" : "這麼快又長大了!")
        .navigationBarItems(trailing: Button("Save") {
            let pet = Pet(Mark: self.Mark, name: self.name, Variety: self.Variety, Gender: self.Gender, weight: self.weight, pickupTime: self.pickupTime)
            if let editCat = self.editCat {
                let index = self.catsData.pets.firstIndex {
                    $0.id == editCat.id
                    }!
                self.catsData.pets[index] = pet
            } else {
                self.catsData.pets.insert(pet, at: 0)
            }
            self.presentationMode.wrappedValue.dismiss()
            
        })
        .onAppear {
            if let editCat = self.editCat {
                self.Mark = editCat.Mark
                self.name = editCat.name
                self.Variety = editCat.Variety
                self.Gender = editCat.Gender
                self.weight = editCat.weight
                self.pickupTime = editCat.pickupTime
            }
        }
    }
}

struct CatEditor_Previews: PreviewProvider {
    static var previews: some View {
        CatEditor(catsData: CatsData())
    }
}
