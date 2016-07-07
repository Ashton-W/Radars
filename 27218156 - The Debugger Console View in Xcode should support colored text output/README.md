27218156

#### Product
Developer Tools

#### Classification
Feature

#### Reproducibility
Not Applicable

#### Title
The Debugger Console View in Xcode should support colored text output.

#### Description
The Xcode Debugger Console View should support special escape codes in the output which it converts into colors, making it possible for richer output from testing and logging frameworks.

#### Steps to reproduce
1. Open example project in Xcode
2. Run Units Tests
3. Observe text output in the Debugger Console View

#### Expected Results
Console output from the tests is rendered in beautiful colors.

#### Actual Results
Text is monochromatic.

#### Configuration


#### Xcode Version/Build & OSX Version/Build
All versions of Xcode

#### Additional Notes
It was possible to get color support in the Xcode debugger console with a plugin. Most Terminal programs support color escape codes already. It was one of the most popular plugins.
https://github.com/robbiehanson/XcodeColors
