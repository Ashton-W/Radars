# SFSafariViewController shows white screen while loading in Dark Mode

Feedback for **iOS & iPadOS**

**Which area are you seeing an issue with?**
WebKit

**What type of feedback are you reporting?**
Incorrect/Unexpected Behavior

**Please describe the issue and what steps we can take to reproduce it:**
When Dark Mode is enabled, SFSafariViewControllers are presented with a 
white background until the page loads and switches to Dark Mode. 
This creates a sudden white flash and a poor user experience. This could also 
create discomfort in users sensitive to flashing lights.
ASWebAuthenticationSession has the same behaviour.

Steps to reproduce:
1. Enable Dark Mode on the device and ensure the app also supports it
2. Choose a URL to a site that supports Dark Mode eg: https://webkit.org
3. Create an instance of SFSafariViewController with the URL
4. Present the ViewController. Dismiss the VC. Present again.

Alternatively, run the attached sample project.

Expected:
The default initial background of a SFSafariViewController is appropriate to the
current user interface style; light or dark.

Actual:
The default initial background of a SFSafariViewController is always white. 
