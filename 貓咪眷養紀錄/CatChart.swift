//
//  CatChart.swift
//  貓咪眷養紀錄
//
//  Created by User16 on 2019/11/29.
//  Copyright © 2019 00657018. All rights reserved.
//

import SwiftUI

struct PieChart: Shape
{
    var startAngle: Angle
    var endAngle: Angle
    
    func path(in rect: CGRect) -> Path
    {
        Path
        {
            (path) in
            let center = CGPoint(x: rect.midX, y: rect.midY)
            path.move(to: center)
            path.addArc(center: center, radius: rect.midX, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
    }
}

struct CatChart: View {
    
    var catsData: CatsData
    var weightAngles: [Angle]
    
    var body: some View {
        VStack//(totalHeight:270)
        {
            ZStack
            {
                PieChart(startAngle: weightAngles[0], endAngle: weightAngles[1])
                .fill(Color.yellow)
                PieChart(startAngle: weightAngles[1], endAngle: weightAngles[2])
                .fill(Color.black)
                PieChart(startAngle: weightAngles[2], endAngle: weightAngles[0])
                .fill(Color.purple)
            }
            .frame(width: 200, height: 200)
            Spacer()
            .frame(height:40)
            genderIcons()
        }
    }
}

struct CatChart_Previews: PreviewProvider {
    static var previews: some View {
        CatChart(catsData: CatsData())
    }
}

struct genderIcons: View
{
    var body: some View
    {
        HStack
        {
            Path(ellipseIn: CGRect(x: 0, y: 0, width: 30, height: 30))
            .fill(Color.yellow)
            Text("男生")
            .padding(EdgeInsets(top: 0, leading: -50, bottom: 0, trailing: 10))
            Path(ellipseIn: CGRect(x: 0, y: 0, width: 30, height: 30))
            .fill(Color.black)
            Text("女生")
            .padding(EdgeInsets(top: 0, leading: -50, bottom: 0, trailing: 10))
            Path(ellipseIn: CGRect(x: 0, y: 0, width: 30, height: 30))
            .fill(Color.purple)
            Text("其他")
            .padding(EdgeInsets(top: 0, leading: -50, bottom: 0, trailing: 10))
        }
        .frame(width:300, height: 30)
    }
}
