
import SwiftUI


/**
 SUIVPSwitchController
 
 Supposedly a controller for each to wrap and control a SUIVPSwitch
 
 */



@available(iOS 14.0, *)
public struct SUIVPSwitch: View {

    @Binding var isOn: Bool
    
    public enum BackgroundImageOrder {
        case fade
        case horizontal
        case vertical
        case horizontalReversed
        case verticalReversed
    }

    
    public class SUIVPSwitchState {
        var backgroundImage: Image? = nil
        var backgroundColor: Color? = .gray
        var foregroundImage: Image? = nil
        var foregroundColor: Color? = .gray
        
        public init(
            backgroundImage: Image?,
            backgroundColor: Color?,
            foregroundImage: Image?,
            foregroundColor: Color?
        ) {
            self.backgroundImage = backgroundImage
            self.backgroundColor = backgroundColor
            self.foregroundImage = foregroundImage
            self.foregroundColor = foregroundColor
        }
    }

    
    var widgetSize: CGSize = .init(width: 302, height: 120)
    var widgetForegroundMargin: CGFloat = 10


    var state_on: SUIVPSwitchState = .init(
        backgroundImage: nil,
        backgroundColor: Color(red: 0.7, green: 0.7, blue: 0.7),
        foregroundImage: nil,
        foregroundColor: Color(red: 0.4, green: 1.0, blue: 0.4)
    )
    
    var state_off: SUIVPSwitchState = .init(
        backgroundImage: nil,
        backgroundColor: Color(red: 0.75, green: 0.75, blue: 0.75),
        foregroundImage: nil,
        foregroundColor: Color(red: 0.9, green: 0.9, blue: 0.9)
    )
    
    var backgroundImageOrder : BackgroundImageOrder = .fade

    @available(iOS 14.0, *)
    public struct Background: View {

        public var body: some View {
            ZStack {
                
            }
        }
    }

    @available(iOS 14.0, *)
    public struct Button: View {

        public var body: some View {
            ZStack {
                
            }

        }
        
    }
    
    
    
    public init(
        isOn: Binding<Bool>
    ) {
        self._isOn = isOn
    }
    
    public init(
        isOn: Binding<Bool>,
        widgetSize: CGSize?,
        widgetForegroundMargin: CGFloat?
    ) {
        self._isOn = isOn
        if let e = widgetSize { self.widgetSize = e }
        if let e = widgetForegroundMargin { self.widgetForegroundMargin = e }
    }
    
    public init(
        isOn: Binding<Bool>,
        widgetSize: CGSize?,
        widgetForegroundMargin: CGFloat?,
        state_on: SUIVPSwitchState?,
        state_off: SUIVPSwitchState?,
        backgroundImageOrder: BackgroundImageOrder
    ) {
        self._isOn = isOn
        if let e = widgetSize { self.widgetSize = e }
        if let e = widgetForegroundMargin { self.widgetForegroundMargin = e }
        if let e = state_on { self.state_on = e }
        if let e = state_off { self.state_off = e }
        self.backgroundImageOrder = backgroundImageOrder
    }
    
    
    
    
    public var body: some View {
        ZStack {
            VStack(spacing: 0) {
                SliderView(
                    isOn: $isOn,
                    widgetSize: widgetSize,
                    widgetForegroundMargin: widgetForegroundMargin,
                    state_on: state_on,
                    state_off: state_off,
                    backgroundImageOrder: backgroundImageOrder
                )
            }
        }
//        .animation(.default, value: toastObs.items)
        .onAppear {
//            toastObs.initialize()
        }
        .onDisappear {
//            toastObs.uninitialize()
        }
    }
}






@available(iOS 14.0, *)
struct SliderView: View {
    
    struct BackgroundView: View {
        
        var position: CGFloat
        var width: CGFloat
        var height: CGFloat
        var state_on: SUIVPSwitch.SUIVPSwitchState
        var state_off: SUIVPSwitch.SUIVPSwitchState
        var backgroundImageOrder : SUIVPSwitch.BackgroundImageOrder
        
        func getBgOffsetForOff() -> CGSize {
            if backgroundImageOrder == .horizontal {
                return CGSize(
                    width: width * -position,
                    height: 0
                )
            }
            if backgroundImageOrder == .horizontalReversed {
                return CGSize(
                    width: width * +position,
                    height: 0
                )
            }
            if backgroundImageOrder == .vertical {
                return CGSize(
                    width: 0,
                    height: height * -position
                )
            }
            if backgroundImageOrder == .verticalReversed {
                return CGSize(
                    width: 0,
                    height: height * +position
                )
            }
            return .zero
        }
        
        func getBgOffsetForOn() -> CGSize {
            if backgroundImageOrder == .horizontal {
                return CGSize(
                    width: width + (width * -position),
                    height: 0
                )
            }
            if backgroundImageOrder == .horizontalReversed {
                return CGSize(
                    width: -width + (width * +position),
                    height: 0
                )
            }
            if backgroundImageOrder == .vertical {
                return CGSize(
                    width: 0,
                    height: height + (height * -position)
                )
            }
            if backgroundImageOrder == .verticalReversed {
                return CGSize(
                    width: 0,
                    height: -height + (height * +position)
                )
            }
            return .zero
        }
        
        

        var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: width)
                    .fill(.white.opacity(0.8))
                    .frame(minWidth: 0, maxWidth: .infinity,
                           minHeight: 0, maxHeight: .infinity)
                    .offset(.init(width: 0, height: 2))
                
                RoundedRectangle(cornerRadius: width)
                    .fill(.black.opacity(0.2))
                    .frame(minWidth: 0, maxWidth: .infinity,
                           minHeight: 0, maxHeight: .infinity)
                    .offset(.init(width: 0, height: -2))
                
                RoundedRectangle(cornerRadius: width)
                    .fill(lerpColor(fromColor: state_off.backgroundColor ?? .gray, toColor: state_on.backgroundColor ?? .gray, weight: position))
                    .frame(minWidth: 0, maxWidth: .infinity,
                           minHeight: 0, maxHeight: .infinity)
                    .overlay(
                        RoundedRectangle(cornerRadius: width)
                            .stroke(.black.opacity(0.2))
//                            .fill(.clear)
                            .shadow(color: Color(red: 0/255, green: 0/255, blue: 0/255),
                                    radius: width / 80, x: 0, y: 0)
                            .shadow(color: Color(red: 0/255, green: 0/255, blue: 0/255),
                                    radius: width / 60, x: 0, y: 0)
//                            .shadow(color: Color(red: 0/255, green: 0/255, blue: 0/255),
//                                    radius: width / 40, x: 0, y: 0)
                            .clipShape(
                                RoundedRectangle(cornerRadius: width)
                            )
                    )
                
                ZStack {

                    if backgroundImageOrder == .fade {
                        
                        if let img = state_off.backgroundImage {
                            img.resizable(resizingMode: .stretch)
                                .scaledToFill()
                                .opacity(Double(1.0 - position))
                                .cornerRadius(width)
                                .frame(minWidth: 0, maxWidth: .infinity,
                                       minHeight: 0, maxHeight: .infinity)
                                .clipShape(
                                    RoundedRectangle(cornerRadius: width)
                                )
                                .debugFrameSize()
                        }
                            
                        if let img = state_on.backgroundImage {
                            img.resizable(resizingMode: .stretch)
                                .scaledToFill()
                                .opacity(position)
                                .cornerRadius(width)
                                .frame(minWidth: 0, maxWidth: .infinity,
                                       minHeight: 0, maxHeight: .infinity)
                                .clipShape(
                                    RoundedRectangle(cornerRadius: width)
                                )
                        }
                        
                    } else {
                        
                        if let img = state_off.backgroundImage {
                            img.resizable(resizingMode: .stretch)
                                .offset(getBgOffsetForOff())
                                .cornerRadius(width)
                                .clipShape(
                                    RoundedRectangle(cornerRadius: width)
                                )
                                .frame(minWidth: 0, maxWidth: .infinity,
                                       minHeight: 0, maxHeight: .infinity)
                        }
                            
                        if let img = state_on.backgroundImage {
                            img.resizable(resizingMode: .stretch)
                                .offset(getBgOffsetForOn())
                                .cornerRadius(width)
                                .clipShape(
                                    RoundedRectangle(cornerRadius: width)
                                )
                                .frame(minWidth: 0, maxWidth: .infinity,
                                       minHeight: 0, maxHeight: .infinity)
                        }
                        
                    }
                    
                }
                .cornerRadius(width)
                .clipShape(
                    RoundedRectangle(cornerRadius: width)
                )
                .allowsHitTesting(false)



            }
            .animation(.easeInOut)
        }
        
    }
    
    
    struct ForegroundIconView: View {
        
        var position: CGFloat
        var width: CGFloat
        var height: CGFloat
        var state_on: SUIVPSwitch.SUIVPSwitchState
        var state_off: SUIVPSwitch.SUIVPSwitchState
        var backgroundImageOrder : SUIVPSwitch.BackgroundImageOrder
//        @State var imgRes: UIImage?
        @State var imgGlow: UIImage?

        var body: some View {
            ZStack {
                
                if let img = imgGlow {
                    Image(uiImage: img)
                        .resizable()
                        .frame(
                            width: width * 200 / 100,
                            height: width * 200 / 100
                        )
                        .allowsHitTesting(false)
                }

                ZStack {
                    RoundedRectangle(cornerRadius: width)
                        .fill(lerpColor(fromColor: state_off.foregroundColor ?? .gray, toColor: state_on.foregroundColor ?? .gray, weight: position))
                        .frame(minWidth: 0, maxWidth: .infinity,
                               minHeight: 0, maxHeight: .infinity)

    //                RoundedRectangle(cornerRadius: width)
    ////                            .stroke(Color(red: 236/255, green: 234/255, blue: 235/255),
    ////                                    lineWidth: 4)
    //                    .fill(.clear)
    //                    .shadow(color: Color(red: 192/255, green: 189/255, blue: 191/255),
    //                            radius: width / 10, x: 5, y: 5)
    //                    .clipShape(
    //                        RoundedRectangle(cornerRadius: width)
    //                    )
    //                    .shadow(color: Color.white, radius: width / 10, x: -2, y: -2)
    //                    .clipShape(
    //                        RoundedRectangle(cornerRadius: width)
    //                    )
                    
//                    if let image = imgRes {
//                        Image(uiImage: image)
//                            .resizable()
//                            .scaledToFill()
//                            .frame(width: width,
//                                   height: height)
//                            .mask(
//                                RoundedRectangle(cornerRadius: width)
//                                )
//                    }

                    
                    
                    if let img = state_off.foregroundImage {
                        img.resizable()
                            .scaledToFill()
                            .opacity(Double(1.0 - position))
                            .frame(minWidth: 0, maxWidth: .infinity,
                                   minHeight: 0, maxHeight: .infinity)
                            .clipShape(
                                RoundedRectangle(cornerRadius: width)
                            )
                    }
                        
                    if let img = state_on.foregroundImage {
                        img.resizable()
                            .scaledToFill()
                            .opacity(position)
                            .frame(minWidth: 0, maxWidth: .infinity,
                                   minHeight: 0, maxHeight: .infinity)
                            .clipShape(
                                RoundedRectangle(cornerRadius: width)
                            )
                    }
                    
                    
                }
                .frame(
                    width: width,
                    height: height
                )
                
                
            }
            .shadow(color: .black.opacity(0.5),
                    radius: width / 20, x: 0, y: 0)
            
            .animation(.easeInOut)
            .onAppear {
                
//                if let path = Bundle.module.path(forResource: "foreground_overlay_bw", ofType: "png"),
//                    let image = UIImage(contentsOfFile: path)
//                {
//                    imgRes = image
//                }
                
                if let path = Bundle.module.path(forResource: "f_switch_base_glow", ofType: "png"),
                    let image = UIImage(contentsOfFile: path)
                {
                    imgGlow = image
                }
                
            }
        }
        
    }
    
    
    @GestureState private var dragOffset: CGSize = .zero
    @State private var position: CGFloat = 0
    @State private var isDragging = false
    
    @Binding var isOn: Bool
    var widgetSize: CGSize
    var widgetForegroundMargin: CGFloat
    var state_on: SUIVPSwitch.SUIVPSwitchState
    var state_off: SUIVPSwitch.SUIVPSwitchState
    var backgroundImageOrder : SUIVPSwitch.BackgroundImageOrder
    
    
    var body: some View {
        ZStack {
            
            let widgetForegroundIconSize = widgetSize.height - widgetForegroundMargin * 2

            GeometryReader { geometry in
                let dragWidth = geometry.size.width - widgetForegroundIconSize - widgetForegroundMargin * 2
                let dragOffsetX = dragOffset.width
                let newPosition = dragOffsetX + position
                let newPositionLimited = max(0, min(dragWidth, newPosition))
                let newPositionPercent = newPositionLimited  / dragWidth

                ZStack {
                    
                    BackgroundView(
                        position: (newPositionPercent),
                        width: geometry.size.width,
                        height: geometry.size.height,
                        state_on: state_on,
                        state_off: state_off,
                        backgroundImageOrder: backgroundImageOrder
                    )

                    ZStack {
                        
                        ZStack {
//                            Text("\(newPosition) \(geometry.size.width)")
                            ZStack {
                                ForegroundIconView(
                                    position: (newPositionPercent),
                                    width: widgetForegroundIconSize,
                                    height: widgetForegroundIconSize,
                                    state_on: state_on,
                                    state_off: state_off,
                                    backgroundImageOrder: backgroundImageOrder
                                )
                            }
                                .offset(x: newPositionLimited)
                                .gesture(
                                    DragGesture()
                                        .updating($dragOffset) { value, state, _ in
                                            state = value.translation
//                                            print(value.translation)
                                            
//                                            DispatchQueue.main.async {
//                                                position = min(max(newPosition, 0), dragWidth)
//                                                isDragging = true
//                                            }
                                        }
                                        .onEnded { value in
//                                            withAnimation {
                                            isDragging = false
                                            isOn = value.translation.width > 0 ? true : false
//                                            }
                                        }
                                )
                                .debugFrameSizeHighlighted()

                        }
                        .frame(width: widgetForegroundIconSize,
                               height: widgetForegroundIconSize)
                    }
                    .padding(.all, widgetForegroundMargin)
                    .frame(minWidth: 0, maxWidth: .infinity,
                           minHeight: 0, maxHeight: .infinity,
                           alignment: .leading)
                    .animation(.easeInOut)
                    .clipShape(
                        RoundedRectangle(cornerRadius: geometry.size.width)
                    )

//                    VStack {
//                        Text("\(newPosition)")
//                            .foregroundColor(.white)
//                        Text("\(newPositionPercent)")
//                            .foregroundColor(.white)
//                    }

                }
                .gesture(
                    TapGesture()
                        .onEnded {
//                            print("X")
                            
//                                            withAnimation(.easeInOut) {
                            isDragging = false
                            isOn = position > 0 ? false : true
//                                            }
                        }
                )
                .onChange(of: isOn) { newValue in
                    position = newValue ? dragWidth : 0
                }


            }
            
            
        }
        .frame(
            width: widgetSize.width,
            height: widgetSize.height,
            alignment: .center)
        .debugFrameSize()

    }
}

@available(iOS 14.0, *)
struct ContentView: View {
    
    @State var isOn: Bool = false
    
    var body: some View {
        VStack {
            Text("Drag the slider")
                .font(.title)
                .padding()
            
            SUIVPSwitch(
                isOn: $isOn
            )
        }
    }
}

@available(iOS 14.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



@available(iOS 14.0, *)
func lerpColor(fromColor: Color, toColor: Color, weight: CGFloat) -> Color {
    let fromComponents = fromColor.components()
    let toComponents = toColor.components()

    let lerpedRed = (1 - weight) * fromComponents.red + weight * toComponents.red
    let lerpedGreen = (1 - weight) * fromComponents.green + weight * toComponents.green
    let lerpedBlue = (1 - weight) * fromComponents.blue + weight * toComponents.blue
    let lerpedAlpha = (1 - weight) * fromComponents.alpha + weight * toComponents.alpha

    return Color(red: lerpedRed, green: lerpedGreen, blue: lerpedBlue, opacity: lerpedAlpha)
}

@available(iOS 14.0, *)
extension Color {
    func components() -> (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        let uiColor = UIColor(self)
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return (red, green, blue, alpha)
    }
}
