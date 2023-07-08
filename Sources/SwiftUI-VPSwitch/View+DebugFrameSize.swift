import SwiftUI

@available(iOS 13.0, *)
extension View {
    func debugFrameSize() -> some View {
        modifier(FrameSize())
    }
    func debugFrameSizeHighlighted() -> some View {
        modifier(FrameSize(color: .red, bold: true, lineWidth: 2))
    }
}

@available(iOS 13.0, *)
private struct FrameSize: ViewModifier {
    var color: Color = .blue
    var bold: Bool = false
    var lineWidth: CGFloat = 1
    
    func body(content: Content) -> some View {
        if true {
            content
                .overlay(GeometryReader(content: overlay(for:)))
        } else {
            content
        }
    }
    
    func overlay(for geometry: GeometryProxy) -> some View {
        ZStack(
            alignment: Alignment(horizontal: .trailing, vertical: .top)
        ) {
            Rectangle()
                .strokeBorder(
                    style: StrokeStyle(lineWidth: lineWidth, dash: [5])
                )
                .foregroundColor(color)
            Text("\(Int(geometry.size.width))x\(Int(geometry.size.height))")
                .font(bold ? .caption.bold() : .caption)
                .foregroundColor(color)
                .padding(2)
                .zIndex(1000)
        }
        .allowsHitTesting(false)
    }
}

