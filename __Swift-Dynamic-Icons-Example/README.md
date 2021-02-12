# Dynamic-Icons-Example
Intro:
How to change your app icons programmatically
 
 
Pre requisites: 
Xcode build that supports iOS 10.3 or later
Icons

Figma is my go to design tool, there is an extension called “App Icon Toolkit” which exports your icon with the correct sizes as well as naming convention: <https://www.figma.com/community/file/824894885635013369>


Body: 
Create a new group called “AlternativeIcons” in Xcode to organize the alt icons. Each image should be available in both 2x (120 x120) and 3x (180 x 180) sizes, 1x size is optional. Please ensure to use the @2x and @3x naming convention that will allow iOS to automatically select the correct icon with the best resolution for the user’s device. 

***Note: Please ensure that these icons do not go inside the Asset catalogue. 
![image](https://user-images.githubusercontent.com/64371072/107161142-846cfc80-694f-11eb-8b75-ab2bf22dd208.png)

Next, create another Swift file called IconManager. In this file, we will create a class called IconManager that will contain three things - a constant, an enum, and a function. 
``` 
class IconManager {
    let application = UIApplication.shared
    
    // same naming convention in the plist to reference to actual files
    enum AppIcon: String {
        case charmanderIcon
        case pikachuIcon
    }
   
    func changeAppIcon(to appIcon: AppIcon) {
        application.setAlternateIconName(appIcon.rawValue)
    }
}
```
Next, go to the project navigator, right click on the Info.plist file, and choose open as Source Code. Scroll to the bottom until you see
```
</dict>
</plist>
```
Directly before </dict>, please add this long and intimidating code. Just kidding! I will explain in a little bit:
```
 <key>CFBundleIcons</key>
    <dict>
        <key>CFBundlePrimaryIcon</key>
        <dict>
            <key>CFBundleIconFiles</key>
            <array>
                <string>58-1</string>
            </array>
            <key>UIPrerenderedIcon</key>
            <false/>
        </dict>
        <key>CFBundleAlternateIcons</key>
        <dict>
            <key>charmanderIcon</key>
            <dict>
                <key>CFBundleIconFiles</key>
                <array>
                    <string>charmander</string>
                </array>
                <key>UIPrerenderedIcon</key>
                <false/>
            </dict>
            <key>pikachuIcon</key>
            <dict>
                <key>CFBundleIconFiles</key>
                <array>
                    <string>pikachu</string>
                </array>
                <key>UIPrerenderedIcon</key>
                <false/>
            </dict>
        </dict>
    </dict>
```
The key CFBundlePrimaryIcon refers to your default icon, the key CFBundleIconFiles refers to the file that contains your primary icon, and in between the two <string> tags should be the name of your primary icon. You can find this by going to your assets folder - AppIcons - find the 2x iPhone app icon  - right click -  select show in finder. Everything before .png should be the name of your image, excluding the 1x / 2x/ 3x naming convention. For example, my files are named 58-1@2x.png, so i would put 58-1 between the <string> tags. 

Moving on to CFBundleAlternateIcons.  In the example XML, I used the references "charmanderIcon" and "pikachuIcon" as keys because these are also the same as my cases in the IconManager.swift file. If you look inside of my changeAppIcon() function, I am setting the alternative icon names as the raw value of each case. As such, we have to use the same reference name inside our Info.plist file, so Xcode knows what to look for. Your file name inside AlternativeIcons group will go in between the <string> tags for the corresponding icon. 

The last thing we need to do is to add an action to the call-to-action buttons. Go to the ViewController where your buttons are located. 

First, make an instance of IconManager(): 
```
var appIconManager = IconManager()
```
And then, inside the @IBAction functions, we just have to call changeAppIcon() for the corresponding case. On the other hand, you could set the alternativeIconName to nil if you would like to reset it back to default.
```
  @IBAction func defaultIconTapped(_ sender: Any) {
        // Set the icons to default
        UIApplication.shared.setAlternateIconName(nil)
    }
    
    @IBAction func charmanderTapped(_ sender: Any) {
        appIconManager.changeAppIcon(to: .charmanderIcon)
    }
    
    @IBAction func pikachuTapped(_ sender: Any) {
        appIconManager.changeAppIcon(to: .pikachuIcon)
    }
    
 ```
When you run your project and tap on each alt icon button, you should see a pop up alert notifying you that icons have been changed successfully. 

![image](https://user-images.githubusercontent.com/64371072/107161148-964e9f80-694f-11eb-94af-639d0cde07ed.png)

![image](https://user-images.githubusercontent.com/64371072/107161154-a2d2f800-694f-11eb-9fe7-12fe682823e5.png)


