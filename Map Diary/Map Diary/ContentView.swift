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
        
        NavigationView(){
            VStack {
                Text("My World My Story")
                MapView().environmentObject(locationManager)
                
                NavigationLink(destination: NewLocationView().environmentObject(locationManager)){
                    Text("To The Form")
                }
            }
        }
        
        
        
        
        
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
