//
//  Home.swift
//  Giphy
//
//  Created by igor mekkers on 28.04.2022.
//

import SwiftUI
import SDWebImageSwiftUI



struct Home: View {
    
    // gifsData
    @State var gifData : [String] = []
    
    // gifsController
    @State var present = false
    @State var url = ""
    
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false, content: {
            
            ForEach(gifData,id: \.self){url in
                
                HStack{
                    
                    Spacer(minLength: 0)
                    
                    // Animated Image Load Gif
                    
                    AnimatedImage(url: URL(string: url)!)
                        .aspectRatio(contentMode: .fit)
                       // .resizable()
                       // .frame(width: UIScreen.main.bounds.width - 100, height: 200)
                        .clipShape(CustomShape())
                }
                .padding()
            }
            .onChange(of: url, perform: { value in
                // when url changes, adding to array
                self.gifData.append(value)
        })
            .navigationTitle("GIF's")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                
                Button(action: {present.toggle()}, label: {
                    
                    Image(systemName: "rectangle.and.pencil.and.ellipsis")
                        .font(.title)
                })
            })
    })
            .fullScreenCover(isPresented: $present, content: {
                GIFController(url: $url, present: $present)
            })
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
  }
}
