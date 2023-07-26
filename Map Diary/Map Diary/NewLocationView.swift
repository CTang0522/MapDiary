//
//  NewLocationView.swift
//  Map Diary
//
//  Created by Christopher Tang on 7/23/23.
//

import SwiftUI

struct NewLocationView: View {
    @EnvironmentObject var locationManager : LocationManager
    @State var location:String = ""
    @State var notes:String = ""
    
    
    @State var imageOne = false
    @State var imageOneSelected = UIImage()
    @State var openOneCameraRoll = false
    
    
    @State var imageTwo = false
    @State var imageTwoSelected = UIImage()
    @State var openTwoCameraRoll = false
    
    
    @State var imageThree = false
    @State var imageThreeSelected = UIImage()
    @State var openThreeCameraRoll = false
    
    
    @State var imageFour = false
    @State var imageFourSelected = UIImage()
    @State var openFourCameraRoll = false
    
    
    @State var imageFive = false
    @State var imageFiveSelected = UIImage()
    @State var openFiveCameraRoll = false
    
    
    @State var imageSix = false
    @State var imageSixSelected = UIImage()
    @State var openSixCameraRoll = false
    
    @State var srctype : UIImagePickerController.SourceType = .photoLibrary
    
    
    var body: some View {
        
        NavigationView(){
            Form {
                VStack{
                    TextField(text:$location, prompt: Text("Where Did You Go?")){
                        Text("Location")
                    }
                    
                    Divider()
                    
                    VStack{
                        HStack{
                            if(imageOne){
                                Image(uiImage: imageOneSelected)
                                    .resizable()
                                    .frame(width: 100, height: 100).onTapGesture {
                                        srctype = .photoLibrary
                                        openOneCameraRoll = true
                                        imageOne = true
                                    }
                            } else {
                                Image(systemName: "plus.circle").frame(width:100, height: 100).border(.black).onTapGesture {
                                    srctype = .photoLibrary
                                    openOneCameraRoll = true
                                    imageOne = true
                                }
                            }
                            
                            if(imageTwo){
                                Image(uiImage: imageTwoSelected)
                                    .resizable()
                                    .frame(width: 100, height: 100).onTapGesture {
                                        srctype = .photoLibrary
                                        openTwoCameraRoll = true
                                        imageTwo = true
                                    }
                            } else {
                                Image(systemName: "plus.circle").frame(width:100, height: 100).border(.black).onTapGesture {
                                    srctype = .photoLibrary
                                    openTwoCameraRoll = true
                                    imageTwo = true
                                }
                            }
                            
                            if(imageThree){
                                Image(uiImage: imageThreeSelected)
                                    .resizable()
                                    .frame(width: 100, height: 100).onTapGesture {
                                        srctype = .photoLibrary
                                        openThreeCameraRoll = true
                                        imageThree = true
                                    }
                            } else {
                                Image(systemName: "plus.circle").frame(width:100, height: 100).border(.black).onTapGesture {
                                    srctype = .photoLibrary
                                    openThreeCameraRoll = true
                                    imageThree = true
                                }
                            }
                        }
                        
                        HStack{
                            if(imageFour){
                                Image(uiImage: imageFourSelected)
                                    .resizable()
                                    .frame(width: 100, height: 100).onTapGesture {
                                        srctype = .photoLibrary
                                        openFourCameraRoll = true
                                        imageFour = true
                                    }
                            } else {
                                Image(systemName: "plus.circle").frame(width:100, height: 100).border(.black).onTapGesture {
                                    srctype = .photoLibrary
                                    openFourCameraRoll = true
                                    imageFour = true
                                }
                            }
                            
                            
                            if(imageFive){
                                Image(uiImage: imageFiveSelected)
                                    .resizable()
                                    .frame(width: 100, height: 100).onTapGesture {
                                        srctype = .photoLibrary
                                        openFiveCameraRoll = true
                                        imageFive = true
                                    }
                            } else {
                                Image(systemName: "plus.circle").frame(width:100, height: 100).border(.black).onTapGesture {
                                    srctype = .photoLibrary
                                    openFiveCameraRoll = true
                                    imageFive = true
                                }
                            }
                            
                            
                            if(imageSix){
                                Image(uiImage: imageSixSelected)
                                    .resizable()
                                    .frame(width: 100, height: 100).onTapGesture {
                                        srctype = .photoLibrary
                                        openSixCameraRoll = true
                                        imageSix = true
                                    }
                            } else {
                                Image(systemName: "plus.circle").frame(width:100, height: 100).border(.black).onTapGesture {
                                    srctype = .photoLibrary
                                    openSixCameraRoll = true
                                    imageSix = true
                                }
                            }
                        }
                    }
                    
                    Divider()
                    
                    TextField(text:$notes, prompt: Text("Any Additional Notes?")){
                        Text("Notes")
                    }
                    
                }
                
                Button{
                    locationManager.newMemory(location:location, imageOne:imageOneSelected, imageTwo:imageTwoSelected, imageThree:imageThreeSelected, imageFour:imageFourSelected, imageFive:imageFiveSelected, imageSix:imageSixSelected, notes:notes)
                } label: {
                    Text("Enter Location")
                }
                
                
                NavigationLink(
                    destination:MemoryView(mem: (memory(location:location, imageOne:imageOneSelected, imageTwo:imageTwoSelected, imageThree:imageThreeSelected, imageFour:imageFourSelected, imageFive:imageFiveSelected, imageSix:imageSixSelected, notes:notes)))
                ){Text("Show Memory")}
                
                
                
            }.sheet(isPresented: $openOneCameraRoll) {
                ImagePicker(selectedImage: $imageOneSelected, sourceType: srctype)
            }.sheet(isPresented: $openTwoCameraRoll) {
                ImagePicker(selectedImage: $imageTwoSelected, sourceType: srctype)
            }.sheet(isPresented: $openThreeCameraRoll) {
                ImagePicker(selectedImage: $imageThreeSelected, sourceType: srctype)
            }.sheet(isPresented: $openFourCameraRoll) {
                ImagePicker(selectedImage: $imageFourSelected, sourceType: srctype)
            }.sheet(isPresented: $openFiveCameraRoll) {
                ImagePicker(selectedImage: $imageFiveSelected, sourceType: srctype)
            }.sheet(isPresented: $openSixCameraRoll) {
                ImagePicker(selectedImage: $imageSixSelected, sourceType: srctype)
            }
        }
    }
}

struct NewLocationView_Previews: PreviewProvider {
    static var previews: some View {
        NewLocationView()
    }
}
