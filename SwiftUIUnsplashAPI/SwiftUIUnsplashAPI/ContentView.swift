//
//  ContentView.swift
//  SwiftUIUnsplashAPI
//
//  Created by Luan Nguyen on 08/01/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    @State var expand = false
    @State var search = ""
    @ObservedObject var RandomImages = getData()
    @State var page = 1
    @State var isSearching = false
    
    var body: some View{
        VStack(spacing: 0) {
            HStack {
                // Hiding this view when search bar is expanded
                if !self.expand {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Unsplash")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text("Beautiful, Free Photos")
                            .font(.caption)
                    }
                    .foregroundColor(.black)
                }

                Spacer(minLength: 0)
                
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .onTapGesture {
                        withAnimation{
                            self.expand = true
                        }
                }
                
                // Displaying Textfield when search bar is expanded
                if self.expand {
                    TextField("Search...", text: self.$search)
                    
                    // Displaying close button
                    // Displaying search button when search txt is not empty
                    if self.search != "" {
                        Button(action: {
                            // Search content
                            // Deleting all existing data and displaying search data
                            self.RandomImages.Images.removeAll()

                            self.isSearching = true
                            
                            self.page = 1
                            
                            self.SearchData()
                        }) {
                            Text("Find")
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                        }
                    }
                    
                    Button(action: {
                        withAnimation {
                            self.expand = false
                        }
                        
                        self.search = ""
                        
                        if self.isSearching {
                            self.isSearching = false
                            self.RandomImages.Images.removeAll()
                            // Updating home data
                            self.RandomImages.updateData()
                        }
                    }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 15, weight: .bold))
                            .foregroundColor(.black)
                    }
                    .padding(.leading,10)
                }
                
            }
            .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
            .padding()
            .background(Color.white)
            
            if self.RandomImages.Images.isEmpty {
                // Data is Loading or No Data
                Spacer()
                
                if self.RandomImages.noresults {
                    Text("No Results Found")
                }
                else {
                    Indicator()
                }
                
                Spacer()
            }
            else {
                ScrollView(.vertical, showsIndicators: false) {
                    // Collection View
                    VStack(spacing: 15) {
                        ForEach(self.RandomImages.Images,id: \.self) { i in
                            HStack(spacing: 20) {
                                ForEach(i) { j in
                                    AnimatedImage(url: URL(string: j.urls["thumb"]!))
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        // Padding on both sides 30 and spacing 20 = 50
                                        .frame(width: (UIScreen.main.bounds.width - 50) / 2, height: 200)
                                        .cornerRadius(15)
                                        .contextMenu {
                                        // Save Button
                                        Button(action: {
                                            // Saving Image
                                            // Image Quality
                                            SDWebImageDownloader().downloadImage(with: URL(string: j.urls["small"]!)) { (image, _, _, _) in
                                                // For this we need permission
                                                UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
                                            }
                                        }) {
                                            HStack {
                                                Text("Save")
                                                
                                                Spacer()
                                                
                                                Image(systemName: "square.and.arrow.down.fill")
                                            }
                                            .foregroundColor(.black)
                                        }
                                    }
                                }
                            }
                        }
                        
                        // Load More Button
                        if !self.RandomImages.Images.isEmpty {
                            if self.isSearching && self.search != "" {
                                HStack {
                                    Text("Page \(self.page)")
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        // Updating Data
                                        self.RandomImages.Images.removeAll()
                                        self.page += 1
                                        self.SearchData()
                                    }) {
                                        Text("Next")
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                    }
                                }
                                .padding(.horizontal,25)
                            }
                            else {
                                HStack {
                                    Spacer()
                                    
                                    Button(action: {
                                        // Updating Data
                                        self.RandomImages.Images.removeAll()
                                        self.RandomImages.updateData()
                                    }) {
                                        Text("Next")
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                    }
                                }
                                .padding(.horizontal,25)
                            }
                        }
                    }
                    .padding(.top)
                }
            }
        }
        .background(Color.black.opacity(0.07).edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.top)
    }
    
    func SearchData() {
        let key = "nkD7s1Jc4B0Jo2GuTCkrmsMWj6gE05hcpvrAzo5palw"
        // Replacing spaces into %20 for query
        let query = self.search.replacingOccurrences(of: " ", with: "%20")
        // Updating page every time
        let url = "https://api.unsplash.com/search/photos/?page=\(self.page)&query=\(query)&client_id=\(key)"
        self.RandomImages.SearchData(url: url)
    }
}

// Fetching Data
class getData: ObservableObject{
    // Going to Create Collection View
    // Thats Why 2d Array
    @Published var Images : [[Photo]] = []
    @Published var noresults = false
    
    init() {
        // Intial Data
        updateData()
    }
    
    func updateData(){
        self.noresults = false
        
        let key = "nkD7s1Jc4B0Jo2GuTCkrmsMWj6gE05hcpvrAzo5palw"
        let url = "https://api.unsplash.com/photos/random/?count=30&client_id=\(key)"
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!) { (data, _, err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }
            
            // JSON Decoding
            do {
                let json = try JSONDecoder().decode([Photo].self, from: data!)
                
                // Going to create collection view each row has two views
                for i in stride(from: 0, to: json.count, by: 2) {
                    var ArrayData : [Photo] = []
                    
                    for j in i..<i+2 {
                        // Index out bound
                        if j < json.count {
                            ArrayData.append(json[j])
                        }
                    }
                    
                    DispatchQueue.main.async {
                        self.Images.append(ArrayData)
                    }
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }
        .resume()
    }
    
    func SearchData(url: String) {
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!) { (data, _, err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }
            
            // JSON Decoding
            do {
                let json = try JSONDecoder().decode(SearchPhoto.self, from: data!)

                if json.results.isEmpty {
                    self.noresults = true
                }
                else {
                    self.noresults = false
                }
                
                // Going to create collection view each row has two views
                for i in stride(from: 0, to: json.results.count, by: 2) {
                    var ArrayData : [Photo] = []
                    
                    for j in i..<i+2 {
                        // Index out bound
                        if j < json.results.count {
                            ArrayData.append(json.results[j])
                        }
                    }
                    
                    DispatchQueue.main.async {
                        self.Images.append(ArrayData)
                    }
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }
        .resume()
    }
}

struct Photo: Identifiable, Decodable, Hashable {
    var id: String
    var urls: [String : String]
}

struct Indicator: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView(style: .large)
        view.startAnimating()
        return view
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {  }
}

// Differnt model for search
struct SearchPhoto: Decodable {
    var results: [Photo]
}
