//
//  MeetingFooterView.swift
//  scrumdinger
//
//  Created by An Trinh on 24/12/20.
//

import SwiftUI

struct MeetingFooterView: View {
    @Binding var speakers: [ScrumTimer.Speaker]
    
    var skipAction: () -> Void
    let endAction: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                Text(speakerText)
                Spacer()
                Button(action: isLastSpeaker ? endAction : skipAction) {
                    Image(systemName: isLastSpeaker ? "stop.fill" : "forward.fill")
                        .font(Font.body.weight(.heavy))
                        .padding(8)
                        .background(RoundedRectangle(cornerRadius: 9)
                                        .foregroundColor(Color.accentColor.lighterColor))
                }
                .accessibilityLabel(Text(isLastSpeaker ? "End meeting" : "Next speaker"))
            }
        }
        .padding([.bottom, .horizontal])
    }
    
    private var speakerNumber: Int? {
        guard let index = speakers.firstIndex(where: { !$0.isCompleted }) else { return nil }
        return index + 1
    }
    
    private var isLastSpeaker: Bool {
        return speakers.dropLast().allSatisfy { $0.isCompleted }
    }
    
    private var speakerText: String {
        guard let speakerNumber = speakerNumber else { return "No more speakers" }
        return "Speaker \(speakerNumber) of \(speakers.count)"
    }
}

struct MeetingFooterView_Previews: PreviewProvider {
    static var speakers = [ScrumTimer.Speaker(name: "Kim", isCompleted: false), ScrumTimer.Speaker(name: "Bill", isCompleted: false)]
    
    static var previews: some View {
        MeetingFooterView(speakers: .constant(speakers), skipAction: { }, endAction: { })
            .previewLayout(.sizeThatFits)
    }
}
