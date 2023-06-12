import SwiftUI

struct TaskScreen: View {
    var body: some View {
        VStack {
            cardView(taskName: "Task 1", taskDescription: "Complete project deadline", taskMembers: 10)
            cardView(taskName: "Task 2", taskDescription: "Prepare presentation slides", taskMembers: 5)
        }
    }
    
    // Card View
    @ViewBuilder
    func cardView(taskName: String, taskDescription: String, taskMembers: Int) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.white)
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text(taskName)
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding(.leading, 4)
                        .padding()
                    
                    Spacer()
                    
                    ZStack {
                        Circle()
                            .frame(width: 30)
                            .foregroundColor(.black)
                            .padding()
                        
                        Button(action: {
                            // Action for next screen
                        }) {
                            Image(systemName: "arrowshape.right")
                                .foregroundColor(.white)
                        }
                    }
                }
                
                Text(taskDescription)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.horizontal, 16)
                    .padding(.top, -10)
                    .padding(.leading, 4)
                Spacer()
                
                HStack {
                    Image(systemName: "person.2.circle.fill")
                        .foregroundColor(.gray)
                        .padding(.leading, 16)
                    Text("\(taskMembers) Person")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                    
                    Spacer()
                    
                    Button(action: {
                        // Action for edit button
                    }) {
                        Image(systemName: "square.and.pencil")
                            .foregroundColor(.black)
                            .padding(.trailing, 16)
                    }
                    
                    Button(action: {
                        // Action for delete button
                    }) {
                        Image(systemName: "trash")
                            .foregroundColor(.black)
                            .padding(.trailing, 12)
                    }
                }
                .padding(.bottom, 12)
            }
        }
        .frame(height: 180)
        .padding(.top, 35)
    }
}

struct TaskScreen_Previews: PreviewProvider {
    static var previews: some View {
        TaskScreen()
    }
}
