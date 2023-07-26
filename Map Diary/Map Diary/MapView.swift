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
        NavigationView{
            VStack{
                Map(coordinateRegion: $region, interactionModes:.all, showsUserLocation: true, userTrackingMode: $track, annotationItems: locationManager.annotations) { place in
                    MapAnnotation(coordinate: place.coord, anchorPoint: CGPoint(x: 0.5, y: 0.7)){
                        NavigationLink(destination:MemoryView(mem:place.mem)){
                            Image(systemName: "pin.fill").foregroundColor(.red)
                        }
                    }
                }
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView().environmentObject(LocationManager())
    }
}
