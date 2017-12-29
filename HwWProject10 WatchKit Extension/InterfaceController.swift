//
//  InterfaceController.swift
//  HwWProject10 WatchKit Extension
//
//  Created by Skyler Svendsen on 12/28/17.
//  Copyright © 2017 Skyler Svendsen. All rights reserved.
//

import WatchKit
import Foundation
import HealthKit

class InterfaceController: WKInterfaceController {

    @IBOutlet var activityType: WKInterfacePicker!
    
    let activities: [(String, HKWorkoutActivityType)] = [("Cycling", .cycling), ("Running", .running), ("Stairs", .stairs) , ("Walking", .walking), ("Swimming", .swimming)]
    var selectedActivity = HKWorkoutActivityType.cycling
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        var items = [WKPickerItem]()
        
        for activity in activities {
            let item = WKPickerItem()
            item.title = activity.0
            items.append(item)
        }
        
        activityType.setItems(items)
    }
    
    @IBAction func activityPickerChanged(_ value: Int) {
        selectedActivity = activities[value].1
    }
    
    @IBAction func startWorkoutTapped() {
        guard HKHealthStore.isHealthDataAvailable() else { return }
        
        WKInterfaceController.reloadRootPageControllers(withNames: ["WorkoutInterfaceController"], contexts: [selectedActivity], orientation: .horizontal, pageIndex: 0)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
