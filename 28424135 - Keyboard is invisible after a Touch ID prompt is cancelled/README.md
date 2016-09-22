# Keyboard is invisible after a Touch ID prompt is cancelled

#### Product
iOS

#### Classification
UI/Usability

#### Reproducibility
Always

#### Area
Keyboard

#### Title
Keyboard is invisible after a Touch ID prompt is cancelled

#### Description
An invisible, but otherwise functional keyboard is displayed when a textfield becomes First Responder in or very shortly after the completion block of a TouchID prompt that is cancelled (LAContext API or keychain).

It still occurs if the the call to become first responder is dispatched asynchronously to the the main queue.
If the first responder call is dispatched to the main queue with a delay, the keyboard will sometimes be visible, a longer delay increases the chance the keyboard will be visible, delays past 0.05 seconds were not demonstrated to cause the issue.

If the keyboard is already being displayed, the issue does not occur.

#### Steps to reproduce
1. Run the sample app on a device, or run an app that makes a text field the first responder in the completion block of a Touch ID prompt
1. With the keyboard dismissed, show the Touch ID prompt
1. Press Cancel on the Touch ID prompt

#### Expected Results
The keyboard appears as normal and is visible to the naked eye.

#### Actual Results
The text field will become first responder which should show the keyboard. The keyboard is shown, but it is not visible, typing where the keyboard is expected to be positioned will enter text into the text field.

#### Configuration
iPhone 6  
iPhone 5s 

#### Version
iOS 10.0.1 (14A403)

#### Additional Notes
