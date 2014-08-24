//
//  SecondViewController.swift
//  DynamicTable
//
//  Created by Colodin on 01.08.14.
//  Copyright (c) 2014 Alexandru Colodin. All rights reserved.
//

import UIKit
import MapKit
class SecondViewController:  UIViewController {
    
    @IBOutlet var mapView: MKMapView!
    
    @IBOutlet var imgFlag: UIImageView!
    
    @IBOutlet var lblCapital: UILabel!
    
    @IBOutlet var lblLargestCity: UILabel!
    
    @IBOutlet var lblStatehood: UILabel!
    
    @IBOutlet var lblPopulation: UILabel!
    
    @IBOutlet var lblHouseSeat: UILabel!
    
    @IBOutlet var lblTotalArea: UILabel!
    
    @IBOutlet var lblLandArea: UILabel!
    
    var dateState = []
    var state = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let img : UIImage = UIImage(named: state)
        imgFlag.image = img
        lblCapital.text = dateState[0] as String
        lblLargestCity.text = dateState[1] as String
        lblStatehood.text = dateState[2] as String
        lblPopulation.text = dateState[3] as String
        lblHouseSeat.text = dateState[7] as String
        lblTotalArea.text = dateState[4] as String
        lblLandArea.text = dateState[5] as String
        
        var geocoder: CLGeocoder = CLGeocoder()
        geocoder.geocodeAddressString(state, completionHandler: {
            (placemarks, error) in
            if error {println("geocoder Address fail: \(error.localizedDescription)")}
            else
            {
                let placemark = placemarks as [CLPlacemark]
                let spanX = 2.0
                let spanY = 2.0
                let coord = CLLocationCoordinate2D(latitude: placemark[placemark.count-1].location.coordinate.latitude, longitude: placemark[placemark.count-1].location.coordinate.longitude)
                let span = MKCoordinateSpan(latitudeDelta: spanX, longitudeDelta: spanY)
                let region = MKCoordinateRegion(center: coord, span: span)
                self.mapView.setRegion(region, animated: true)
            
            }
            })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

}
    func setDateState(date:NSArray, state:String)
    {
        self.dateState = date
        self.state = state
    }
}