//
//  Task.swift
//  ToDo
//
//  Created by Miguel Alejandro Correa Avila on 17/5/23.
//

import Foundation
import SwiftUI


struct Task: Identifiable, Equatable{
    
    enum Level: String, CaseIterable, Identifiable {
        case low
        case mid
        case high

        var id: String { self.rawValue }
    }
    
    let id = UUID()
    var title:String
    var description:String = ""
    var isDone:Bool = false
    var hasPriority:Bool = false
    var priorityLevel:Level
    var priorityColor:Color = .black
}
