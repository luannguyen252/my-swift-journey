//
//  MeetingView.swift
//  scrumdinger
//
//  Created by An Trinh on 15/12/2020.
//

import SwiftUI
import AVFoundation

struct MeetingView: View {
    @Binding var scrum: DailyScrum
    @StateObject var scrumTimer = ScrumTimer()
    @State private var transcript = ""
    @State private var isRecording = false
    
    let endAction: () -> Void
    
    private let speechRecognizer = SpeechRecognizer()
    var player: AVPlayer { AVPlayer.sharedDingPlayer }
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                MeetingHeaderView(secondsElapsed: $scrumTimer.secondsElapsed, secondsRemaining: $scrumTimer.secondsRemaining, scrumColor: scrum.color)
                Spacer()
                MeetingTimerView(speakers: $scrumTimer.speakers, isRecording: $isRecording, scrumColor: scrum.color)
                    .aspectRatio(contentMode: .fit)
                Spacer()
                MeetingFooterView(speakers: $scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker, endAction: endAction)
                Spacer()
            }
            .padding()
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendees: scrum.attendees)
            scrumTimer.speakerChangedAction = {
                player.seek(to: .zero)
                player.play()
            }
            speechRecognizer.record(to: $transcript)
            isRecording = true
            scrumTimer.startScrum()
        }
        .onDisappear {
            scrumTimer.stopScrum()
            speechRecognizer.stopRecording()
            isRecording = false
            let newHistory = History(attendees: scrum.attendees, lengthInMinutes: scrumTimer.secondsElapsed/60, transcript: transcript)
            scrum.history.insert(newHistory, at: 0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView(scrum: .constant(DailyScrum.data[0]), endAction: { })
    }
}
