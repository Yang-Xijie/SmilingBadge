import RealityKit
import SwiftUI

struct ContentView: View {
    @ObservedObject var frontCameraViewController = FrontCameraViewController()

    var body: some View {
        ZStack {
            FrontCameraView(frontCameraViewController: frontCameraViewController)
                .edgesIgnoringSafeArea(.all)
            SmilingBadgeView(isSmiling: frontCameraViewController.faceModel.isSmiling)
        }
    }
}

struct FrontCameraView: UIViewRepresentable {
    var frontCameraViewController: FrontCameraViewController

    func makeUIView(context _: Context) -> ARView {
        return frontCameraViewController.view
    }

    func updateUIView(_: ARView, context _: Context) {}
}

struct SmilingBadgeView: View {
    var isSmiling: Bool

    var body: some View {
        return VStack {
            Text(isSmiling ? "Smiling 😄" : "Not Smiling 😐")
                .padding()
                .foregroundColor(isSmiling ? .green : .red)
                .background(RoundedRectangle(cornerRadius: 25).fill(.regularMaterial))
            Spacer()
        }
    }
}
