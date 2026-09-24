# Wall Panel Guide (iPad)

## Hardware

- Any iPad from A11 onwards. Newer chips (A14+) give smoother animations.
- Use a powered wall mount / dock so the iPad never runs out of charge.
- Keep the iPad on the same Wi-Fi network as your Jarvis host and Home Assistant.

## Software

1. **Guided Access** (locks the iPad into one app):
   - Settings → Accessibility → Guided Access → On
   - Set a passcode (Settings → Accessibility → Guided Access → Passcode Settings)
   - Open the Jarvis interface in Safari (or your chosen client)
   - Triple-click the side button → Start

2. **Add to Home Screen** (full-screen web app):
   - In Safari, tap Share → Add to Home Screen
   - Name it "Jarvis"
   - It now launches like a native app with no browser chrome

3. **Auto-lock**: Settings → Display & Brightness → Auto-Lock → Never (while charging)

## Voice on the wall

The iPad's microphone can be used if you run a remote-audio bridge, but the simplest reliable path is to keep the Jarvis desktop app's microphone on the host machine and use the iPad purely as the display + touch input.

## Security

- Guided Access passcode is the only thing standing between a visitor and your house controls. Choose a strong one.
- Expose only the entities you actually need in Home Assistant's Exposed entities list.
