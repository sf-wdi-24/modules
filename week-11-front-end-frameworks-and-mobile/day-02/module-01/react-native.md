# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> React Native

| Objectives |
| :--- |
| Describe React Native's build process. |
| Explain similarities between React Native and web development. |

## Introduction

> React Native enables you to build world-class application experiences on native platforms using a consistent developer experience based on JavaScript and React. The focus of React Native is on developer efficiency across all the platforms you care about — learn once, write anywhere. Facebook uses React Native in multiple production apps and will continue investing in React Native. <a href="https://facebook.github.io/react-native/" target="_blank">React Native Docs</a>

An important word which is often used in mobile application is "Native". Native app is used to describe an application which has been developed for a specific platform. A native Android app will be an application programmed to run on the Android operating system.

When we're making web applications, they're typically not tied to a platform. They work on any system which recognizes JavaScript, HTML and CSS. You can use the web on phones, Apple systems, Windows systems, Linux systems, cars, airplanes and the International Space Station.

Native applications have some particular drawbacks. Native applications must be built in a programming language specific to a platform. On iOS this is likely Objective-C or Swift, while on Android it is typically Java. This means a native application developed for Android won't run on an iOS device. If you want a mobile application for your service you'll have to make two version of it.

Web applications can run on all these devices but have the drawback of being hella slow.

React Native is a bridge between the two; it offers natively compiled applications developed using JavaScript. This seems great, except it introduces a great deal of complexity.

### Resources

* <a href="https://medium.com/@sonnylazuardi/ionic-framework-hybrid-app-vs-react-native-4facdd93f690" target="_blank">Comparison of a WebView wrapped web app and React Native</a>

## Getting Started with React Native

Downloading the required utilities takes the majority of your free disk space and a solid afternoon. We won't be able to accomplish this in an afternoon so instead we'll look at some terms which are used in mobile development which are not common in web development.

We'll go over at a high level some of their getting started tutorial with a focus on new terms used:

* <a href="https://facebook.github.io/react-native/" target="_blank">React Native Getting Started</a>

### React Native Build Overview

In general, you'd develop your React application the same as while you're working on the web except you'll have an emulator or simulator window open at all times with your application loaded in it.

## Term Reference

Following are useful terms if you begin developing with React Native.

### Rage Shake

Getting angry at your phone and shaking it like it'll feel the pain it's inflicted on you. Often used as a shortcut to bring up a developer menu.

### Emulator

In order to test our applications locally we'll need to use either an emulator or a simulator which pretends it is the device we're testing on. Each native platform has a different set of emulators and simulators.

With React Native you'll likely use:

* <a href="https://www.genymotion.com/" target="_blank">Geny Motion</a>
* <a href="https://developer.apple.com/library/ios/documentation/IDEs/Conceptual/iOS_Simulator_Guide/Introduction/Introduction.html" target="_blank">iOS Simulator</a>

### Build Tools

We used `rake` in Ruby and have spoken a little about `grunt`. These tools make it easier to run commands automatically.

Native development requires many steps in order to build a professional application. These tools are called build tools.

### Design Tools (Layouts)

CSS is awesome! Well sorta but it doesn't work for native code. Instead there are design tools which help you to layout the code for different views in your application.

* <a href="http://www.toptal.com/ios/ios-user-interfaces-storyboards-vs-nibs-vs-custom-code" target="_blank">Apple UI Layout Tools</a>
* <a href="http://developer.android.com/sdk/installing/studio-layout.html" target="_blank">Android Layout Tool</a>

### Compiler

We've been using JavaScript and Ruby via interpreters, these systems interpret source code at runtime. Native mobile applications depend on compiled code in that platform's bytecode....

In order to get your source code to be in the bytecode of each mobile platform we use a compiler. The compiler takes in our source code and outputs and executable file which encapsulates our application's logic.

### Project Files

Each mobile application development ecosystem includes a number of project related files to control how things are built.

These project files are similar to `package.json` or `Gemfile` but may include more than dependency tracking.

### WebView

> A View that displays web pages. This class is the basis upon which you can roll your own web browser or simply display some online content within your Activity. It uses the WebKit rendering engine to display web pages and includes methods to navigate forward and backward through a history, zoom in and out, perform text searches and more. <a href="http://developer.android.com/reference/android/webkit/WebView.html" target="_blank">WebView</a>

If you need to use one, I'm sorry. This will likely be the slowest part of your app.

These are similar to using `iframe` elements to embed content from other sites.
