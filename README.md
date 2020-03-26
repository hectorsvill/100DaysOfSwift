# iOS Notes and more
## Table of contents

* [StoreKit ](#StoreKit  )
* [CoreML](#CoreML)
* [ARKit](#ARKit)
* [EventKit](#EventKit)
* [UIKit](#UIKit)
* [Code Challenges 🧐](#Code-Challenges-🧐)
* [100DaysOfSwift](#100DaysOfSwift)

#
## StoreKit
    -  Go to developer account and under Certificates, Identifiers & Profiles create a new certificate (In-App Purchase automaticly selected)
    -  In appstoreconnect go to Feaures, under In-App Purchase add and select Non-Consumable
        - Set Product ID, Reference Name, Pricing, and add a Localization.
        - Create a new user by going to Users & Access, Under Sandbox Tester 
    - Under Singing&Cabilities, + Capability In-App-Purchase
    - Use Sandbox account for testing

#
## CoreML
 - [Image Recognition](https://github.com/hectorsvill/100DaysOfSwift/blob/master/ImageRecognition/ImageRecognition/ViewController.swift)
    - [Trained Models](https://developer.apple.com/machine-learning/models/)
        
            - Use Vision and CoreML to recognize images

#
## ARKit

- [AR Dice](https://github.com/hectorsvill/100DaysOfSwift/blob/master/ArDicee/ArDicee/ViewController.swift) 
    
        - touch on a  location of the plane to roll the dice, shake the phone to roll again

 - [AR Ruller](https://github.com/hectorsvill/100DaysOfSwift/blob/master/AR%20Ruller/AR%20Ruller/ViewController.swift)
        
        - Measure objects on vertical planes in CentiMeters using 2 SCNNode positions   
        
- [Pokemon 3D](https://github.com/hectorsvill/100DaysOfSwift/blob/master/Pokemon%203d/Pokemon%203d/ViewController.swift)

        - creating AR Resourcess
        - Image Tracking 
#
## EventKit
- [myCalendar](https://github.com/hectorsvill/100DaysOfSwift/tree/master/myCalendar)

        - Eventkit
        - EventStore
        - EkeCalendar

#

## UIKit
- [LayOuts_Animations](https://github.com/hectorsvill/100DaysOfSwift/tree/master/InsetItemGrid/InsetItemGrid/View%20Controllers)
        
        - UICollectionViewLayout, DiffableDataSource, UIViewControllerTransitioningDelegate
        - PinterestLayout Collection View
        - Circular Transition 
        - TableView animation
        
-  [Slide out Menu](https://github.com/hectorsvill/100DaysOfSwift/tree/master/slideMenu)

        - slide menu with smooth transition. (basic version for reference)

#
## Code Challenges 🧐
[Code Chanllenges](https://github.com/hectorsvill/100DaysOfSwift/tree/master/hackerrank.playground/Pages)
- Hackerrank
- leetcode

#

## 100DaysOfSwift 
### Challenge with [hackingwithswift.com](https://www.hackingwithswift.com/100)

#

[Coordinator Pattern]()

- [Lesson Video](https://www.youtube.com/watch?v=7HgbcTqxoN4)


#

- [TextTranform](https://github.com/hectorsvill/100DaysOfSwift/tree/master/TextTransformer)

    - Mac app
	
#

- [Project 24: Swift Strings](https://github.com/hectorsvill/100DaysOfSwift/tree/master/Project24)
```swift


extension String {
	func withPrefix(_ prefix: String) -> String {
		let check =  self.hasPrefix(prefix)
		if check {
			return self
		}
		print(check)
		return prefix + self
	}

	var isNumeric: Bool {
		for c in self {
			for i in 0...9 {
				if let n = Int(String(c)){
					if n == i { return true } }
			}
		}
		return false
	}

	func lineArray() -> [String] {
		var arr: [String] = []
		var newStr = ""

		for c in self {
			if c == "\n" {
				arr.append(newStr)
				newStr = ""
			} else {
				print(c)
				newStr += String(c)
			}
		}

		arr.append(newStr)
		return arr
	}

}
```

#

- [Project 22: Detect-a-Beacon](https://github.com/hectorsvill/100DaysOfSwift/tree/master/Project22/Project22)

        - Requesting location: Core Location
        - Hunting the beacon: CLBeaconRegion

#
- [Project 21: Local Notifications](https://github.com/hectorsvill/100DaysOfSwift/tree/master/Project21/Project21)

        - UNUserNotificationCenter, UNNotificationRequest
        - UNMutableNotificationContent, UNCalendarNotificationTrigger
        - UNTimeIntervalNotificationTrigger
        - Send reminders, prompts and alerts even when your app isn't running.
#
- [Project 20](https://github.com/hectorsvill/100DaysOfSwift/tree/master/Project20/Project20): Fireworks Night

        - Timer and follow()
        - SKEmitterNode
        - shake gesture 

![fireworks](https://github.com/hectorsvill/100DaysOfSwift/blob/master/images-readme/project20.gif)
#

- [Project 19: JavaScript Injection](https://github.com/hectorsvill/100DaysOfSwift/tree/master/Project19/Extension)

        - Making a shell app
        - Adding an extension: NSExtensionItem
        - Editing multiline text with UITextView
        - Fixing the keyboard: NotificationCenter
#

- [Milestone: Projects 16-18](https://github.com/hectorsvill/100DaysOfSwift/tree/master/MilestoneProjects13-15/MilestoneProjects13-15)
            
            - spritekit

![SpaceJam](https://github.com/hectorsvill/100DaysOfSwift/blob/master/images-readme/spacejamapp.gif)

#
- [Project 18](https://github.com/hectorsvill/100DaysOfSwift/tree/master/Project18/Project18): Debugging
        
        - Basic Swift debugging using print()
        - Debugging with assert()
        - Debugging with breakpoints
        - View debugging

#

- [Project 17](https://github.com/hectorsvill/100DaysOfSwift/tree/master/Project17/Project17): Space Race

        - SpriteKit
        - Timer, linearDamping, angularDamping
        - didBegin()

#

- [Project 16 ](https://github.com/hectorsvill/100DaysOfSwift/tree/master/Project16/Project16): Capital Cities
    
        - Up and running with MapKit
        - Annotations and accessory views: MKPinAnnotationView
        - Creating a WKWebView programmatically

#

 - [Milestone: Projects 13-15](https://github.com/hectorsvill/100DaysOfSwift/tree/master/FunCountryFacts/FunCountryFacts)

#
 - [Fun Country Facts App](https://www.hackingwithswift.com/guide/6/3/challenge)

        -  Programmatic UI
        - Created Json file holding all data
        - Parsing JSON using the Codable protocol
        - performSelector(inBackground: , performSelector(onMainThread:
        - UIView Extension for NSLayoutConstraint.activate
        - Core Animation: Transform: CGAffineTransform

![funcountryapp](https://github.com/hectorsvill/100DaysOfSwift/blob/master/images-readme/CountryFactList.gif)

#

- [Project 15](https://github.com/hectorsvill/100DaysOfSwift/tree/master/Project15/Project15): Animation

        - Switch, case, animate: animate(withDuration:)
        - Transform: CGAffineTransform
#
- [Project 14](https://github.com/hectorsvill/100DaysOfSwift/tree/master/Project14/Project14): Whack-a-Penguin
            
            - spritekit
            - SKCropNode
            - SKAction moveBy(x:y:duration:)
            - SKAction sequences
#

- [Project 13](https://github.com/hectorsvill/100DaysOfSwift/tree/master/Project13/Project13): Instafilter
    
        - Core Image, UISlider, writing to the photo library
        - Importing a picture
        - Applying filters: CIContext, CIFilter
        - Saving to the iOS photo library

#

- [Milestone: Projects 10-12](https://github.com/hectorsvill/100DaysOfSwift/tree/master/Projects10-12/Projects10-12) 
 - [Details](https://www.hackingwithswift.com/100/50)
        
        - You’ll need to make ViewController build on UITableViewController rather than just UIViewController.
         - Just like in project 10, you should create a custom type that stores an image filename and a caption string, then use either Codable or NSCoding to load and save that.
         - Use a UIAlertController to get the user’s caption for their image – a single text field is enough.
         - You’ll need to design your detail view controller using Interface Builder, then call instantiateViewController to load it when a table view row is tapped.

#

- [Project 12](https://github.com/hectorsvill/100DaysOfSwift/tree/master/Project12/Project12) : UserDefaults
           
           - Reading and writing basics: UserDefaults
            - [Fixing Project 10](https://github.com/hectorsvill/100DaysOfSwift/tree/master/Project12a/Project10): NSCoding
            - [Fixing Project 10](https://github.com/hectorsvill/100DaysOfSwift/tree/master/Project12b/Project10): Codable 

#

- [Project 11](https://github.com/hvillasa/Swift-Notes/tree/master/Project11/Project11) : Pachinko
    
        - Falling boxes: SKSpriteNode, UITouch, SKPhysicsBody
        - Bouncing balls: circleOfRadius
        - Spinning slots: SKAction
        - Collision detection: SKPhysicsContactDelegate
        - Scores on the board: SKLabelNode
        - Special effects: SKEmitterNode

#

- [Project 10](https://github.com/hvillasa/Swift-Notes/tree/master/Project10/Project10): Names to Faces

        - Designing UICollectionView cells
        - UICollectionView data sources
        - Importing photos with UIImagePickerController
        - Custom subclasses of NSObject

#

- [MILESTONE](https://github.com/hvillasa/Swift-Notes/tree/master/MILESTONE:PROJECTS7-9/MILESTONE:PROJECTS7-9) : PROJECTS 7-9
    
    - Build a HangMan game using UIKit
    - [Challenge Description](https://www.hackingwithswift.com/guide/4/3/challenge)

#

- [Project 9](https://github.com/hvillasa/Swift-Notes/tree/master/Project9/Project7) : Grand Central Dispatch
        
        - DispatchQueue
        - perform(inBackground:)

#

- [Project 8](https://github.com/hvillasa/Swift-Notes/tree/master/Project8/Project8) : Seven Swifty Words
    
        - addTarget()
        - enumerated()
        - count()
        - index(of:)
        - joined()
        - property observers
        - range operators

#

- [Project 7](https://github.com/hvillasa/Swift-Notes/tree/master/Project7/Project7) : Whitehouse Petitions

        - JSON
        - Data
        - UITabBarController

#

- [Project 6](https://github.com/hvillasa/Swift-Notes/tree/master/Project6b/Project6b) : Auto Layout
    
        - NSLayoutConstraint
        - Visual Format Language
        - layout anchors

#

- [Project 5](https://github.com/hvillasa/Swift-Notes/tree/master/Project5/Project5) : Word Scramble

        - Closures
        - method return values
        - booleans
        - NSRange

#

- [Project 4](https://github.com/hvillasa/Swift-Notes/tree/master/Project4/Project4) : Easy Browser
    
    - loadView()
    - WKWebView,
    - URLRequest
    - UIToolbar
    - UIProgressView
    - key-value observing

#

- [Project 3](https://github.com/hvillasa/Swift-Notes/tree/master/Project3/Project3) : Social Media
    
        - UIBarButtonItem
        - UIActivityViewController
        - URL

#

- [Project 2](https://github.com/hvillasa/Swift-Notes/tree/master/Project2/Project2) : Guess the Flag
    
        - Asset catalogs
        - UIButton, CALayer
        - UIColor
        - UIAlertController

#

[Project 1](https://github.com/hvillasa/Swift-Notes/tree/master/Project1/Project1) : Storm Viewer

    - Constants and variables
    - UITableView, UIImageView
    - FileManager, storyboards
    - User Defaults

#

- [Swift Notes](https://github.com/hvillasa/Swift-Notes/tree/master/Play-Notes) : Swift 4.2 notes

#
