//
//  GoogleMapsViewController.swift
//  CyWalk
//
//  Created by John W. Fleiner on 10/2/16.
//  Copyright © 2016 John W. Fleiner. All rights reserved.
//
import UIKit
import GoogleMaps

var map_view = GMSMapView()

class GoogleMapsViewController: UIViewController {
    
    var locationManager = CLLocationManager()
   
    var closest_intersection = Intersection()
    var flag = false;
    var testArray = [Building]()
    var gps_id = [Gps_Id]()
    var didFindMyLocation = false
    
    var polylineOverlays = [GMSPolyline]()
    var circOverlays = [GMSCircle]()
    var buildingOverlay = [GMSPolygon]()
    
    var buildingFromList = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLocationManager()
        setupMapView()
        setupBuildingOverlays()
    }
    
}

// MARK: - Setup Methods
extension GoogleMapsViewController {
    
    fileprivate func setupMapView() {
        let camera = GMSCameraPosition.camera(withLatitude: 42.026465, longitude: -93.646542, zoom: 16.0)
        map_view = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        map_view.isMyLocationEnabled = true
        map_view.delegate = self
        view = map_view
    }
    
    fileprivate func setupBuildingOverlays() {
        let paths = Paths()
        paths.initPaths()
        
        let intersections = Intersections()
        intersections.initIntersections()
        
        let buildings = Buildings()
        buildings.initBuildings()
        
        plotBuildings()
    }
    
    fileprivate func setupLocationManager() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}

// MARK: - ControllerType Methods
extension GoogleMapsViewController: ControllerType {
    
    static func create() -> UIViewController {
        let vc = GoogleMapsViewController()
        return vc
    }
}

// MARK: - CLLocationManageDelegate
extension GoogleMapsViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
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
}

// MARK: - Plotting Methods
extension GoogleMapsViewController {
    
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
    
    func plotDijkstras() {
        
        let dijkstra = Dijkstra.init()
        
        gps_id = dijkstra.dijkstra_algorithm(s_location: testArray[0].intersection, end_location: testArray[1].intersection, array: list_of_Intersections)
        
        clearPolylines()
        clearCircles()
        plotPath()
        plotIntersections()
    }
}

// MARK: - Finding Methods
extension GoogleMapsViewController {
    
    /* Finds building given string name */
    func findBuilding(_ name: String) -> Building? {
        for building in list_of_buildings where building.name == name {
            return building
        }
        return nil
    }
}

// MARK: - Clear Map Methods
extension GoogleMapsViewController {
    
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
}

// MARK: - GMSMapViewDelegate Methods
extension GoogleMapsViewController: GMSMapViewDelegate {
    
    /* On building click functionality */
    func mapView(_ mapView: GMSMapView, didTap overlay: GMSOverlay) {
        
        let building = findBuilding(overlay.title!)
        testArray.append(building!)
        
        if testArray.count == 2 {
            clearBuildings()
            plotDijkstras()
            testArray = []
        }
        else if testArray.count == 1 && flag == true {
            clearBuildings()
            let building = Building()
            let center = locationManager.location?.coordinate
            building.initBuilding(buildingId: 100, center: center!, coordinates: [], intersection: closest_intersection, name: "user location")
            testArray.append(building)
            plotDijkstras()
            testArray = []
            flag = false;
        }
    }
}
