# scrumdinger

<p>
    <img src="https://img.shields.io/badge/iOS-14.3+-blue.svg" />
    <img src="https://img.shields.io/badge/Xcode-12.2+-brightgreen.svg" />
    <img src="https://img.shields.io/badge/Swift-5.3-orange.svg" />
    <img src="https://img.shields.io/badge/SwiftUI-2.0-red.svg" />
</p>

Code walkthrough of [https://developer.apple.com/tutorials/app-dev-training](https://developer.apple.com/tutorials/app-dev-training).

<img src="images/demo.gif"/>

## Further enhancements

### List View

<img src="images/list.png" width="375"/>

- Icons and caption text update based on number of attendees
- Made the screen more appealing
- Updated title to the name of the app

### Details View

<img src="images/details.png" width="375"/>

- Simplify information shown (but sacrifices simplicity for reduced accessibility)
- Center align and enlarge main action
- Remove color from labels that are not interactable

### New Scrum View

<img src="images/new.png" width="375"/>

- Added `New Scrum` title
- Rename `Dismiss` to `Cancel`

### Edit Scrum View

<img src="images/edit.png" width="375"/>

- Changed title to `Edit Scrum` instead of using the title (inaccurate when changed)
- Rename `Done` to `Save`
- Presented as a sheet rather than full screen for consistency with New

### Meeting View

<img src="images/meeting.png" width="375"/>

- Presented as a full screen for focus on content
- Updated background style to make it less jarring
- Themed progress bar based on scrum color

<img src="images/meeting2.png" width="375"/>

- Added stop button to end the meeting
