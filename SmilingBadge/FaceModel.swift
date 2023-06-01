import ARKit

struct FaceModel {
    var smileRight: Float = 0.0
    var smileLeft: Float = 0.0

    mutating func update(faceAnchor: ARFaceAnchor) {
        smileRight = Float(truncating: faceAnchor.blendShapes.first(where: { $0.key == .mouthSmileRight })?.value ?? 0)
        smileLeft = Float(truncating: faceAnchor.blendShapes.first(where: { $0.key == .mouthSmileLeft })?.value ?? 0)
    }

    var isSmiling: Bool {
        smileLeft > 0.3 || smileRight > 0.3
    }
}
