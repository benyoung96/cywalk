# CyWalk

CyWalk if an applicatoin that uses Djikstra's algorithum to find the shortest path between two buildings on the Iowa State University campus. Some of the buildings support inside paths. This allows the path from building A to building B go through a building if the path is shorter than going around the building.

![alt text](https://github.com/benyoung96/cywalk/blob/master/images/buildiings.png)
![alt text](https://github.com/benyoung96/cywalk/blob/master/images/regular_path.png)
![alt text](https://github.com/benyoung96/cywalk/blob/master/images/building_through_path.png)

# How to run

To run the application all you need to do is clone the application and input a Google Maps API key so the map will work. The API needs to be added to the AppDelegate.swift like the following:

```swift
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //google maps api key
        GMSServices.provideAPIKey("api_key")
        
        return true
    }
```

# User Location

CyWalk is intented for use on the Iowa State University campus. This matters because when the app first starts up the window of the map is located on the user's current location. To see the building overlays and to interact with them the user has to move to Ames, Iowa on the map which is just north of the capital Des Moines, Iowa.
