//
//  ExternalLink.swift
//  FPT
//
//  Created by Kush Mirchandani on 8/4/23.
//

import SwiftUI
import WebKit

struct ExternalLink: View {
    @Binding var isPresented: Bool
    let link: String
    @State private var isLoading = true // Track loading state

    var body: some View {
        ZStack(alignment: .topTrailing) {
            WebViewContainer(link: link, isLoading: $isLoading)
                .edgesIgnoringSafeArea(.all)
                .statusBar(hidden: true) // Hide status bar to make WebView start from the top

            if isLoading {
                LoadingView()
            }

            Button(action: {
                isPresented = false
            }) {
                Image(systemName: "xmark.circle.fill")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .background(Color.black)
                                    .clipShape(Circle()) // Clip the button to a circle shape
                                    .padding(5) // Add padding around the button to make it smaller
                                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2) // Add a light shadow to the button
                                    .padding()
            }
            .padding(.top, 20)
        }
        .background(Color.black)
    }
}

struct WebViewContainer: UIViewRepresentable {
    let link: String
    @Binding var isLoading: Bool // Add a binding for the loading state

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        if let url = URL(string: link) {
            webView.load(URLRequest(url: url))
        }
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebViewContainer

        init(_ parent: WebViewContainer) {
            self.parent = parent
        }

        // Called when the WebView starts loading a page
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            parent.isLoading = true
        }

        // Called when the WebView finishes loading a page
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            parent.isLoading = false
        }
    }
}

// loading view
struct LoadingView: View {
    @State private var animationAmount: CGFloat = 0.0 // Add a state variable for the animation

    var body: some View {
        ZStack {
            Color.black // Set the background color to black
                .edgesIgnoringSafeArea(.all)

            VStack {
                Rectangle()
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color.white.opacity(0.8))
                    .cornerRadius(8)
                    .scaleEffect(animationAmount) // Apply the scale effect for animation
                    .onAppear {
                        withAnimation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true)) {
                            self.animationAmount = 1.2 // Start the animation when the view appears
                        }
                    }
            }
        }
    }
}




struct ExternalLink_Previews: PreviewProvider {
    static var previews: some View {
        ExternalLink(isPresented: .constant(true), link: "https://www.finepointtutoring.com")
    }
}

