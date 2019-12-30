//
//  CatChart2.swift
//  貓咪眷養紀錄
//
//  Created by User16 on 2019/12/2.
//  Copyright © 2019 00657018. All rights reserved.
//

import SwiftUI

struct CatChart2: View {
    
    var catsData: CatsData
    let varietys = ["暹羅貓", "加菲貓", "狸花貓", "黑貓", "白貓", "折耳貓", "英短貓", "美短貓", "波斯貓"]
    var varietyHeight: [Double] = [0,0,0,0,0,0,0,0,0]
    var varietypercentages: [Double] = [0,0,0,0,0,0,0,0,0]
    
    init(catsData: CatsData) {
        self.catsData = catsData
        var Count: Double = 0
        var varieties: [Double] = [0,0,0,0,0,0,0,0,0]
        let varietys = ["暹羅貓", "加菲貓", "狸花貓", "黑貓", "白貓", "折耳貓", "英短貓", "美短貓", "波斯貓"]
        for data in catsData.pets {
            Count += 1
            for index in 0..<varietys.count {
                if data.Variety == varietys[index] {
                    varieties[index] += 1
                    break
                }
            }
        }
        for iii in varieties.indices {
            varietypercentages[iii] = varieties[iii] / Count
            varietyHeight[iii] = varietypercentages[iii] * 100
        }
        /*for iii in 0...8 {
            print("%c percentages: %.2f\n", varietys[iii], varietypercentages[iii])
        }*/
    }
    
    var body: some View {
        VStack//(totalHeight:270)
        {
            Text("Variety statistics for all cats")
            .font(Font.custom("Noteworthy Bold", size: 30))
            .fontWeight(.heavy)
            .foregroundColor(Color.yellow)
            .background(Color.black)
            .cornerRadius(10)
            .multilineTextAlignment(.center)
            .frame(width:400, height:150)
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            HStack(spacing: 16)
            {
                ForEach(0..<8) { (index) in
                    BarChart(varietyHeight: self.varietyHeight[index], varietys: self.varietys[index])
                }
            }
            .frame(height: 270)
            List(self.varietyHeight.indices) { (index) in
                HStack {
                    Text("\(self.varietys[index])")
                    Spacer()
                    Text("\(self.varietyHeight[index], specifier: "%.1f") %")
                }
            }
            .clipped()
        }
        .background(Image("反應過激的貓")
        .resizable()
        .scaledToFill()
        .opacity(0.4))
    }
}

struct CatChart2_Previews: PreviewProvider {
    static var previews: some View {
        CatChart2(catsData: CatsData())
    }
}

struct BarChart: View
{
    var varietyHeight: Double
    var varietys: String
    @State private var height: CGFloat = 0
    
    var body: some View
    {
        VStack
        {
            ZStack(alignment: .bottom)
            {
                Capsule().frame(width: 19, height: 200)
                    .foregroundColor(Color.yellow)
                Capsule().frame(width: 20, height: height)
                    .foregroundColor(Color.black)
                    .animation(.linear(duration: 0.5))
                .onAppear
                {
                    self.height = CGFloat(self.varietyHeight)
                }
            }
            Text(varietys)
            .font(.caption)
            .frame(width: 37, height: 3)
        }
    }
}
