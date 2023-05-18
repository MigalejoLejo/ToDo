//
//  TaskDetailsView.swift
//  ToDo
//
//  Created by Miguel Alejandro Correa Avila on 17/5/23.
//

import SwiftUI


struct NewTaskView: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var taskList:[Task]
    
    @State var newTitle = ""
    @State var newDescription = ""
    @State var newLevel:Task.Level = .low
    
    var body: some View {
        
        ZStack{
            VStack(alignment: .leading){
                HStack{
                    Spacer()
                    Button {
                        dismiss()
                    } label: {
                        VStack{
                            Image(systemName: "xmark.circle")
                                .imageScale(.large)
                                .padding(4)
                                .foregroundColor(.gray)
                        }
                    }
                }
                
                Text("Title")
                    .bold()
                    .font(.title)
                TextField("enter a title", text: $newTitle )
                    .padding(.bottom)
                    .textFieldStyle(.roundedBorder)
                    .onTapGesture {
                        self.hideKeyboard()
                      }

                
                
                HStack{
                    Text("Description")
                        .bold()
                        .font(.title3)
                    Spacer()
                    Text("(optional)")
                }
                TextField("enter a description", text: $newDescription, axis:.vertical )
                    .lineLimit(8...)
                    .textFieldStyle(.roundedBorder)
                    .onTapGesture {
                        self.hideKeyboard()
                      }

               
                
                Picker("Levels", selection: $newLevel) {
                    ForEach(Task.Level.allCases) { level in
                        Text(level.rawValue.capitalized)
                            .tag(level)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                HStack{
                    Spacer()
                    Button("Add Task"){
                        taskList.append(Task(title: newTitle, description:newDescription, priorityLevel: newLevel))
                        dismiss()
                    }
                    Spacer()
                }
                .padding()
               
                Spacer()
            }
            .padding()
            .onTapGesture {
                self.hideKeyboard()
              }

                
        }.onTapGesture {
            self.hideKeyboard()
          }

       
    }
}


struct NewTaskView_Previews: PreviewProvider {
    
    @State static var taskList:[Task] = []

    
    static var previews: some View {
        NewTaskView(taskList: $taskList)
    }
}

