//
//  PetList.swift
//  貓咪眷養紀錄
//
//  Created by User16 on 2019/11/28.
//  Copyright © 2019 00657018. All rights reserved.
//

import SwiftUI

struct PetList: View {
    
    @ObservedObject var catsData = CatsData()
    @State private var showEdit = false
    @State private var showChart = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(catsData.pets) { (pet) in
                    NavigationLink(destination: CatEditor(catsData: self.catsData, editCat: pet)) {
                        CatRow(pet: pet)
                        
                    }
                }
                .onDelete { (indexSet) in
                    self.catsData.pets.remove(atOffsets: indexSet)
                }
            }
            .navigationBarTitle("嘿我看到一隻貓")
            .navigationBarItems(leading: Button(action: {
                
                self.showChart = true
                
            })
            {
                HStack {
                    Image(systemName: "chart.pie.fill")
                    Image(systemName: "arrow.left.and.right")
                    Image(systemName: "chart.bar.fill")
                }
            }
            .sheet(isPresented: self.$showChart)
            {
                CatChartTab()
            }
            , trailing: Button(action: {
                
                self.showEdit = true
                
            }, label: {
                
                Image(systemName: "rectangle.stack.badge.plus")
                
            }))
                .sheet(isPresented: $showEdit) {
                    NavigationView {
                         CatEditor(catsData: self.catsData)
                    }
                }
                //.background(View)
        }
    }
}

struct PetList_Previews: PreviewProvider {
    static var previews: some View {
        PetList()
    }
}
