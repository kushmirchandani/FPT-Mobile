//
//  HomeView.swift
//  FPT
//
//  Created by Kush Mirchandani on 7/29/23.
//

import SwiftUI

struct ActionCard: View {
    var title: String
    var color: Color
    var imageName: String
    var action: () -> Void // Add a closure that represents the action to be performed on tap

    var body: some View {
        VStack {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .padding()
                .background(color)
                .clipShape(Circle())
                .onTapGesture {
                    // Call the action closure when the card is tapped
                    action()
                }
            
            Text(title)
                .foregroundColor(.white)
                .font(.headline)
                .multilineTextAlignment(.center)
        }
        .frame(width: 120, height: 150)
        .cornerRadius(15)
    }
}

struct HomeView: View {
    @State private var horizontalWeekHeight: CGFloat = 0
    @State private var showBooking = false
    @State private var showPortal = false
    @State private var showFormulasView = false
    @State private var showLibraryView = false

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Welcome header
                ZStack(alignment: .topLeading) {
                    Rectangle()
                        .foregroundColor(Color(hex: "6594A1"))
                        .cornerRadius(25)
                        .frame(height: horizontalWeekHeight + 320) // Adjust the height dynamically based on the horizontalWeekHeight
                        .offset(y: -80)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(getFormattedCurrentDate())
                            .foregroundColor(.white.opacity(0.5))
                            .font(.callout)
                            .padding(.leading)
                        testDateCountdown()
                            .padding(.leading)
                            .font(.callout)
                            .foregroundColor(.white.opacity(0.8))
                        Text(getGreetingMessage())
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .bold()
                            .padding()
                        horizontalWeek()
                    }
                    .padding(.leading, 5)
                    .padding(.top)
//                    .alignmentGuide(.top) { d in
//                        // Use alignment guide to adjust the offset dynamically based on the horizontalWeekHeight
//                        if horizontalWeekHeight == 0 {
//                            return d[.top] - 50
//                        } else {
//                            return d[.top]
//                        }
//                    }
                }
                .padding(.top, 5)
                
                
                // Action cards for quick actions (inside a ScrollView)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 5) {
//                        ActionCard(title: "Formulas", color: Color(hex: "3B82F7"), imageName: "doc.text"){
//                            showFormulasView.toggle()
//
//                        }
//                        .sheet(isPresented: $showFormulasView) {
//                                        // Present the FormulasView using the sheet modifier
//                                        FormulasView()
//                                    }
                        ActionCard(title: "Library", color: Color(hex: "68CE67"), imageName: "book"){
                            showLibraryView.toggle()
                        }
                        .sheet(isPresented: $showLibraryView) {
                                        // Present the FormulasView using the sheet modifier
                                        LibraryView()
                                    }
                        ActionCard(title: "Booking", color: Color(hex: "B260EA"), imageName: "calendar"){
                            showBooking = true
                        }
                        .sheet(isPresented: $showBooking) {
                                            // Present the ExternalLink view using the sheet modifier
                                            ExternalLink(isPresented: $showBooking, link: "https://www.finepointtutoring.com/studio-app/book")
                                        }
                        ActionCard(title: "Portal", color: Color(hex: "F2A33C"), imageName: "globe"){
                            showPortal = true
                        }
                        .sheet(isPresented: $showPortal) {
                                            // Present the ExternalLink view using the sheet modifier
                                            ExternalLink(isPresented: $showPortal, link: "https://www.finepointtutoring.com/studio-app/profile")
                                        }
                    }
                    .padding(.horizontal)
                }
                .offset(y:-100)
                
//                VStack {
//                                Text("Bubble Sheet")
//                                    .font(.title)
//                                    .padding()
//
//                                NavigationLink("Start Bubble Sheet", destination: BubbleSheetView())
//                                    .padding()
//                            }
                
                Spacer()
            }
            .navigationBarTitle("")
        }
        .preferredColorScheme(.dark)
    }
    
    // Function to get the current date in the desired format
    private func getFormattedCurrentDate() -> String {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, d MMMM yyyy"
        return dateFormatter.string(from: currentDate)
    }
    
    // Function to get the greeting message based on the time of the day
    private func getGreetingMessage() -> String {
        let hour = Calendar.current.component(.hour, from: Date())
        switch hour {
        case 0..<12:
            return "Good Morning"
        case 12..<17:
            return "Good Afternoon"
        default:
            return "Good Evening"
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

// Extension to create a Color from a hexadecimal string
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let r = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let g = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let b = Double(rgbValue & 0x0000FF) / 255.0

        self.init(red: r, green: g, blue: b)
    }
}
