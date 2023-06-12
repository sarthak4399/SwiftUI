import SwiftUI

struct Home: View {
    @State private var showTaskScreen = false
    
    var body: some View {
        NavigationView{
            ZStack {
                Color(.secondarySystemBackground)
                    .ignoresSafeArea()
                ScrollView {
                    VStack {
                        HStack {
                            Text("TaskStack")
                                .foregroundColor(Color.accentColor)
                                .font(.title)
                                .padding(.leading, 10)
                            Spacer()
                            Button(action: {
                                // Action for profile button
                            }) {
                                Image(systemName: "person.crop.circle")
                                    .font(.title)
                                    .foregroundColor(.black)
                            }
                        }
                        cardView()
                        cardView()
                        cardView()
                        Spacer()
                    }
                }
                .padding()
                .hideScrollViewIndicators() // Hide scroll bar
            }
        }

    }
        // Card View
        @ViewBuilder
        func cardView() -> some View {
            NavigationLink(
                destination: TaskScreen(),
                isActive: $showTaskScreen,
                label: { EmptyView() }
            )
            
            ZStack {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(Color.white)
                
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("Task1")
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
                                showTaskScreen = true
                            }) {
                                Image(systemName: "arrowshape.right")
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    
                    Text("Some Random Task")
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
                        Text("10 Person")
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

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

// Extension to hide scroll view indicators
extension View {
    func hideScrollViewIndicators() -> some View {
        #if os(iOS)
        return self.onAppear {
            UIScrollView.appearance().showsVerticalScrollIndicator = false
            UIScrollView.appearance().showsHorizontalScrollIndicator = false
        }
        #elseif os(macOS)
        return self.onAppear {
            NSScrollView.appearance().hasVerticalScroller = false
            NSScrollView.appearance().hasHorizontalScroller = false
        }
        #else
        return self
        #endif
    }
}
