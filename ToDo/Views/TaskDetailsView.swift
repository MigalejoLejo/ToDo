//
//  TaskDetailsView.swift
//  ToDo
//
//  Created by Miguel Alejandro Correa Avila on 17/5/23.
//

import SwiftUI

struct TaskDetailsView: View {
    @Binding var task:Task
    
  
    var body: some View {
        NavigationView{
            ZStack{
                VStack(alignment: .leading){
                    VStack{
                        
                        
                        //HEADER
                        HStack{
                            Text("Title")
                                .bold()
                                .font(.title3)
                            Spacer()
                            getTaskPriorityLevel(task:task)
                            
                            Button {
                                task.hasPriority.toggle()
                            } label: {
                                Image(systemName:task.hasPriority ? "star.fill" : "star")
                                    .foregroundColor(task.hasPriority ? .yellow : .black)
                            }
                        }
                        
                        // TASKTITLE
                        if (task.isDone){
                            TextField("enter a title", text: $task.title )
                                .padding(.bottom)
                                .textFieldStyle(.roundedBorder)
                                .strikethrough()
                                .foregroundColor(.green)
                        } else {
                            TextField("enter a title", text: $task.title )
                                .padding(.bottom)
                                .textFieldStyle(.roundedBorder)
                        }
                        
                        // DESCRIPTION TITLE
                        HStack{
                            Text("Description")
                                .bold()
                                .font(.title3)
                            Spacer()
                            Text("(optional)")
                        }
                        
                        //DESCRIPTION
                        TextField("enter a description", text: $task.description, axis:.vertical )
                            .lineLimit(8...)
                            .textFieldStyle(.roundedBorder)
                    }.onTapGesture {
                        self.hideKeyboard()
                      }
                   // PRIORITY PICKER
                    Picker("Levels", selection: $task.priorityLevel) {
                        ForEach(Task.Level.allCases) { level in
                            Text(level.rawValue.capitalized)
                                .tag(level)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    // IS DONE
                    HStack{
                        Toggle(isOn: $task.isDone){
                            HStack{
                                Image(systemName: task.isDone ? "checkmark.circle" : "ellipsis")
                                    .foregroundColor(task.isDone ? .green : .black)
                                Text(task.isDone ? "Done!" : "Not done yet")
                                    .foregroundColor(task.isDone ? .green : .black)
                            }
                        }
                    }
                   
                   
                    
                  
                    Spacer()
                   
                }.padding()
                
            }
        }
       
    }
    
    @ViewBuilder func getTaskPriorityLevel (task : Task) ->  some View{
        switch task.priorityLevel{
        case .low: Image("")
        case .mid: Image(systemName: "exclamationmark.circle").foregroundColor(.yellow)
        case .high: Image(systemName: "exclamationmark.circle").foregroundColor(.red)
        }
    }
}

struct TaskDetailsView_Previews: PreviewProvider {
    @State static var testTask = Task(title: "This is a test", hasPriority: true, priorityLevel: .low)
    
    static var previews: some View {
        TaskDetailsView(task: $testTask)
    }
}
