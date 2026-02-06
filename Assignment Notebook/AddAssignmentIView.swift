//
//  AddAssignmentItem.swift
//  Assignment Notebook
//
//  Created by Jaxson Werner on 2/4/26.
//

import SwiftUI

struct AddAssignmentView: View {
    @Environment(AssignmentItems.self) var assignmentItems
    @Environment(\.dismiss) var dismiss
    static let courses = ["Math", "PLTW", "Mobile Apps", "Lunch", "Speech"]
    @State private var courses = ""
    @State private var description = ""
    @State private var dueDate = Date()
    var body: some View {
        NavigationView{
            Form{
                Picker("Courses", selection: $courses){
                    ForEach(Self.courses, id: \.self){
                        courses in Text(courses)
                    }
                }
                TextField("Description", text: $description)
                DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
            }
            .navigationBarTitle("Add new Assignment", displayMode: .inline)
            .navigationBarItems(trailing: Button("Save"){
                if courses.count > 0, description.count > 0{
                    let item = AssignmentItem(course: courses, description: description, dueDate: dueDate)
                    assignmentItems.items.append(item)
                    dismiss()
                }
            })
        }
    }
}
