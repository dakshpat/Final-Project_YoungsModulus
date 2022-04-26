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
    
    var body: some View{
        
        ZStack{
            
            borderLine()
                .stroke(Color.black)
            
            drawPath(deltaLength: deltaLength, maxDeltaLength: maxDeltaLength)
                
            
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
    var youngsMod = youngsModulus()
    
    func path(in rect: CGRect) -> Path{
        
        var path = Path()
        
        if (deltaLength == maxDeltaLength){
            
            
            let scaleX = rect.width/(60 + maxDeltaLength + 5.0 )
            let scaleY = rect.height/20

            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            path.addLine(to: CGPoint(x: 0.0*scaleX, y: 20.0*scaleY ))
            path.addLine(to: CGPoint(x: 5.0*scaleX, y: 15.0*scaleY ))
            
            path.addLine(to: CGPoint(x: (30.0 + deltaLength)*scaleX, y: 15.0*scaleY ))
            path.addLine(to: CGPoint(x: (30.0 + deltaLength)*scaleX, y:  5.0*scaleY ))
            path.addLine(to: CGPoint(x: 5.0*scaleX, y: 5.0*scaleY ))
            path.addLine(to: CGPoint(x: 0.0*scaleX, y: 0.0*scaleY ))
            
            path.move(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY ))
            
            path.addLine(to: CGPoint(x: (55.0 + deltaLength)*scaleX, y: 15.0*scaleY ))
            path.addLine(to: CGPoint(x: (35.0 + deltaLength)*scaleX, y: 15.0*scaleY ))
            path.addLine(to: CGPoint(x: (35.0 + deltaLength)*scaleX, y:  5.0*scaleY ))
            path.addLine(to: CGPoint(x: (55.0 + deltaLength)*scaleX, y:  5.0*scaleY ))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY ))
            
            
        }
        
        else{
            
            let scaleX = rect.width/(60 + maxDeltaLength)
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

        }
        
        
        
        return path
    }
    
    
}
    


