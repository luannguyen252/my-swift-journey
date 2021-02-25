# Creating and Updating Complications

Build complications that display current information from your app.

## Overview

The Coffee Tracker app records a user's caffeine intake. 
Each time the user adds a drink, the app recalculates the current caffeine levels 
and the equivalent cups of coffee consumed. 
It then updates the complication timeline 
and estimates the decrease in the user's caffeine level over the next 24 hours.

This sample demonstrates the basic steps to set up and fill the complication's timeline, 
including setting up support for complications, 
creating entries to fill the complication's timeline, 
and then updating the timeline every time the user makes a change.

The app also updates the complications based on external changes 
that occur when the app isn't running. 
Coffee Tracker saves and reads caffeine samples to HealthKit, 
so the app must respond to any external changes, 
such as another app adding or deleting a caffeine sample from HealthKit. 
Coffee Tracker uses a background refresh task to query HealthKit for changes, 
and updates the app's data and the complication timeline.

## Configure the Sample Code Project

To add the complication to an active watch face, start by building and running the sample code project in the simulator, 
and follow these steps:

1. Click the Digital Crown to exit the app and return to the watch face.
2. Using the trackpad, firmly press the watch face to put the face in edit mode, then tap Customize.
3. Swipe left until the configuration screen highlights the complications. Select the complication to modify.
4. Scroll to the Coffee Tracker complication, and then click the Digital Crown again to save your changes.
5. Tap the Coffee Tracker complication to go back to the app.

For more information on setting up watch faces, see [Change the watch face on your Apple Watch](https://support.apple.com/en-us/HT205536).

After configuring and running the Coffee Tracker app, you can test the background updates.
Make sure the Coffee Tracker complication appears on the active watch face. 
Then build and run the app in the simulator, and follow these steps:

1. Add one or more drinks using the app's main view.
2. Click the Digital Crown to send the app to the background.
3. Open Settings, and scroll down to Health > Health Data > Nutrition > Caffeine. 
    Settings should show all the drinks you added to the app.
4. Click Delete Caffeine Data to clear all the caffeine samples from HealthKit.
5. Navigate back to the watch face. 

Coffee Tracker should update the complication within 15 minutes; however, the update may be delayed based on the system's current state.

## Set Up Support for Complications

The app declares the `ComplicationController` class as the complication's data source. 
Xcode saves this setting in the WatchKit Extension's `Info.plist` file.

Next, the Coffee Tracker app implements the [`CLKComplicationDataSource`](https://developer.apple.com/documentation/clockkit/clkcomplicationdatasource) protocol's 
methods to configure the app's timeline. 
The app declares the supported complications by implementing the [getComplicationDescriptors(handler:)](https://developer.apple.com/documentation/clockkit/clkcomplicationdatasource/3555131-getcomplicationdescriptors)
method. 

``` swift
func getComplicationDescriptors(handler: @escaping ([CLKComplicationDescriptor]) -> Void) {
    let descriptor = CLKComplicationDescriptor(identifier: "Coffee_Tracker_Caffeine_Dose",
                                               displayName: "Caffeine Dose",
                                               supportedFamilies: CLKComplicationFamily.allCases)
    handler([descriptor])
}
```

ClockKit identifies complications based on their [identifier](https://developer.apple.com/documentation/clockkit/clkcomplication/3612129-identifier) 
and their [family](https://developer.apple.com/documentation/clockkit/clkcomplication/1628035-family). 
Apps can declare support for multiple complications by giving each complication a unique identifier.
Coffee Tracker declares support for a single complication, returning a [CLKComplicationDescriptor](https://developer.apple.com/documentation/clockkit/clkcomplicationdescriptor) object
that declares support for the `Coffee_Tracker_Caffeine_Dose` identifier for all families.

Because every copy of Coffee Tracker supports the same set of `CLKComplicationDescriptor` objects,
the app doesn't need to implement the data source's [handleSharedComplicationDescriptors(_:)](https://developer.apple.com/documentation/clockkit/clkcomplicationdatasource/3555132-handlesharedcomplicationdescript) method. 
For more information on defining the supported families, see [Declaring the Complications](https://developer.apple.com/documentation/clockkit/declaring_the_complications).

## Load Future Entries

Because the app can easily calculate caffeine levels in the future,
Coffee Tracker declares that it can batch-load future timeline entries 
by implementing the [`getTimelineEndDate(for:withHandler:)`](https://developer.apple.com/documentation/clockkit/clkcomplicationdatasource/1628056-gettimelineenddate) method 
and setting the end date for the timeline to 24 hours in the future.

ClockKit can now request batches of timeline entries up to that deadline. 
After that point, the caffeine level drops to `0.0`. 
Because the data stops changing at that point, 
ClockKit won't need any additional timeline entries until  the user adds another drink.

``` swift
// Define how far into the future the app can provide data.
func getTimelineEndDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
    // Indicate that the app can provide timeline entries for the next 24 hours.
    handler(Date().addingTimeInterval(24.0 * 60.0 * 60.0))
}
```

Finally, the app sets the privacy behavior by implementing the [`getPrivacyBehavior(for:withHandler:)`](https://developer.apple.com/documentation/clockkit/clkcomplicationdatasource/1627965-getprivacybehavior) method, 
hiding the complication data on the user's caffeine intake when the watch is locked.

``` swift
// Define whether the complication is visible when the watch is unlocked.
func getPrivacyBehavior(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationPrivacyBehavior) -> Void) {
    // This is potentially sensitive data. Hide it on the lock screen.
    handler(.hideOnLockScreen)
}
```

## Display Current Data

Coffee Tracker uses three techniques to keep the complications up to date.

* The app provides future timeline entries in five-minute increments 
  that ClockKit uses to update the complications automatically.
  
* While the app is running, Coffee Tracker updates its complications 
  whenever the user adds a drink. 
  This updates not just the current complication, 
  but also reloads the entire complication timeline.

* Finally, the app uses background refresh tasks to query 
  HealthKit for any updates to its caffeine samples. 
  The app then updates its data based on any changes.
  
  For more information, see [Updating Your Complication]( https://developer.apple.com/documentation/clockkit/updating_your_complication).


## Create Timeline Entries

If there's an active complication on the watch face, 
ClockKit calls the data source's methods to keep the complication's timeline filled. 
ClockKit calls the [`getCurrentTimelineEntry(for:withHandler:)`](https://developer.apple.com/documentation/clockkit/clkcomplicationdatasource/1628051-getcurrenttimelineentry) method 
to get the current complication.

``` swift
// Return the current timeline entry.
func getCurrentTimelineEntry(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimelineEntry?) -> Void) {
    handler(createTimelineEntry(forComplication: complication, date: Date()))
}
```

Then it calls the [`getTimelineEntries(for:after:limit:withHandler:))`](https://developer.apple.com/documentation/clockkit/clkcomplicationdatasource/1628094-gettimelineentries) method to 
batch load future timeline entries.

``` swift
// Return future timeline entries.
func getTimelineEntries(for complication: CLKComplication,
                        after date: Date,
                        limit: Int,
                        withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
    
    let fiveMinutes = 5.0 * 60.0
    let twentyFourHours = 24.0 * 60.0 * 60.0
    
    // Create an array to hold the timeline entries.
    var entries = [CLKComplicationTimelineEntry]()
    
    // Calculate the start and end dates.
    var current = date.addingTimeInterval(fiveMinutes)
    let endDate = date.addingTimeInterval(twentyFourHours)
    
    // Create a timeline entry for every five minutes from the starting time.
    // Stop once you reach the limit or the end date.
    while (current.compare(endDate) == .orderedAscending) && (entries.count < limit) {
        entries.append(createTimelineEntry(forComplication: complication, date: current))
        current = current.addingTimeInterval(fiveMinutes)
    }
    
    handler(entries)
}
```

ClockKit automatically calls these methods when it needs to refill the timeline. 
In Coffee Tracker, both of these methods call the `createTimelineEntry(forComplication:date:)` method
to create the event. 
`createTimelineEntry(forComplication:date:)` then calls `createTemplate(forComplication:date:)`  to build the  template, and wraps the template in a 
[`CLKComplicationTimelineEntry`](https://developer.apple.com/documentation/clockkit/clkcomplicationtimelineentry) object.

For more information, see [Loading Future Timeline Events](https://developer.apple.com/documentation/clockkit/loading_future_timeline_events).

## Create and Fill a  Complication Template

ClockKit uses a template-driven user interface.
The system divides the complications into a number of families 
based on their size and capabilities, 
and each family then provides a number of templates that define its layout.
When ClockKit asks the data source for a timeline entry, 
the app must instantiate a template for the specified identifier and family, 
and then fill the template with the required data,
before wrapping it in a `CLKComplicationTimelineEntry` object and returning it.

Because Coffee Tracker uses only a single identifier, it starts by creating a `switch` statement 
covering all the families supported by the app. 

``` swift
// Select the correct template based on the complication's family.
private func createTemplate(forComplication complication: CLKComplication, date: Date) -> CLKComplicationTemplate {
    switch complication.family {
    case .modularSmall:
        return createModularSmallTemplate(forDate: date)
    case .modularLarge:
        return createModularLargeTemplate(forDate: date)
    case .utilitarianSmall, .utilitarianSmallFlat:
        return createUtilitarianSmallFlatTemplate(forDate: date)
    case .utilitarianLarge:
        return createUtilitarianLargeTemplate(forDate: date)
    case .circularSmall:
        return createCircularSmallTemplate(forDate: date)
    case .extraLarge:
        return createExtraLargeTemplate(forDate: date)
    case .graphicCorner:
        return createGraphicCornerTemplate(forDate: date)
    case .graphicCircular:
        return createGraphicCircleTemplate(forDate: date)
    case .graphicRectangular:
        return createGraphicRectangularTemplate(forDate: date)
    case .graphicBezel:
        return createGraphicBezelTemplate(forDate: date)
    case .graphicExtraLarge:
        if #available(watchOSApplicationExtension 7.0, *) {
            return createGraphicExtraLargeTemplate(forDate: date)
        } else {
            fatalError("Graphic Extra Large template is only available on watchOS 7.")
        }
    @unknown default:
        fatalError("*** Unknown Complication Family ***")
    }
}
```

The app calls a helper method for each family that creates a template the family supports.
The helper method also creates all the data providers needed to fill the template. 
For example, the following helper method creates a graphical corner template.

``` swift
// Return a graphic template that fills the corner of the watch face.
private func createGraphicCornerTemplate(forDate date: Date) -> CLKComplicationTemplate {
    // Create the data providers.
    let leadingValueProvider = CLKSimpleTextProvider(text: "0")
    leadingValueProvider.tintColor = data.color(forCaffeineDose: 0.0)
    
    let trailingValueProvider = CLKSimpleTextProvider(text: "500")
    trailingValueProvider.tintColor = data.color(forCaffeineDose: 500.0)
    
    let mgCaffeineProvider = CLKSimpleTextProvider(text: data.mgCaffeineString(atDate: date))
    let mgUnitProvider = CLKSimpleTextProvider(text: "mg Caffeine", shortText: "mg")
    mgUnitProvider.tintColor = data.color(forCaffeineDose: data.mgCaffeine(atDate: date))
    let combinedMGProvider = CLKTextProvider(format: "%@ %@", mgCaffeineProvider, mgUnitProvider)
    
    let percentage = Float(min(data.mgCaffeine(atDate: date) / 500.0, 1.0))
    let gaugeProvider = CLKSimpleGaugeProvider(style: .fill,
                                               gaugeColors: [.green, .yellow, .red],
                                               gaugeColorLocations: [0.0, 300.0 / 500.0, 450.0 / 500.0] as [NSNumber],
                                               fillFraction: percentage)
    
    // Create the template using the providers.
    return CLKComplicationTemplateGraphicCornerGaugeText(gaugeProvider: gaugeProvider,
                                                         leadingTextProvider: leadingValueProvider,
                                                         trailingTextProvider: trailingValueProvider,
                                                         outerTextProvider: combinedMGProvider)
}
```

This example creates a curved gauge with text outside it. 
The gauge is a graphical element, like a thermometer or progress bar.
To fill the template, the app supplies a gauge provider, 
which specifies the gauge's start value, end value, current value, 
and the color gradient used by the gauge. 
The app also provides two text providers for the labels at the start and end of the gauge.
Finally, it provides another text provider for the main text.
Depending on the watch face, the gauge and text may use the specified colors to provide additional information.

  
## Reload the Timeline
  
The `CoffeeData` model object declares `currentDrinks`  as a `@Published` property. 
The system alerts subscribers to any change to the `currentDrinks` array. 
For example, SwiftUI uses the publisher to trigger updates to the main view. 
However, the publisher sends the alerts during the property's `willSet` observer. 
Coffee Tracker also needs to update the complications after the value changes. 
To do this, it adds a separate  `didSet` observer.
  
``` swift
// Because this is @Published property,
// Combine notifies any observers when a change occurs.
@Published public var currentDrinks = [Drink]() {
    didSet {
        logger.debug("A value has been assigned to the current drinks property.")
        
        // Update any complications on active watch faces.
        let server = CLKComplicationServer.sharedInstance()
        for complication in server.activeComplications ?? [] {
            server.reloadTimeline(for: complication)
        }
        
        // Begin saving the data.
        self.save()
    }
}
```
  
The `didSet` observer accesses the list of active complications from the complication server, 
and  tells the complication to reload its timeline—deleting the existing timeline and loading new data. 
The observer also saves the current drink list to disk.
  
## Schedule Background Refresh Tasks
  
To keep the app up to date with HealthKit, Coffee Tracker schedules a background refresh task 
every time the app goes into the background. 
  
``` swift
// Create the main view, and pass the model.
var body: some View {
    CoffeeTrackerView()
        .environmentObject(data)
        .onChange(of: scenePhase) { (phase) in
            switch phase {
            
            case .inactive:
                logger.debug("Scene became inactive.")
            
            case .active:
                logger.debug("Scene became active.")
                
                // Make sure the app has requested authorization.
                let model = CoffeeData.shared
                model.healthKitController.requestAuthorization { (success) in
                    
                    // Check for errors.
                    if !success { fatalError("*** Unable to authenticate HealthKit ***") }
                    
                    // Check for updates from HealthKit.
                    model.healthKitController.loadNewDataFromHealthKit { _ in }
                }
                
            case .background:
                logger.debug("Scene moved to the background.")
                
                // Schedule a background refresh task
                // to update the complications.
                scheduleBackgroundRefreshTasks()
                
            @unknown default:
                logger.debug("Scene entered unknown state.")
                assertionFailure()
            }
        }
}
```
  
The `scheduleBackgroundRefreshTasks` helper method schedules a background refresh update 
task for 15 minutes in the future.

``` swift
// Schedule the next background refresh task.

let scheduleLogger = Logger(subsystem: "com.example.apple-samplecode.Coffee-Tracker.watchkitapp.watchkitextension.scheduleLogger",
                            category: "Scheduler")

func scheduleBackgroundRefreshTasks() {
    
    scheduleLogger.debug("Scheduling a background task.")
    
    // Get the shared extension object.
    let watchExtension = WKExtension.shared()
    
    // If there is a complication on the watch face, the app should get at least four
    // updates an hour. So calculate a target date 15 minutes in the future.
    let targetDate = Date().addingTimeInterval(15.0 * 60.0)
    
    // Schedule the background refresh task.
    watchExtension.scheduleBackgroundRefresh(withPreferredDate: targetDate, userInfo: nil) { (error) in
        
        // Check for errors.
        if let error = error {
            scheduleLogger.error("An error occurred while scheduling a background refresh task: \(error.localizedDescription)")
            return
        }
        
        scheduleLogger.debug("Task scheduled!")
    }
}
```
  
To preserve battery life and maintain performance, 
WatchKit carefully budgets each app's time for background tasks. 
In general, if an app has a complication on the active watch face, it can safely schedule four background refresh tasks per hour.

## Handle Background Refresh Tasks

When the background task occurs, the system calls the extension delegate's [`handle(_:)`](https://developer.apple.com/documentation/watchkit/wkextensiondelegate/1650877-handle) method. 
The app then queries HealthKit for any changes, including any samples that have been deleted from HealthKit.
  
``` swift
// Check for updates from HealthKit.
let model = CoffeeData.shared

model.healthKitController.loadNewDataFromHealthKit { [unowned self] (success) in
    
    if success {
        // Schedule the next background update.
        scheduleBackgroundRefreshTasks()
        self.logger.debug("Background Task Completed Successfully!")
    }
    
    // Mark the task as ended, and request an updated snapshot, if necessary.
    backgroundTask.setTaskCompletedWithSnapshot(success)
}
```

After it has received and processed the data, the app schedules a new background task, 
and calls the current task's [`setTaskCompletedWithSnapshot(_:)`](https://developer.apple.com/documentation/watchkit/wkrefreshbackgroundtask/2868454-settaskcompletedwithsnapshot) method.
The app passes the `success` parameter to the handler's `setTaskCompletedWithSnapshot()` method to indicate whether the app should schedule an update to the app's snapshot, 
updating the app's appearance in the dock.

The app also checks for HealthKit updates whenever it enters the foreground.
