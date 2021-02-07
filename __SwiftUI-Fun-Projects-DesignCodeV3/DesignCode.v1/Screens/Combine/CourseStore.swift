//
//  CourseStore.swift
//  DesignCode.v2
//
//  Created by Tee Becker on 11/2/20.
//

import SwiftUI
import Contentful
import Combine

// get spaceId and accessToken from the settings menu inside contentful.com
// go to settings -> API Keys -> create new -> Space ID and Content Delivery API - access token

let client = Client(spaceId: "hukgn4ml4ivb", accessToken: "bGDL-xdn_pB79NY7tx1iGW3TLKpnVBgcKjv-gfwnYc4")

func getArray(id: String, completion: @escaping ([Entry]) -> ()) {
    // Github readme page for Contentful
    // Map Contentful entries to Swift classes via EntryDecodable
    
    let query = Query.where(contentTypeId: id)
    
    client.fetchArray(of: Entry.self, matching: query) { result in
        switch result{
        case.success(let array):
            DispatchQueue.main.async {
                completion(array.items)
            }
            
        case.failure(let error):
            print(error)
            
        }
    }
}

class CourseStore: ObservableObject{
    @Published var courses: [Course] = courseData
    init(){
        let colors = [#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1), #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1), #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)]
        
        getArray(id: "courses") { (items) in
            items.forEach { (item) in
                //                print(item.fields["title"] as! String)
                
                self.courses.append(Course(
                    title: item.fields["title"] as! String,
                    subtitle: item.fields["subtitle"] as! String,
                    logo: Image("Logo1"),
                    image: item.fields.linkedAsset(at: "image")?.url ?? URL(string: "")!,
                    backgroundColor: Color(colors.randomElement()!),
                    show: false
                ))
            }
        }
    }
}


