//
//  CatChart.swift
//  貓咪眷養紀錄
//
//  Created by User16 on 2019/11/29.
//  Copyright © 2019 00657018. All rights reserved.
//

import SwiftUI

struct CatChart: View {
    
    var catsData: CatsData
    var weightAngles: [Angle]
    var weightpercentages: [Double] = [0,0,0,0,0]
    
    init(catsData: CatsData) {
        self.catsData = catsData
        var Count: Double = 0
        var weightC: [Double] = [0,0,0,0,0]
        weightAngles = [Angle]()
        var startDegree: Double = 0

        for data in catsData.pets {
            Count += 1
            for Weightx in 3...7 {
                if data.weight == Weightx {
                    weightC[Weightx-3] += 1
                    break
                }
            }
        }
        for iii in 0...4 {
            weightpercentages[iii] = weightC[iii] / Count
        }
        for Weightpercentages in weightpercentages {
            weightAngles.append(.degrees(startDegree))
            startDegree += 360 * Weightpercentages
        }
        if weightpercentages[4] == 1.0
        {
            weightAngles[0] = .degrees(360)
        }
        /*for iii in 0...4 {
            print("%d percentages: %.2f\n", iii+3, weightpercentages[iii])
        }*/
    }
    
    var body: some View {
        VStack//(totalHeight:270)
        {
            Text("Weight statistics for all cats")
            .font(Font.custom("Noteworthy Bold", size: 30))
            .fontWeight(.heavy)
            .foregroundColor(Color.orange)
            .background(Color.black)
            .cornerRadius(30)
            .multilineTextAlignment(.center)
            .frame(width:400, height:150)
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            ZStack
            {
                PieChart(startAngle: weightAngles[0], endAngle: weightAngles[1])
                .fill(Color.yellow)
                PieChart(startAngle: weightAngles[1], endAngle: weightAngles[2])
                .fill(Color.black)
                PieChart(startAngle: weightAngles[2], endAngle: weightAngles[0])
                .fill(Color.purple)
                PieChart(startAngle: weightAngles[3], endAngle: weightAngles[0])
                .fill(Color.gray)
                PieChart(startAngle: weightAngles[4], endAngle: weightAngles[0])
                .fill(Color.orange)
            }
            .frame(width: 200, height: 274)
            Spacer()
            .frame(height:40)
            caticon()
            List(self.weightAngles.indices) { (index) in
                HStack {
                    Text("\(index+3) kg")
                    Spacer()
                    Text("\(self.weightpercentages[index] * 100, specifier: "%.1f") %")
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

struct CatChart_Previews: PreviewProvider {
    static var previews: some View {
        CatChart(catsData: CatsData())
    }
}

struct caticon: View
{
    var body: some View
    {
        HStack
        {
            Path(ellipseIn: CGRect(x: 0, y: 0, width: 20, height: 20))
            .fill(Color.yellow)
            Text("3kg")
            .padding(EdgeInsets(top: 0, leading: -10, bottom: 0, trailing: 3))
            Path(ellipseIn: CGRect(x: 0, y: 0, width: 20, height: 20))
            .fill(Color.black)
            Text("4kg")
            .padding(EdgeInsets(top: 0, leading: -10, bottom: 0, trailing: 3))
            Path(ellipseIn: CGRect(x: 0, y: 0, width: 20, height: 20))
            .fill(Color.purple)
            Text("5kg")
            .padding(EdgeInsets(top: 0, leading: -10, bottom: 0, trailing: 3))
            Path(ellipseIn: CGRect(x: 0, y: 0, width: 20, height: 20))
            .fill(Color.gray)
            Text("6kg")
            .padding(EdgeInsets(top: 0, leading: -10, bottom: 0, trailing: 3))
            Path(ellipseIn: CGRect(x: 0, y: 0, width: 20, height: 20))
            .fill(Color.orange)
            Text("7kg")
            .padding(EdgeInsets(top: 0, leading: -10, bottom: 0, trailing: 3))
        }
        .frame(width:300, height: 30)
    }
}
