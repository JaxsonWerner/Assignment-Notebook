//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Jaxson Werner on 1/28/26.
//

import SwiftUI

struct ContentView: View {
    @State private var assignmentItems = AssignmentItems()
    @State private var showingAddAssignemnt = false
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach(assignmentItems.items) { item in
                        HStack{
                            VStack(alignment: .leading, content: {
                                Text(item.course).font(.headline)
                                Text(item.description)
                                Text(item.dueDate, style: .date)
                            })
                        }
                        .foregroundStyle(.red)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(.black)
                        .cornerRadius(10)
                    }
                    .onMove(perform: { indices, newOffset in assignmentItems.items.move(fromOffsets: indices, toOffset: newOffset)
                    })
                    .onDelete(perform: { indexSet in assignmentItems.items.remove(atOffsets: indexSet)
                    })
                    
                }
                .sheet(isPresented: $showingAddAssignemnt) {
                    AddAssignmentView()
                        .environment(assignmentItems)
                    }
                Image("Bronco")
                }
                .navigationBarTitle("Bronco Notebook", displayMode: .inline)
                .navigationBarItems(leading: EditButton(), trailing: Button(action: { showingAddAssignemnt = true}, label: { Image(systemName: "plus")
                }))
            }
        }
}

#Preview {
    ContentView()
}
struct AssignmentItem: Identifiable, Codable {
    var id = UUID()
    var course = String()
    var description = String()
    var dueDate = Date()
}
