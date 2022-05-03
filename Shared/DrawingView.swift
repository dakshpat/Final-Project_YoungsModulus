//
//  DrawingView.swift
//  YoungsModulus
//
//  Created by user216578 on 4/25/22.
//

import Foundation
import SwiftUI

struct drawingView: View{
    
    var deltaLength = 0.0
    var maxDeltaLength = 0.0
    var neckingPoint = 0.0
    var materialNeckPoint = 0.0
    
    var body: some View{
        
        ZStack{
            
            borderLine()
                .stroke(Color.black)
            
            drawPath(deltaLength: deltaLength,
                     maxDeltaLength: maxDeltaLength,
                     neckingPoint: neckingPoint,
                     materialNeckPoint: materialNeckPoint
                    )
                .stroke(Color.black, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                
            
        }
        .background(Color.white)
        .aspectRatio(1, contentMode: .fill)
        
    }
}

struct borderLine: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        return path
        
    }
}

struct drawPath: Shape {
    
    var deltaLength = 0.0
    var maxDeltaLength = 0.0
    
    var neckingPoint = 0.0
    var materialNeckPoint = 0.0
    
    var neckingAngle = 15.0 ///in degree
    
    var youngsMod = youngsModulus()
    
    func path(in rect: CGRect) -> Path{

        if (deltaLength == maxDeltaLength && neckingPoint > materialNeckPoint){
            
            var path = Path()
            
            let deltaL = tan((neckingAngle*Double.pi)/180)*(deltaLength/2)
            let neckThickness = 10.0 - 2*deltaL
            
            let scaleX = rect.width/(60 + maxDeltaLength + 5.0 )
            let scaleY = rect.height/20

            ///start left side of dog bone
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            path.addLine(to: CGPoint(x: 0.0*scaleX, y: 20.0*scaleY ))
            path.addLine(to: CGPoint(x: 5.0*scaleX, y: 15.0*scaleY ))

            ///necking point
            path.addLine(to: CGPoint(x: (30.0)*scaleX, y: 15.0*scaleY ))
            path.addLine(to: CGPoint(x: (30.0 + deltaLength/2)*scaleX, y: (15.0 - deltaL)*scaleY ))
            path.addLine(to: CGPoint(x: (30.0 + deltaLength/2)*scaleX, y: (15.0-(neckThickness+deltaL))*scaleY ))
            path.addLine(to: CGPoint(x: (30.0)*scaleX, y: 5.0*scaleY ))

            ///ends on the left sife of dog bone
            path.addLine(to: CGPoint(x: 5.0*scaleX, y: 5.0*scaleY ))
            path.addLine(to: CGPoint(x: 0.0*scaleX, y: 0.0*scaleY ))

            ///start right side of dog bone
            path.move(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY ))
            path.addLine(to: CGPoint(x: (55.0 + 5.0 + deltaLength)*scaleX, y: 15.0*scaleY ))
            path.addLine(to: CGPoint(x: (30.0 + 5.0 + deltaLength)*scaleX, y: 15.0*scaleY ))

            ///necking point
            path.addLine(to: CGPoint(x: (30.0 + 5.0 + deltaLength/2)*scaleX, y: (15.0 - deltaL)*scaleY ))
            path.addLine(to: CGPoint(x: (30.0 + 5.0 + deltaLength/2)*scaleX, y: (15.0-(neckThickness+deltaL))*scaleY ))
            path.addLine(to: CGPoint(x: (30.0 + 5.0 + deltaLength)*scaleX, y: 5.0*scaleY ))

            ///ends on the right sife of dog bone
            path.addLine(to: CGPoint(x: (55.0 + 5.0 + deltaLength)*scaleX, y: 5.0*scaleY ))
            path.addLine(to: CGPoint(x: (60.0 + 5.0 + deltaLength)*scaleX, y: 0.0*scaleY ))
            
            return path
        }
    
        else if (neckingPoint > materialNeckPoint){
            
            var path = Path()
            
            let deltaL = tan((neckingAngle*Double.pi)/180)*(deltaLength/2)
            let neckThickness = 10.0 - 2*deltaL
            
            let scaleX = rect.width/(60 + maxDeltaLength + 5.0)
            let scaleY = rect.height/20

            ///start left side of dog bone
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            path.addLine(to: CGPoint(x: 0.0*scaleX, y: 20.0*scaleY ))
            path.addLine(to: CGPoint(x: 5.0*scaleX, y: 15.0*scaleY ))

            ///necking point
            path.addLine(to: CGPoint(x: (30.0)*scaleX, y: 15.0*scaleY ))
            path.addLine(to: CGPoint(x: (30.0 + deltaLength/2)*scaleX, y: (15.0 - deltaL)*scaleY ))
            path.addLine(to: CGPoint(x: (30.0 + deltaLength/2)*scaleX, y: (15.0-(neckThickness+deltaL))*scaleY ))
            path.addLine(to: CGPoint(x: (30.0)*scaleX, y: 5.0*scaleY ))

            ///ends on the left sife of dog bone
            path.addLine(to: CGPoint(x: 5.0*scaleX, y: 5.0*scaleY ))
            path.addLine(to: CGPoint(x: 0.0*scaleX, y: 0.0*scaleY ))

            ///start right side of dog bone
            path.move(to: CGPoint(x: (60.0 + deltaLength)*scaleX, y: 0.0))
            path.addLine(to: CGPoint(x: (60.0 + deltaLength)*scaleX, y: 20.0*scaleY ))
            path.addLine(to: CGPoint(x: (55.0 + deltaLength)*scaleX, y: 15.0*scaleY ))
            path.addLine(to: CGPoint(x: (30.0 + deltaLength)*scaleX, y: 15.0*scaleY ))

            ///necking point
            path.addLine(to: CGPoint(x: (30.0 + deltaLength/2)*scaleX, y: (15.0 - deltaL)*scaleY ))
            path.addLine(to: CGPoint(x: (30.0 + deltaLength/2)*scaleX, y: (15.0-(neckThickness+deltaL))*scaleY ))
            path.addLine(to: CGPoint(x: (30.0 + deltaLength)*scaleX, y: 5.0*scaleY ))

            ///ends on the right sife of dog bone
            path.addLine(to: CGPoint(x: (55.0 + deltaLength)*scaleX, y: 5.0*scaleY ))
            path.addLine(to: CGPoint(x: (60.0 + deltaLength)*scaleX, y: 0.0*scaleY ))
           
            return path
        }
        
        else{
            
            var path = Path()
            
            let scaleX = rect.width/(60 + maxDeltaLength + 5.0)
            let scaleY = rect.height/20
        
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            path.addLine(to: CGPoint(x: 0.0*scaleX, y: 20.0*scaleY ))
            path.addLine(to: CGPoint(x: 5.0*scaleX, y: 15.0*scaleY ))
                    
            path.addLine(to: CGPoint(x: (55.0 + deltaLength)*scaleX, y: 15.0*scaleY ))
            path.addLine(to: CGPoint(x: (60.0 + deltaLength)*scaleX, y: 20.0*scaleY ))
            path.addLine(to: CGPoint(x: (60.0 + deltaLength)*scaleX, y:  0.0*scaleY ))
            path.addLine(to: CGPoint(x: (55.0 + deltaLength)*scaleX, y:  5.0*scaleY ))
            
            path.addLine(to: CGPoint(x: 5.0*scaleX, y: 5.0*scaleY ))
            path.addLine(to: CGPoint(x: 0.0*scaleX, y: 0.0*scaleY ))
            
            return path
        }
        
    }
    
    
}
    


