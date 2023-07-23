//
//  MapView.swift
//  Map Diary
//
//  Created by Christopher Tang on 7/23/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    @EnvironmentObject var locationManager : LocationManager
    @State var region = MKCoordinateRegion(
        center:  CLLocationCoordinate2D(
            latitude: 37.789467,
            longitude:-122.416772
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 0.0027027027,
            longitudeDelta: 0.0027027027
        )
    )
    @State var track : MapUserTrackingMode = .follow
    
    
    
    
    
    
    var body: some View {
        VStack{
            Map(coordinateRegion: $region, interactionModes:.all, showsUserLocation: true, userTrackingMode: $track /*, annotationItems: locationManager.allMapPins){
                MapPin(coordinate: $0.coordinate)
            }*/)//.frame(height: 600)
            
            
                .onReceive(locationManager.$region){ region in
                    self.region = region                    
                }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView().environmentObject(LocationManager())
    }
}
