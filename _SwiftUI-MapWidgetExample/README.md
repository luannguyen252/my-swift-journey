# Map Widget Example 🗺
Example application showing how to display a map with the current user-location inside a widget.

[![Widget][widget-thumbnail]][widget]

**Note:** As a `UIViewRepresentable` is not supported in widgets, Apple's recommendation for displaying maps inside widgets is to use a [`MKMapSnapshotter`](https://developer.apple.com/documentation/mapkit/mkmapsnapshotter).

## How to use
📲 Clone the repository and run `pod install` in the terminal to install the dependencies. Afterwards run the example application, allow access to location data and add the widget named `MapWidgetExample` to your home screen.

## Widget
🧪 All code for the widget lives inside the folder `MapWidget`. The corresponding application code inside the folder `MapWidgetExample` does not contain any logic other than requesting access to location data.

## Requesting Authorization for Location Services
🔐 To receive the current user-location you have to add the following lines to the `Info.plist` of your application.

```
Privacy - Location When In Use Usage Description
Privacy - Location Usage Description
```

Furthermore you have to add these three lines to the `Info.plist` of your widget extension as well.

```
Privacy - Location When In Use Usage Description
Privacy - Location Usage Description
Widget Wants Location
```

**Note:** This is already done in this example application.

## Links
- [Creating a Widget Extension](https://developer.apple.com/documentation/widgetkit/creating-a-widget-extension)
- [Keeping a Widget Up To Date](https://developer.apple.com/documentation/widgetkit/keeping-a-widget-up-to-date)


[widget]: Assets/widget.png
[widget-thumbnail]: Assets/widget-thumbnail.png