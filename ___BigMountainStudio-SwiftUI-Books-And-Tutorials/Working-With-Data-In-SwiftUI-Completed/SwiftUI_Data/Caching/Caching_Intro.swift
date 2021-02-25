//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

class CachingViewModel: ObservableObject {
    @Published var data: [String] = [""]
    let cache = NSCache<NSString, CachingViewModel>()
    let cacheKey: NSString = "CachingViewModel"
    
    func getData() {
        if let cachingViewModel = cache.object(forKey: cacheKey) {
            data = cachingViewModel.data
        } else {
            data = ["0", "1", "2", "3", "4", "5"]
        }
    }
    
    func addData() {
        let count = data.count
        print("Count: \(count)")
        data.append("\(count)")
    }
    
    func removeData() {
        data.removeLast()
    }
    
    func cacheData() {
        cache.setObject(self, forKey: cacheKey)
    }
    
    func restoreCache() {
        if let cachingViewModel = cache.object(forKey: cacheKey) {
            data = cachingViewModel.data
        }
    }
}

struct Caching_Intro: View {
    @ObservedObject var cachingViewModel = CachingViewModel()
    
    var body: some View {
        VStack {
            HeaderView("Caching", subtitle: "Introduction", desc: "Use NSCache to store classes (not structs) temporarily in memory.", back: .orange)
            
            HStack(spacing: 40) {
                Button("Add Data", action: { cachingViewModel.addData() })
                Button("Remove Data", action: { cachingViewModel.removeData() })
            }
            HStack(spacing: 40) {
                Button("Cache Data", action: { cachingViewModel.cacheData() })
                Button("Restore Cache", action: { cachingViewModel.restoreCache() })
            }
            
            ScrollView {
                LazyVStack {
                    ForEach(cachingViewModel.data, id: \.self) { datum in
                        Text(datum)
                    }
                }
            }
        }
        .font(.title)
        .onAppear {
            cachingViewModel.getData()
        }
    }
}

struct Caching_Intro_Previews: PreviewProvider {
    static var previews: some View {
        Caching_Intro()
    }
}
