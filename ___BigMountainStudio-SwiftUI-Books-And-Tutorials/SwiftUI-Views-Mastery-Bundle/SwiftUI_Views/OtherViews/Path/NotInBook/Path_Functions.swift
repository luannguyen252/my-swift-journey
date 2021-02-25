//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct PathInfo: Identifiable {
    let id = UUID()
    var name = ""
    var detail = ""
}

struct Path_Functions: View {
    var pathFunctions = [
        PathInfo(name: "addArc", detail: "Adds a curved line (arc) by specifying a radius and start and end angles."),
        PathInfo(name: "addEllipse", detail: "Draws an ellipse with a specified size (height and width)."),
        PathInfo(name: "addCurve", detail: "Adds a line from a point you're currently at to a point specified. And then you specify two control handles to manipulate the curve of that line."),
        PathInfo(name: "addLine", detail: "Adds a line from a point you're currently at to a point specified."),
        PathInfo(name: "addPath", detail: "You can add a second path to your already existing path."),
        PathInfo(name: "addQuadCurve", detail: "Adds a curved line from the point you're currently at to a point specified. You also specify a point you want the curve to bend toward."),
        PathInfo(name: "addRect", detail: "Draws a rectangle using a start point and size (height and width)."),
        PathInfo(name: "addRects", detail: "Draws one or many rectangles that have a start point and size (height and width)."),
        PathInfo(name: "addRelativeArc", detail: "Adds a curved line (arc) by specifying a radius, start angle and then how many degrees you want to extend from that start angle (delta)."),
        PathInfo(name: "addRoundedRect", detail: "Draws a rounded rectangle with a custom corner size."),
        PathInfo(name: "closeSubpath", detail: "Closes the path by connecting the last point to the very first point of the path."),
        PathInfo(name: "move", detail: "Moves to a point where you want the drawing to start from.")
    ]
    
    var body: some View {
        VStack(spacing: 5) {
            Text("Path").font(.largeTitle)
            Text("Functions").font(.title).foregroundColor(.gray)
            Text("Available path functions")
                .frame(maxWidth: .infinity).padding()
                .background(Color.purple).foregroundColor(Color.white)
                .font(.title)
            List(pathFunctions) { pathInfo in
                VStack(alignment: .leading) {
                    Text(pathInfo.name)
                        .font(.title)
                    Text(pathInfo.detail)
                }
            }
        }
    }
}

struct Path_Functions_Previews: PreviewProvider {
    static var previews: some View {
        Path_Functions()
    }
}
