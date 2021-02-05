//
//  MeetingTimerView.swift
//  scrumdinger
//
//  Created by An Trinh on 26/12/20.
//

import SwiftUI

struct MeetingTimerView: View {
    @Binding var speakers: [ScrumTimer.Speaker]
    @Binding var isRecording: Bool
    
    var scrumColor: Color
    
    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(lineWidth: 24, antialiased: true)
                .foregroundColor(scrumColor.lighterColor)
            VStack {
                Text(currentSpeaker)
                    .font(.title)
                Text("is speaking")
                Image(systemName: isRecording ? "mic" : "mic.slash")
                    .font(.title)
                    .padding(.top)
                    .accessibilityLabel(isRecording ? "with transcription" : "without transcription")
            }
            .accessibilityElement(children: .combine)
            ForEach(speakers) { speaker in
                if speaker.isCompleted,
                   let index = speakers.firstIndex(where: { $0.id == speaker.id }) {
                    SpeakerArc(speakerIndex: index, totalSpeakers: speakers.count)
                        .rotation(Angle(degrees: -90))
                        .stroke(scrumColor, lineWidth: 12)
                }
            }
        }
        .padding(.horizontal)
    }
    
    private var currentSpeaker: String {
        speakers.first(where: { !$0.isCompleted })?.name ?? "Someone"
    }
}

struct MeetingTimerView_Previews: PreviewProvider {
    @State static var speakers = [ScrumTimer.Speaker(name: "Kim", isCompleted: true),
                            ScrumTimer.Speaker(name: "Bill", isCompleted: true)]
    static var previews: some View {
        MeetingTimerView(speakers: $speakers, isRecording: .constant(true), scrumColor: Color("Design"))
    }
}

// MARK: - SpeakerArc

struct SpeakerArc: Shape {
    let speakerIndex: Int
    let totalSpeakers: Int
    
    func path(in rect: CGRect) -> Path {
        let diameter = min(rect.size.width, rect.size.height) - 24
        let radius = diameter / 2
        let center = CGPoint(x: rect.origin.x + rect.size.width/2,
                             y: rect.origin.y + rect.size.height/2)
        return Path { path in
            path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
    }
    
    private var degreesPerSpeaker: Double {
        360 / Double(totalSpeakers)
    }
    
    private var startAngle: Angle {
        Angle(degrees: degreesPerSpeaker * Double(speakerIndex) + 1)
    }
    
    private var endAngle: Angle {
        Angle(degrees: startAngle.degrees + degreesPerSpeaker - 1)
    }
}
