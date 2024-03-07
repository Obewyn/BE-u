# BE-u
# Author : https://linktr.ee/obewyn



BE-u is an app that enables users to produce unedited short videos, which are immediately uploaded and shared with the user's subscribers, without the ability to preview the video. Users respond to shared content by sending "reactions", photographs of themselves, back to the video uploader .

Main.storyboard file contain the designed user interface elements. elements are connected to ViewController.swift file by creating outlets and actions as needed to handle user interactions and update the UI programmatically

representation of the storyboard:

There is a ViewController containing a UIView for displaying the camera preview and a UIButton for recording videos.
The UIView has a gray background color and occupies the top portion of the screen.
The UIButton is positioned below the UIView and labeled "Record".

necessary keys for camera and microphone permission are in Info.plist 

In this Info.plist file:

<key>NSCameraUsageDescription</key>: Describes why your app requires access to the device's camera. This key is required for accessing the camera.
<key>NSMicrophoneUsageDescription</key>: Describes why your app requires access to the device's microphone. This key is required if your app records audio.
Make sure to replace "This app requires access to your camera to record videos." and "This app requires access to your microphone to record audio." with appropriate descriptions for your app's use case.

You can add these keys to your Info.plist file by opening it in Xcode and selecting the "+" button to add a new row, then entering the key-value pairs as shown above.
