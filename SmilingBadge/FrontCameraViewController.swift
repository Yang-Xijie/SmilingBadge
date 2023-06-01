import ARKit
import RealityKit

class FrontCameraViewController: NSObject, ObservableObject {
    @Published var faceModel = FaceModel()

    var view = ARView(frame: .zero)

    override init() {
        super.init()
        view.session.run(ARFaceTrackingConfiguration())
        view.session.delegate = self
    }
}

extension FrontCameraViewController: ARSessionDelegate {
    func session(_: ARSession, didUpdate anchors: [ARAnchor]) {
        if let faceAnchor = anchors.first as? ARFaceAnchor {
            faceModel.update(faceAnchor: faceAnchor)
        }
    }
}
