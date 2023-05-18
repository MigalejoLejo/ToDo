//
//  ContentView.swift
//  ToDo
//
//  Created by Miguel Alejandro Correa Avila on 17/5/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var taskList = [
        Task(title: "add a new task", priorityLevel: .high),
        Task(title: "reorganize tasks", priorityLevel: .high)
    ]
    
    @State private var showNewTask = false
    
    var body: some View {
        
        NavigationStack{
            VStack{
                NavigationView{
                    VStack{
                        List{
                            ForEach($taskList){item in
                                NavigationLink(destination: TaskDetailsView(task:item)
                                    .navigationTitle("Task Details")){
                                        HStack{
                                            
                                            // CHECKBOX
                                            Toggle(isOn: item.isDone) {
                                               Text("")
                                            }
                                            .toggleStyle(ToggleStyleCheckBox())

                                            // TITLE
                                            Text(item.title.wrappedValue)
                                                .foregroundColor(item.isDone.wrappedValue ? .green : .black)
                                                .strikethrough(item.isDone.wrappedValue)
                                            Spacer()
                                            
                                            getTaskPriorityLevel(task:item.wrappedValue)
                                            
                                            // FAVORITE
                                            Image(systemName:item.hasPriority.wrappedValue ? "star.fill" : "")
                                                .foregroundColor(item.hasPriority.wrappedValue ? .yellow : .black)
                                        }
                                }
                                .navigationTitle("Tasks List")
                              
                            }
                            .onDelete{index in
                                taskList.remove(atOffsets: index)
                            }
                            .onMove{ actualPos, nextPos in
                                taskList.move(fromOffsets: actualPos, toOffset: nextPos)
                            }
                            
                        }.navigationBarItems(trailing: EditButton())
                    }
                    
                }
                
                
                Button {
                    showNewTask.toggle()
                } label: {
                    VStack{
                        Image(systemName: "plus.circle")
                            .imageScale(.large)
                            .padding(4)
                        Text("Add Task")
                    }
                }.sheet(isPresented: $showNewTask){
                    NewTaskView(taskList: $taskList)
                }
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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
