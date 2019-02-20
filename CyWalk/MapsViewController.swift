//
//  GoogleMapsViewController.swift
//  CyWalk
//
//  Created by John W. Fleiner on 10/2/16.
//  Copyright © 2016 John W. Fleiner. All rights reserved.
//
import UIKit
import GoogleMaps


/* global variable */
var map_view = GMSMapView()


class GoogleMapsViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, GMSMapViewDelegate, CLLocationManagerDelegate, ControllerType {
    var locationManager = CLLocationManager()
    /*this is called when the user grants or revokes location permissions */
   
     var closest_intersection = Intersection();
    var flag = false;
    var testArray = [Building]()
    var gps_id = [Gps_Id]()
    var buildingsArray = [String]()
    /* location manage and didFineMyLocation is use to find out a users
      * location on the map*/
    var didFindMyLocation = false
    
    var polylineOverlays = [GMSPolyline]()
    var circOverlays = [GMSCircle]()
    var buildingOverlay = [GMSPolygon]()
    
//    let screenHeight = UIScreen.main.bounds.height
    
    //UI buttons at button right of the screen
//    var GPSimage = UIImage(named: "GPS Device Filled-50.png")
//    var GPSButton: UIButton = UIButton(frame: CGRect(x: 15, y: screenHeight - 110, width: 40, height: 40))
//    var scheduleImage = UIImage(named: "Calendar-50.png")
//    var scheduleButton: UIButton = UIButton(frame: CGRect(x: 15, y: screenHeight - 160, width: 40, height: 40))
//    var searchImage = UIImage(named: "Search-100.png")
//    var searchButton: UIButton = UIButton(frame: CGRect(x: 15, y: screenHeight - 210, width: 40, height: 40))
    
    var buildingFromList = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* UI elements */
//        //GPS button
//        GPSButton.backgroundColor = UIColor.white
//        GPSButton.isUserInteractionEnabled = true
//        GPSButton.isEnabled = true
//        GPSButton.layer.borderColor = UIColor.lightGray.cgColor
//        GPSButton.layer.borderWidth = 1.0
//        GPSButton.layer.cornerRadius = 20.0
//        GPSButton.setImage(GPSimage, for: .normal)
//        GPSButton.imageEdgeInsets = UIEdgeInsets(top: 32, left: 32, bottom: 32, right: 32)
//        GPSButton.addTarget(self, action: #selector(GoogleMapsViewController.gpsAction(_:)), for: UIControlEvents.touchUpInside)
//        self.view.addSubview(GPSButton)
//        self.view.bringSubview(toFront: GPSButton)
//
//        //schedule button
//        scheduleButton.backgroundColor = UIColor.white
//        scheduleButton.isUserInteractionEnabled = true
//        scheduleButton.isEnabled = true
//        scheduleButton.layer.borderColor = UIColor.lightGray.cgColor
//        scheduleButton.layer.borderWidth = 1.0
//        scheduleButton.layer.cornerRadius = 20.0
//        scheduleButton.setImage(scheduleImage, for: .normal)
//        scheduleButton.imageEdgeInsets = UIEdgeInsets(top: 33, left: 33, bottom: 33, right: 33)
//        scheduleButton.addTarget(self, action: #selector(GoogleMapsViewController.scheduleAction(_:)), for: UIControlEvents.touchUpInside)
//        self.view.addSubview(scheduleButton)
//        self.view.bringSubview(toFront: scheduleButton)
//
//        //search button
//        searchButton.backgroundColor = UIColor.white
//        searchButton.isUserInteractionEnabled = true
//        searchButton.isEnabled = true
//        searchButton.layer.borderColor = UIColor.lightGray.cgColor
//        searchButton.layer.borderWidth = 1.0
//        searchButton.layer.cornerRadius = 20.0
//        searchButton.setImage(searchImage, for: .normal)
//        searchButton.imageEdgeInsets = UIEdgeInsets(top: 35, left: 35, bottom: 35, right: 35)
//        searchButton.addTarget(self, action: #selector(GoogleMapsViewController.searchAction(_:)), for: UIControlEvents.touchUpInside)
//        self.view.addSubview(searchButton)
//        self.view.bringSubview(toFront: searchButton)
        
        //loop through the buildingsArray and draw each building on the map
//        var bArray = [String]()
//        bArray = BuildingHandler().getAllBuildingNames()
//        for building in bArray {
//            if bArray.isEmpty {
//                print("yes")
//            }
//            //get building id from data base
//            let ID = BuildingHandler().getbuildingID(buildingName: building)
//            var coordArray = [CLLocationCoordinate2D]()
//            coordArray = BuildingHandler().getBuildingCoords(buildingID: ID)
//            
//            //draw the building
//            let shape = GMSMutablePath()
//            for CLLocationCoordinate2D in coordArray {
//                shape.add(CLLocationCoordinate2D)
//            }
//            let polygon = GMSPolygon(path: shape)
//            polygon.fillColor = UIColor.darkGray
//            polygon.strokeColor = UIColor.black
//            polygon.strokeWidth = 2
//            polygon.map = map_view
//        }
    

   

        /*request permission to location a user postion on the map */
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()


    }
    
    static func create() -> UIViewController {
        let vc = GoogleMapsViewController()
        return vc
    }
    
    //function that is called when the user taps the GPS icon
    func gpsAction (_ sender: UIButton) {
        flag = true;
        closest_intersection = Intersection();
        var smallest_length = 100000.0;
        
        for intersection in list_of_Intersections {
            
            if (locationManager.location != nil) {
                
                let length = distance(latitude1: intersection.center.latitude, latitude2: (locationManager.location?.coordinate.latitude)!, longitude1: intersection.center.longitude, longitude2: (locationManager.location?.coordinate.longitude)!)
                
                if (length < smallest_length) {
                    smallest_length = length
                    closest_intersection = intersection;
                }
            }
            else {
                flag = false;
            }
        }
    }
    
    func distance(latitude1: Double, latitude2: Double, longitude1: Double, longitude2: Double) -> Double {
        
        return sqrt((pow((latitude1-latitude2), 2) + pow(longitude1-longitude2, 2)))
    }
    
    @objc(locationManager:didChangeAuthorizationStatus:) func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        /* you verify the user has granted yu permission while the app is in use*/
        if status == .authorizedWhenInUse{
            /* after permission has been established, ask the location manger for updates on user's lacation */
            locationManager.startUpdatingLocation()
            
            /* this draws a light bule dot where the use is located */
            map_view.isMyLocationEnabled = true
    /*this adds a button to the map that when tapped centers the map to users location */
            map_view.settings.myLocationButton = true
        }
    }
    
    /* exectues when the location manger receives new location data */
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        
        if let location = locations.first{
            /* this updates the maps camera to center around the user's postion */
            map_view.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
            /* tell location manager you no longer interested in updates */
            locationManager.stopUpdatingLocation()
        }
    }
    
    override func loadView() {
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: 42.026465, longitude: -93.646542, zoom: 16.0)
        map_view = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        map_view.isMyLocationEnabled = true
        map_view.delegate = self
        view = map_view
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()

        
        
        /* Initialize paths */
        let paths = Paths()
        paths.initPaths()
        
        /* Initialize Intersections */
        let intersections = Intersections()
        intersections.initIntersections()

        /* Initialize Buildings */
        let buildings = Buildings()
        buildings.initBuildings()
        
        plotBuildings()
    }
    
    func plotBuildings() {
        for building in list_of_buildings {
            
            let line = GMSMutablePath()
            
            for coord in building.coordinates {
                line.add(coord)
            }
            
            let polygon = GMSPolygon(path: line)
            polygon.title = building.name
            polygon.fillColor = UIColor.darkGray
            polygon.strokeColor = UIColor.black
            polygon.isTappable = true
            polygon.map = self.view as! GMSMapView?
        }
    }
    
    //draw the building with the given building name
    //taking that name getting the cooresponding building ID
    //and using the building ID to get the building coordinates
    func drawBuildings(buildingsID: Int){
        let buidingCoords = [CLLocationCoordinate2D]()
        //buidingCoords = getBuildingCoords(buildingID: buildingsID)
        let shape = GMSMutablePath()
        for CLLocationCoordinate2D in buidingCoords{
            shape.add(CLLocationCoordinate2D)
        }
        let polygon = GMSPolygon(path: shape)
        polygon.fillColor = UIColor.red
        polygon.strokeColor = UIColor.yellow
        polygon.strokeWidth = 2
        polygon.map = map_view
    }
    
    //create GMSPolyline object and add the coordinates of the path to it
    //return polyline
    func drawPolyline(coord: [CLLocationCoordinate2D]){
        let path = GMSMutablePath()
        for CLLocationCoordinate2D in coord {
            path.add(CLLocationCoordinate2D)
        }
        let polyline = GMSPolyline(path: path)
        polyline.map = map_view
    }
    
    /* Finds building given string name */
    func findBuilding(_ name: String) -> Building! {
        
        for building in list_of_buildings {
            
            if (building.name == name) {
                return building
            }
        }
        return nil;
    }
    
    /* On building click functionality */
    func mapView(_ mapView: GMSMapView, didTap overlay: GMSOverlay) {
        
        let building = findBuilding(overlay.title!)
        testArray.append(building!)
        
        if (testArray.count == 2) {
            clearBuildings()
            plotDijkstras()
            testArray = [Building]()
        }
        else if(testArray.count == 1 && flag == true) {
            clearBuildings()
            let building = Building()
            let center = locationManager.location?.coordinate
            building.initBuilding(buildingId: 100, center: center!, coordinates: [], intersection: closest_intersection, name: "user location")
            testArray.append(building)
            plotDijkstras()
            testArray = [Building]()
            flag = false;
            
        }
    }
    
    func plotPath() {
        var i = 0;
        while (i < gps_id.count) {
            
            let line = GMSMutablePath()
            let path = list_of_paths[gps_id[i].get_pathid()]
            
            for coord in path.coordinates {
                line.add(coord)
            }
            
            var polyline = GMSPolyline(path: line)
            polyline.strokeColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
            polyline.strokeWidth = 8.0
            polyline.map = self.view as! GMSMapView?
            polylineOverlays.append(polyline)
            
            polyline = GMSPolyline(path: line)
            polyline.strokeColor = UIColor(red: 200/255, green: 0/255, blue: 0/255, alpha: 1)
            polyline.strokeWidth = 4.0
            polyline.map = self.view as! GMSMapView?
            polylineOverlays.append(polyline)
            

            
            
            i += 1
        }
    }
    
    func plotIntersections() {
        var i = 0;
        while (i < gps_id.count) {
            let circ = GMSCircle()
            let intersection = list_of_Intersections[gps_id[i].getInterection_id()]
            
            circ.position = intersection.center
            circ.radius = 2
            circ.fillColor = UIColor.black
            circ.strokeColor = UIColor.black
            circ.map = self.view as! GMSMapView?
            circOverlays.append(circ)
            i += 1
        }
        let circ = GMSCircle()
        circ.position = testArray[0].intersection.center
        circ.radius = 2
        circ.fillColor = UIColor.black
        circ.strokeColor = UIColor.black
        circ.map = self.view as! GMSMapView?
        circOverlays.append(circ)
    }
    
    
    func clearBuildings() {
        
        for overlay in buildingOverlay {
            
            overlay.map = nil
        }
        buildingOverlay = [GMSPolygon]()
    }
    
    func clearPolylines() {
        
        for line in polylineOverlays {
            
            line.map = nil
        }
        polylineOverlays = [GMSPolyline]()
    }
    
    func clearCircles() {
        
        for circ in circOverlays {
            
            circ.map = nil
        }
        circOverlays = [GMSCircle]()
    }
    
    func plotDijkstrasSched() {
        
        let dijkstra = Dijkstra.init()
        
        gps_id = dijkstra.dijkstra_algorithm(s_location: testArray[0].intersection, end_location: testArray[1].intersection, array: list_of_Intersections)
        
        print("Start: \(testArray[0].intersection.getIntersectionId())")
        
        for obj in gps_id {
            
            print("obj: \(obj.get_pathid())")
        }
        
        plotPath()
        plotIntersections()
    }
    
    
    func plotDijkstras() {
        
        let dijkstra = Dijkstra.init()
        
        gps_id = dijkstra.dijkstra_algorithm(s_location: testArray[0].intersection, end_location: testArray[1].intersection, array: list_of_Intersections)
        
        print("Start: \(testArray[0].intersection.getIntersectionId())")
        
        for obj in gps_id {
            
            print("obj: \(obj.get_pathid())")
        }
        
        clearPolylines()
        clearCircles()
        plotPath()
        plotIntersections()
    }
}
