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
    @State private var Mark = true
    @State private var name = ""
    @State private var Variety = ""
    @State private var Gender = true
    @State private var weight = 3
    var editCat: Pet?
    
    var body: some View {
        Form {
            TextField("名字", text: $name)
            Stepper("體重 \(weight)", value: $weight, in: 3...7)
            Toggle("性別", isOn: $Gender)
        }
        .navigationBarTitle(editCat == nil ? "Enter the following information" : "這麼快又長大了!")
        .navigationBarItems(trailing: Button("Save") {
            let pet = Pet(Mark: self.Mark, name: self.name, Variety: self.Variety, Gender: self.Gender, weight: self.weight)
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
            }
        }
    }
}

struct CatEditor_Previews: PreviewProvider {
    static var previews: some View {
        CatEditor(catsData: CatsData())
    }
}
