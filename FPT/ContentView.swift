//
//  ContentView.swift
//  FPT
//
//  Created by Kush Mirchandani on 7/29/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .home
    @State private var isLoading = true
    
    
    enum Tab {
        case home, guides, formulas, settings
    }
    
    var body: some View {
        //        if isLoading {
        //            LoadingView()
        //                .onAppear {
        //                    // Perform any necessary loading tasks here
        //                    // Once loading is done, set isLoading to false
        //                    DispatchQueue.main.asyncAfter(deadline: .now()+2) {
        //                        isLoading = false
        //                    }
        //                }
        //        }
        NavigationView {
            ZStack(alignment: .bottom) {
                TabView(selection: $selectedTab) {
                    HomeView()
                        .tag(0)
                        .tabItem {
                            CustomTabItem(iconName: "house.fill", iconSize: 30)
                        }
                    HomeView()
                        .tag(1)
                        .tabItem {
                            CustomTabItem(iconName: "book.fill", iconSize: 40)
                        }
                    HomeView()
                        .tag(3)
                        .tabItem {
                            CustomTabItem(iconName: "pencil.tip", iconSize: 50)
                        }
                    HomeView()
                        .tag(4)
                        .tabItem {
                            CustomTabItem(iconName: "gear", iconSize: 35)
                        }
                }
                .tint(.white)
            }
            .navigationBarHidden(true)
        }
    }
    
    struct CustomTabItem: View {
        let iconName: String
        let iconSize: CGFloat
        
        var body: some View {
            Image(systemName: iconName)
                .font(.system(size: iconSize))
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
}
