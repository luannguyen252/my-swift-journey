//
//  ClipShapes.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 15/12/2020.
//

import SwiftUI

struct ClipShapes: View {
    // MARK: - BODY
    var body: some View {
        // MARK: - BUTTON CLIP SHAPE: CIRCLE
        Button(action: { }) {
            Image(systemName: "bolt.fill")
                .foregroundColor(.white)
                .padding()
                .background(Color.black)
                .clipShape(Circle())
        }
        
        // MARK: - BUTTON CLIP SHAPE: ELLIPSE
        Button(action: { }) {
            Image(systemName: "bolt.fill")
                .foregroundColor(.white)
                .padding()
                .background(Color.black)
                .clipShape(Ellipse())
        }
        
        // MARK: - BUTTON CLIP SHAPE: CAPSULE
        Button(action: { }) {
            Image(systemName: "bolt.fill")
                .foregroundColor(.white)
                .padding()
                .background(Color.black)
                .clipShape(Capsule())
        }
        
        // MARK: - BUTTON CLIP SHAPE: ROUNDED RECTANGLE
        Button(action: { }) {
            Image(systemName: "bolt.fill")
                .foregroundColor(.white)
                .padding()
                .background(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        
        // MARK: - BUTTON CLIP SHAPE: RECTANGLE
        Button(action: { }) {
            Image(systemName: "bolt.fill")
                .foregroundColor(.white)
                .padding()
                .background(Color.black)
                .clipShape(Rectangle())
        }
        
        // MARK: - IMAGE CLIP SHAPE: CIRCLE
        Image(uiImage: #imageLiteral(resourceName: "Image-2"))
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .padding()
        
        // MARK: - IMAGE CLIP SHAPE: ELLIPSE
        Image(uiImage: #imageLiteral(resourceName: "Image-2"))
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Ellipse())
            .padding()
        
        // MARK: - IMAGE CLIP SHAPE: CAPSULE
        Image(uiImage: #imageLiteral(resourceName: "Image-2"))
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Capsule())
            .padding()
        
        // MARK: - IMAGE CLIP SHAPE: ROUNDED RECTANGLE
        Image(uiImage: #imageLiteral(resourceName: "Image-2"))
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(RoundedRectangle(cornerRadius: 32))
            .padding()
        
        // MARK: - IMAGE CLIP SHAPE: RECTANGLE
        Image(uiImage: #imageLiteral(resourceName: "Image-2"))
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Rectangle())
            .padding()
    }
}

// MARK: - PREVIEW
struct ClipShapes_Previews: PreviewProvider {
    static var previews: some View {
        ClipShapes()
    }
}
