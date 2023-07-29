//
//  LibraryView.swift
//  FPT
//
//  Created by Kush Mirchandani on 8/8/23.
//

import SwiftUI
import PDFKit

struct LibraryView: View {
    var body: some View {
        NavigationView {
            List(pdfResources) { resource in
                NavigationLink(destination: PDFDetailView(resource: resource)) {
                    LibraryRow(resource: resource)
                }
            }
            .navigationBarTitle("Library")
        }
        .preferredColorScheme(.dark)
    }
}

struct PDFDetailView: View {
    let resource: PDFResource

    var body: some View {
        PDFKitView(url: resource.url)
            .navigationBarTitle(resource.name)
    }
}

struct PDFKitView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.document = PDFDocument(url: url)
        pdfView.autoScales = true
        pdfView.backgroundColor = UIColor.black // Set background color to black
        return pdfView
    }

    func updateUIView(_ uiView: PDFView, context: Context) {
        uiView.document = PDFDocument(url: url)
        uiView.autoScales = true
    }
}

struct LibraryRow: View {
    let resource: PDFResource

    var body: some View {
        HStack {
            Image(systemName: "book.fill")
                .font(.system(size: 24))
                .foregroundColor(Color(hex: "00000")) // Use your desired color
                .frame(width: 45, height: 60)
                .background(Color.white)
                .cornerRadius(8)
                .padding(.trailing, 10)

            Text(resource.name)
                .font(.headline)
        }
        .padding(.vertical, 25)
    }
}

struct PDFResource: Identifiable {
    let id = UUID()
    let name: String
    let url: URL
}

let pdfResources: [PDFResource] = [
    PDFResource(name: "Formula Guide", url: Bundle.main.url(forResource: "StudioFormulaGuide", withExtension: "pdf")!),
    PDFResource(name: "Writing Guide", url: Bundle.main.url(forResource: "Studio SAT Writing Quick Guide", withExtension: "pdf")!)
]

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}

//extension Color {
//    init(hex: String) {
//        let scanner = Scanner(string: hex)
//        var rgbValue: UInt64 = 0
//        scanner.scanHexInt64(&rgbValue)
//
//        let r = Double((rgbValue & 0xFF0000) >> 16) / 255.0
//        let g = Double((rgbValue & 0x00FF00) >> 8) / 255.0
//        let b = Double(rgbValue & 0x0000FF) / 255.0
//
//        self.init(red: r, green: g, blue: b)
//    }
//}

