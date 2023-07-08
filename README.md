# SwiftUI-VPSwitch

Yet another SwiftUI Switch, but fully customizable!



https://github.com/VansonLeung/SwiftUI-VPSwitch/assets/1129695/b2e8783f-2d11-4f7e-9015-a9a9a1edb8cb



## Installation

Install Swift Package in SPM, URL:

`https://github.com/VansonLeung/SwiftUI-VPSwitch/`


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
                    )
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
                    )
                )

                
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
                    )
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
                    )
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



