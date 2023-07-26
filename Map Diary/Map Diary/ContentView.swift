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
        let backColor = Color(red: 251/255, green: 232/255, blue: 176/255, opacity: 1)
        NavigationView(){
            VStack {
                Text("My World My Story").font(
                    .largeTitle
                    .weight(.bold)
                )
                
                
                MapView().environmentObject(locationManager)
                
                
                NavigationLink(destination: NewLocationView().environmentObject(locationManager)){
                    Text("To The Form")
                }
            }.background(backColor)
        }
        
        //251 232 176
        
        
        
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
