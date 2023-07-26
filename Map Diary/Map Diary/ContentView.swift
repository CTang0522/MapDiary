//
//  ContentView.swift
//  Map Diary
//
//  Created by Christopher Tang on 7/23/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var locationManager:LocationManager = LocationManager()
    @State var location:String = ""
    
    
    var body: some View {
        //let backColor = Color(red: 251/255, green: 232/255, blue: 176/255, opacity: 1)
        NavigationView(){
            VStack {
                Text("My World My Story").font(
                    .largeTitle
                    .weight(.bold)
                )
                
                
                MapView().environmentObject(locationManager)
                
                
                NavigationLink(destination: NewLocationView().environmentObject(locationManager)){
                    ZStack{
                        RoundedRectangle(cornerRadius: 25).fill(.purple).frame(width: 125,height:35)
                        Text("To The Form").foregroundColor(.white).frame(width:125,height:35)

                    }
                }
            }.background(Color(red: 130/255, green: 244/255, blue: 191/255, opacity: 1))
        }.foregroundColor(.purple)
        
        //251 232 176
        
        
        
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


/*
 Colors List
 Background Orange: Color(red: 251/255, green: 232/255, blue: 176/255, opacity: 1)
 Teal Green: Color(red: 130/255, green: 244/255, blue: 191/255, opacity: 1)
 Brown Orange: Color(red: 227/255, green: 135/255, blue:104/255, opacity:1)
 
 
 
 
 */
