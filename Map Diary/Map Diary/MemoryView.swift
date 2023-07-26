//
//  MemoryView.swift
//  Map Diary
//
//  Created by Christopher Tang on 7/26/23.
//

import SwiftUI

struct MemoryView: View {
    var mem:memory
    
    @State var imageViewed:Int = 0
    
    var body: some View {
        VStack{
            let maxLimit = mem.realImages.count
            
            
            Text("My Trip To \(mem.location)")
            if maxLimit > 0{

                Image(uiImage: mem.realImages[imageViewed]).resizable().frame(width: 375,height: 375)
                    .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                        .onEnded({ value in
                            if value.translation.width < 0 {
                                if imageViewed > 0{
                                    imageViewed = imageViewed - 1
                                } else {
                                    imageViewed = maxLimit-1
                                }
                            }
                            
                            if value.translation.width > 0 {
                                if imageViewed < maxLimit-1 {
                                    imageViewed = imageViewed + 1
                                } else {
                                    imageViewed = 0
                                }
                            }
                        }))
            }
            Text("Current Index: \(imageViewed)")
            Text("Max Limit: \(maxLimit)")
            Text("\(mem.notes)")
            
            
            
        }
        
    }
}

/*struct MemoryView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryView(mem: memory(location: "Ur Moms", imageOne: UIImage(), imageTwo: UIImage(), imageThree: UIImage(), imageFour: UIImage(), imageFive: UIImage(), imageSix: UIImage(), notes: "Great Food ;)"))
    }
}*/
