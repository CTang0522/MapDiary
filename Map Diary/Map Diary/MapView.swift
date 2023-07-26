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
            latitudeDelta: 30,//0.0027027027,
            longitudeDelta: 30//0.0027027027
        )
    )
    @State var track : MapUserTrackingMode = .follow
    
    
    
    
    
    /*, annotationItems: locationManager.allMapPins){ MapPin(coordinate: $0.coordinate)}*/
    
    var body: some View {
        VStack{
            Map(coordinateRegion: $region, interactionModes:.all, showsUserLocation: true, userTrackingMode: $track)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView().environmentObject(LocationManager())
    }
}
