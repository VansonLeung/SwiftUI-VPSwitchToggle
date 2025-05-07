# SwiftUI-VPSwitchToggle

This package was inspired by an Instagram post: https://www.instagram.com/reel/Criem1rLI9P/?igshid=YzcxN2Q2NzY0OA%3D%3D

|<img width="338" alt="螢幕截圖 2025-05-08 上午12 48 00" src="https://github.com/user-attachments/assets/2c8863b3-5e01-4283-b682-7dfdc0f8f131" />|<img width="338" alt="螢幕截圖 2025-05-08 上午12 48 04" src="https://github.com/user-attachments/assets/1c5015bb-2c5c-4a31-86f3-a88b7428514d" />|
|--|--|


Yet another SwiftUI Toggle, but fully customizable!

Supports iOS 14 or above

Supports the following background transition animations:
 - Fade
 - Horizontal
 - HorizontalReverse
 - Vertical
 - VerticalReverse


https://github.com/VansonLeung/SwiftUI-VPSwitch/assets/1129695/37fbcb12-5648-4803-bc32-ae9d90ce415d




## Installation

Install Swift Package in SPM, URL:

`.package(url: "https://github.com/VansonLeung/SwiftUI-VPSwitchToggle.git", from: "1.0.0")`




## Usage

```swift

//
//  ContentView.swift
//  SwiftUI-VPSwitch Demo
//
//  Created by Vanson Leung on 8/7/2023.
//

import SwiftUI
import SwiftUI_VPSwitch

struct ContentView: View {
    
    @State var isOn: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                
                // No config, default
                SUIVPSwitch(
                    isOn: $isOn
                )


                // Custom Sized
                SUIVPSwitch(
                    isOn: $isOn,
                    widgetSize: CGSize(width: 100, height: 40),
                    widgetForegroundMargin: 6
                )

                // Custom image and color
                SUIVPSwitch(
                    isOn: $isOn,
                    widgetSize: nil,
                    widgetForegroundMargin: nil,
                    state_on: SUIVPSwitch.SUIVPSwitchState(
                        backgroundImage: .init("f_switch_bg_moon"),
                        backgroundColor: .init(red: 29.0/255.0, green: 32.0/255.0, blue: 47.0/255.0),
                        foregroundImage: .init("f_switch_button_moon"),
                        foregroundColor: .init(red: 203.0/255.0, green: 207.0/255.0, blue: 215.0/255.0)
                    ),
                    state_off: SUIVPSwitch.SUIVPSwitchState(
                        backgroundImage: .init("f_switch_bg_sun"),
                        backgroundColor: .init(red: 71.0/255.0, green: 125.0/255.0, blue: 182.0/255.0),
                        foregroundImage: .init("f_switch_button_sun"),
                        foregroundColor: .init(red: 244.0/255.0, green: 201.0/255.0, blue: 81.0/255.0)
                    ),
                    backgroundImageOrder: .verticalReversed
                )

                // Custom image, color and size
                SUIVPSwitch(
                    isOn: $isOn,
                    widgetSize: CGSize(width: 100, height: 40),
                    widgetForegroundMargin: 6,
                    state_on: SUIVPSwitch.SUIVPSwitchState(
                        backgroundImage: .init("f_switch_bg_moon"),
                        backgroundColor: .init(red: 29.0/255.0, green: 32.0/255.0, blue: 47.0/255.0),
                        foregroundImage: .init("f_switch_button_moon"),
                        foregroundColor: .init(red: 203.0/255.0, green: 207.0/255.0, blue: 215.0/255.0)
                    ),
                    state_off: SUIVPSwitch.SUIVPSwitchState(
                        backgroundImage: .init("f_switch_bg_sun"),
                        backgroundColor: .init(red: 71.0/255.0, green: 125.0/255.0, blue: 182.0/255.0),
                        foregroundImage: .init("f_switch_button_sun"),
                        foregroundColor: .init(red: 244.0/255.0, green: 201.0/255.0, blue: 81.0/255.0)
                    ),
                    backgroundImageOrder: .fade
                )
                
                HStack {
                    
                    // Custom image, color and size
                    SUIVPSwitch(
                        isOn: $isOn,
                        widgetSize: CGSize(width: 100, height: 60),
                        widgetForegroundMargin: 6,
                        state_on: SUIVPSwitch.SUIVPSwitchState(
                            backgroundImage: .init("f_switch_bg_moon"),
                            backgroundColor: .init(red: 29.0/255.0, green: 32.0/255.0, blue: 47.0/255.0),
                            foregroundImage: .init("f_switch_button_moon"),
                            foregroundColor: .init(red: 203.0/255.0, green: 207.0/255.0, blue: 215.0/255.0)
                        ),
                        state_off: SUIVPSwitch.SUIVPSwitchState(
                            backgroundImage: .init("f_switch_bg_sun"),
                            backgroundColor: .init(red: 71.0/255.0, green: 125.0/255.0, blue: 182.0/255.0),
                            foregroundImage: .init("f_switch_button_sun"),
                            foregroundColor: .init(red: 244.0/255.0, green: 201.0/255.0, blue: 81.0/255.0)
                        ),
                        backgroundImageOrder: .horizontal
                    )
                    
                    
                    // Custom image, color and size
                    SUIVPSwitch(
                        isOn: $isOn,
                        widgetSize: CGSize(width: 100, height: 60),
                        widgetForegroundMargin: 6,
                        state_on: SUIVPSwitch.SUIVPSwitchState(
                            backgroundImage: .init("f_switch_bg_moon"),
                            backgroundColor: .init(red: 29.0/255.0, green: 32.0/255.0, blue: 47.0/255.0),
                            foregroundImage: .init("f_switch_button_moon"),
                            foregroundColor: .init(red: 203.0/255.0, green: 207.0/255.0, blue: 215.0/255.0)
                        ),
                        state_off: SUIVPSwitch.SUIVPSwitchState(
                            backgroundImage: .init("f_switch_bg_sun"),
                            backgroundColor: .init(red: 71.0/255.0, green: 125.0/255.0, blue: 182.0/255.0),
                            foregroundImage: .init("f_switch_button_sun"),
                            foregroundColor: .init(red: 244.0/255.0, green: 201.0/255.0, blue: 81.0/255.0)
                        ),
                        backgroundImageOrder: .horizontalReversed
                    )
                    
                }
                HStack {

                    // Custom image, color and size
                    SUIVPSwitch(
                        isOn: $isOn,
                        widgetSize: CGSize(width: 100, height: 60),
                        widgetForegroundMargin: 6,
                        state_on: SUIVPSwitch.SUIVPSwitchState(
                            backgroundImage: .init("f_switch_bg_moon"),
                            backgroundColor: .init(red: 29.0/255.0, green: 32.0/255.0, blue: 47.0/255.0),
                            foregroundImage: .init("f_switch_button_moon"),
                            foregroundColor: .init(red: 203.0/255.0, green: 207.0/255.0, blue: 215.0/255.0)
                        ),
                        state_off: SUIVPSwitch.SUIVPSwitchState(
                            backgroundImage: .init("f_switch_bg_sun"),
                            backgroundColor: .init(red: 71.0/255.0, green: 125.0/255.0, blue: 182.0/255.0),
                            foregroundImage: .init("f_switch_button_sun"),
                            foregroundColor: .init(red: 244.0/255.0, green: 201.0/255.0, blue: 81.0/255.0)
                        ),
                        backgroundImageOrder: .vertical
                    )

                    
                    // Custom image, color and size
                    SUIVPSwitch(
                        isOn: $isOn,
                        widgetSize: CGSize(width: 100, height: 60),
                        widgetForegroundMargin: 6,
                        state_on: SUIVPSwitch.SUIVPSwitchState(
                            backgroundImage: .init("f_switch_bg_moon"),
                            backgroundColor: .init(red: 29.0/255.0, green: 32.0/255.0, blue: 47.0/255.0),
                            foregroundImage: .init("f_switch_button_moon"),
                            foregroundColor: .init(red: 203.0/255.0, green: 207.0/255.0, blue: 215.0/255.0)
                        ),
                        state_off: SUIVPSwitch.SUIVPSwitchState(
                            backgroundImage: .init("f_switch_bg_sun"),
                            backgroundColor: .init(red: 71.0/255.0, green: 125.0/255.0, blue: 182.0/255.0),
                            foregroundImage: .init("f_switch_button_sun"),
                            foregroundColor: .init(red: 244.0/255.0, green: 201.0/255.0, blue: 81.0/255.0)
                        ),
                        backgroundImageOrder: .verticalReversed
                    )

                }

                
                // Custom color only
                SUIVPSwitch(
                    isOn: $isOn,
                    widgetSize: nil,
                    widgetForegroundMargin: nil,
                    state_on: SUIVPSwitch.SUIVPSwitchState(
                        backgroundImage: nil,
                        backgroundColor: .init(red: 29.0/255.0, green: 32.0/255.0, blue: 47.0/255.0),
                        foregroundImage: nil,
                        foregroundColor: .init(red: 203.0/255.0, green: 207.0/255.0, blue: 215.0/255.0)
                    ),
                    state_off: SUIVPSwitch.SUIVPSwitchState(
                        backgroundImage: nil,
                        backgroundColor: .init(red: 71.0/255.0, green: 125.0/255.0, blue: 182.0/255.0),
                        foregroundImage: nil,
                        foregroundColor: .init(red: 244.0/255.0, green: 201.0/255.0, blue: 81.0/255.0)
                    ),
                    backgroundImageOrder: .fade
                )

                
                
                // Custom color and size but not image
                SUIVPSwitch(
                    isOn: $isOn,
                    widgetSize: CGSize(width: 100, height: 40),
                    widgetForegroundMargin: 6,
                    state_on: SUIVPSwitch.SUIVPSwitchState(
                        backgroundImage: nil,
                        backgroundColor: .init(red: 29.0/255.0, green: 32.0/255.0, blue: 47.0/255.0),
                        foregroundImage: nil,
                        foregroundColor: .init(red: 203.0/255.0, green: 207.0/255.0, blue: 215.0/255.0)
                    ),
                    state_off: SUIVPSwitch.SUIVPSwitchState(
                        backgroundImage: nil,
                        backgroundColor: .init(red: 71.0/255.0, green: 125.0/255.0, blue: 182.0/255.0),
                        foregroundImage: nil,
                        foregroundColor: .init(red: 244.0/255.0, green: 201.0/255.0, blue: 81.0/255.0)
                    ),
                    backgroundImageOrder: .fade
                )
                
                

            }
            .padding()
        }
        .background(
            Color(uiColor: UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1))
        )
        .frame(minWidth: 0, maxWidth: .infinity,
               minHeight: 0, maxHeight: .infinity,
               alignment: .center)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


```



