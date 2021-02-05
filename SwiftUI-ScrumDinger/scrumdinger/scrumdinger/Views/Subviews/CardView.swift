//
//  CardView.swift
//  scrumdinger
//
//  Created by An Trinh on 16/12/2020.
//

import SwiftUI

struct CardView: View {
    let scrum: DailyScrum
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 3) {
                Text(scrum.title)
                    .font(.title3)
                    .bold()
                Text(captionText)
                .font(Font.body.bold())
                    .foregroundColor(.gray)
            }
            Spacer()
            Image(systemName: scrum.iconName)
                .foregroundColor(scrum.color)
                .padding(8)
                .background(RoundedRectangle(cornerRadius: 9)
                                .foregroundColor(scrum.color.lighterColor))
        }
        .padding(.vertical)
    }
    
    private var captionText: String {
        let peopleText = scrum.attendees.isEmpty ? "Nobody" : "\(scrum.attendees.count) \(scrum.attendees.count == 1 ? "person" : "people")"
        return "\(peopleText) for \(scrum.lengthInMinutes) minutes"
    }
}

struct CardView_Previews: PreviewProvider {
    static var scrum = DailyScrum.data[1]
    static var previews: some View {
        CardView(scrum: scrum)
    }
}
