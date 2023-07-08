# SwiftUI-VPSwitch

Yet another SwiftUI Switch, but fully customizable!



https://github.com/VansonLeung/SwiftUI-VPSwitch/assets/1129695/2b6459f8-9fa7-4276-84c0-f2aafc2ea187


## Installation

Install Swift Package in SPM, URL:

`https://github.com/VansonLeung/SwiftUI-VPSwitch/`


## Usage

```swift

// No config, default
SUIVPSwitch()


// Custom Sized
SUIVPSwitch(
    widgetSize: CGSize(width: 100, height: 40),
    widgetForegroundMargin: 6
)

// Custom image and color
SUIVPSwitch(
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


// Custom color and size but not image
SUIVPSwitch(
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



```



