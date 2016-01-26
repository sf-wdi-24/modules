# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Intro Swift

![apple](https://cloud.githubusercontent.com/assets/8397980/12562485/4dcc9c6c-c35a-11e5-98de-a56164ce0890.png)

| Objectives |
| :--- |
| Become familiar with the Xcode development environment. |
| Recognize the differences between Swift and other languages. |
| Manipulate different data types directly in Xcode. |

## What is Swift?

Swift is a multi-paradigm, compiled programming language created for iOS, OS X, watchOS and tvOS development by Apple Inc. Swift is designed to work with Apple's Cocoa and Cocoa Touch frameworks and the large body of existing Objective-C code written for Apple products. Swift is intended to be more resilient to erroneous code ("safer") than Objective-C and also more concise. Source: Wikipedia

## Getting started

Before we get started using Swift, we need to have the latest version of Xcode. You can head to the App Store and check if you have the latest version by clicking on the "Updates" icon. If you have the latest version, you should see "No Updates Available". If you need to upgrade, the Xcode icon will appear under "Pending Updates".

![xcodemenu](https://cloud.githubusercontent.com/assets/8397980/12566356/17c1ba4e-c36e-11e5-81fb-b674755f89ed.png)

When you start Xcode, you will be given three options. Choose the first option, "Get Started with a playground".

In the next menu, you'll want to create a name... let's say "FirstPlayground" and set the platform to "iOS". When you're ready, press "Next". You will then be prompted for where you want to save the file. Any location will do.

The file will be saved as `FirstPlayground.plaground`.  

## Syntax

For the duration of this demo we will be working in this playground environment.  

![playground](https://cloud.githubusercontent.com/assets/8397980/12565843/63ee1a28-c36b-11e5-8afe-af6987597b0b.png)

(an example of a playground in Xcode)

If you look at the initial playground window, you will notice the second line: `import UIKit`

This lets our playground or application know that we are using the Swift language.

## Data types

  * String

    ```swift-2
    var name: String
    name = "Chuck Norris"
    ```

  * Int

    ```swift-2
    var num: Int
    num = 32
    ```

  * Double

  * Float

    ```swift-2
    var latitude: Double
    latitude = 36.166667

    var longitude: Float
    longitude = -86.783333
    ```

  * Boolean

    ```swift-2
    var isInteresting: Bool
    isInteresting = true
    ```

## Demo

We'll be walking through a simple set up of a "Hello World" app. During the course of this demo, we'll become familiar with the Xcode environment for applications.

## Challenges

You have a choice!

You can either work on <a href="http://www.raywenderlich.com/114148/learn-to-code-ios-apps-with-swift-tutorial-1-welcome-to-programming" target="_blank">this</a> tutorial (followed by <a href="http://www.raywenderlich.com/115253/swift-2-tutorial-a-quick-start" target="_blank">this</a> tutorial), or you can work on preparing your <a href="https://github.com/sf-wdi-24/lightning-talks" target="_blank">lightning talk</a> for tomorrow.

## Resources

* <a href="https://developer.apple.com/swift" target="_blank">What is Swift?</a>
* <a href="http://www.learnswift.tips" target="_blank">A definitive resource for many Swift tutorials</a>
