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
            latitudeDelta: 30,//0.0027027027,
            longitudeDelta: 30//0.0027027027
        )
    )
    @Published var memories:[memory] = []
    
    
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
    func newMemory(location:String, imageOne:UIImage, imageTwo:UIImage, imageThree:UIImage, imageFour:UIImage, imageFive:UIImage, imageSix:UIImage, notes:String)
    {
        let mem = memory(location: location, imageOne: imageOne, imageTwo: imageTwo, imageThree: imageThree, imageFour: imageFour, imageFive: imageFive, imageSix: imageSix, notes: notes)
        print(mem)
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
                latitudeDelta: 30,//0.0027027027,
                longitudeDelta: 30//0.0027027027
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


//---------------------------------------------------------------------------------------------------------------------------------------------------


class memory:ObservableObject {
    public var location:String = ""
    public var imageOne:UIImage = UIImage()
    public var imageTwo:UIImage = UIImage()
    public var imageThree:UIImage = UIImage()
    public var imageFour:UIImage = UIImage()
    public var imageFive:UIImage = UIImage()
    public var imageSix:UIImage = UIImage()
    public var notes:String = ""
    public var realImages:[UIImage] = []
    
    init(location: String, imageOne: UIImage, imageTwo: UIImage, imageThree: UIImage, imageFour: UIImage, imageFive: UIImage, imageSix: UIImage, notes: String) {
        self.location = location
        self.imageOne = imageOne
        self.imageTwo = imageTwo
        self.imageThree = imageThree
        self.imageFour = imageFour
        self.imageFive = imageFive
        self.imageSix = imageSix
        self.notes = notes
        
        if imageOne != UIImage() {
            realImages.append(imageOne)
        }
        if imageTwo != UIImage() {
            realImages.append(imageTwo)
        }
        if imageThree != UIImage() {
            realImages.append(imageThree)
        }
        if imageFour != UIImage() {
            realImages.append(imageFour)
        }
        if imageFive != UIImage() {
            realImages.append(imageFive)
        }
        if imageSix != UIImage() {
            realImages.append(imageSix)
        }
    }
}
