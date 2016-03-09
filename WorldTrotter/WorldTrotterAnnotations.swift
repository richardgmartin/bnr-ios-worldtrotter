//
//  WorldTrotterAnnotations.swift
//  WorldTrotter
//
//  Created by Richard Martin on 2016-03-09.
//  Copyright © 2016 Richard Martin. All rights reserved.
//

import Foundation
import MapKit

class WorldTrotterAnnotation: NSObject, MKAnnotation {
    var coordinate = CLLocationCoordinate2D()
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
    
}
