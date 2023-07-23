//
//  model.swift
//  Map Diary
//
//  Created by Christopher Tang on 7/23/23.
//

import Foundation
import CoreLocation
import MapKit
import UIKit
import SwiftUI

class LocationManager: NSObject, ObservableObject {
    
    private let locationManager = CLLocationManager()
    @Published var location : CLLocation?
    @Published var region: MKCoordinateRegion = MKCoordinateRegion(
        center:  CLLocationCoordinate2D(
            latitude: 37.789467,
            longitude:-122.416772
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 0.0027027027,
            longitudeDelta: 0.0027027027
        )
    )
    
    
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
}

//---------------------------------------------------------------------------------------------------------------------------------------------------
extension LocationManager : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.location = location
        
        self.region = (MKCoordinateRegion(
            center:  CLLocationCoordinate2D(
                latitude: locationManager.location?.coordinate.latitude ?? 0,
                longitude: locationManager.location?.coordinate.longitude ?? 0
            ),
            span: MKCoordinateSpan(
                latitudeDelta: 0.0027027027,
                longitudeDelta: 0.0027027027
            )
        ))
        
//        if annotate {
//            for i in 0..<locations.count {
//                mapPins.append(Pin(coordinate: locations[i].coordinate, altitude:locations[i].altitude,time: locations[i].timestamp))
//                allMapPins.append(Pin(coordinate: locations[i].coordinate, altitude:locations[i].altitude,time: locations[i].timestamp))
//            }
//        }
    }
}

//---------------------------------------------------------------------------------------------------------------------------------------------------


struct ImagePicker : UIViewControllerRepresentable {
    
    @Binding var selectedImage: UIImage
    @Environment(\.presentationMode) private var presentationMode
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
        
        return imagePicker
        
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        //not used, just in place because the UIVIEWCONTROLLERREPRESENTABLE protocal requires it
    }
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        //once you select an image, save the image
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            
            //dismiss the sheet
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}
