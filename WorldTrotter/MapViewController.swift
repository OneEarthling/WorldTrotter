//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by User on 18.11.2020.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate  {
    
    var mapView: MKMapView!
    var userLocation: CLLocationManager!
    
    override func loadView() {
        mapView = MKMapView()
        view = mapView
        mapView.delegate = self
        userLocation = CLLocationManager()
        userLocation.requestWhenInUseAuthorization()
        mapView.showsUserLocation = true        
        
        let standardString = NSLocalizedString("Standard", comment: "Standard map view")
        let hybridString = NSLocalizedString("Hybrid", comment: "Hybrid map view")
        let satelliteString = NSLocalizedString("Satellite", comment: "Satellite map view")
        let segmentedControl = UISegmentedControl(items: [standardString, hybridString, satelliteString])
        
        segmentedControl.backgroundColor = UIColor.systemBackground
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.addTarget(self, action: #selector(mapTypeChanged(_:)), for: .valueChanged)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
        let margins = view.layoutMarginsGuide
        
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
        // adding toggle
        let label = UILabel()
        let toggle = UISwitch()
        let labelString = NSLocalizedString("Points of Interest", comment: "Points of Interest label")
        label.text = labelString
        label.translatesAutoresizingMaskIntoConstraints = false
        toggle.translatesAutoresizingMaskIntoConstraints = false
        toggle.addTarget(self, action: #selector(toggleChanged(_:)), for: .valueChanged)

        view.addSubview(label)
        view.addSubview(toggle)
        
        let labelTopConstraint = label.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 8)
        let labelLeadingConstraint = label.leadingAnchor.constraint(equalTo: segmentedControl.leadingAnchor)
        let toggleTopConstraint = toggle.centerYAnchor.constraint(equalTo: label.centerYAnchor)
        let toggleLeadingConstraint = toggle.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 8)
        labelTopConstraint.isActive = true
        labelLeadingConstraint.isActive = true
        toggleTopConstraint.isActive = true
        toggleLeadingConstraint.isActive = true
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let span = MKCoordinateSpan(latitudeDelta: 0.08, longitudeDelta: 0.08)
        let theRegion = MKCoordinateRegion(center: userLocation.coordinate, span: span)
        mapView.setRegion(theRegion, animated: true)
    }
    
    @objc func toggleChanged(_ toggle: UISwitch){
        if toggle.isOn {
            mapView.pointOfInterestFilter = .includingAll
        } else {
            mapView.pointOfInterestFilter = .excludingAll
        }
    }
    
    @objc func mapTypeChanged(_ segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex{
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }
}
