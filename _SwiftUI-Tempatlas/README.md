# TempAtlas in SwiftUI
TemperatureAtlas uses Apple Maps combined with the OpenWeather API written in SwiftUI.

This project was built to explore SwiftUI beyond the WWDC talks and current documentation 

***
# Build Info
***

* Xcode 11 beta 2
* iOS 13.0
* SwiftUI

# Project Details
***

The app allows the user to view live weather information by either searching for cities supported by the API in the search field or by tapping anywhere on the map. The User can save favorite locations to easily view those forecasts at a later time. Weather information can be toggled between Imperial and Metric units.

# Project Structure
***
## Models

The data model for the app is `WeatherState`.  This `ObservedObject` is used in most views in the app and contains information like the current active units, the current JSON response from the API, the current focused coordinates, the active Favorites, and a boolean flag for when the JSON response isn't `nil`. The model has some helper functions to handle adding/removing favorites from the local collection as well as saving and loading this information to/from `UserDefaults`. The file contains the `Favorite` struct to contain the name and coordinates of a favorite location. 

## API

The `API` Group contains the logic for requesting weather data and the struct for capturing the response. `WeatherAPI` contains the functions to request forecast data from OpenWeater by city and by coordinate. This makes a basic `URLSession.shared.dataTask` from a `URLRequest` and calls a completion handler with a flag based on if the call was a success and the response data.

The `WeatherResponse` file contains all the `Codable` structs used to decode the API response. One of these structs, `Coordinate`, has some helper functions to compare two `Coordinate`s and also to convert it to a `CLLocationCoordinate2D`. This file also extends `CLLocationCoordinate2D` to add similar functions, one a comparator and the other to convert to a `Coordinate`. 

## Landing and Forecast Views

The App is contained in the `Landing.swift` file. This displays the `SearchBar`, `MapView`, `ControlsView`, and `InfoView` immediately. These files are part of the `Forecast Views` Group. The `InfoRow` View in this group is a building block of the `InfoView`. Each of these views contains relevant styling and most contain a reference to the app's data model `WeatherState` either through a `@Binding` or `@EnvironmentObject` reference

## Modal Views

The Landing View presents a Modal which displays the user's favorites. The `ForecastList` and `FavoriteRow` that makes up each cell in the list are contained in the `Modal Views` Group. The Modal takes the `WeatherState` Environment Object to make changes to the map when the user selects one of their favorites. It also takes a boolean `@Binding` to let the Landing page know to dismiss the Modal once it's called to update the map location and forecast information.
