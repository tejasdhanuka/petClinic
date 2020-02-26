# petClinic
A simple iOS project to simulate a pet veterinary clinic and also demonstrate basic iOS functionalities ike making Network call, iOS UI designs and autolayout and clean code architecture.

# Explaination
- This project is created entirely using latest iOS framework "SwiftUI".
- A launch screen has been implemented to enhance the user experience.
- pets.json is hosted at "https://api.myjson.com/bins/1f3v5o".
- Fetching the config.json to check for chat and call feature availability and work hours.
- If the chat and call features are disabled from config.json, then this app does not show the corresponding buttons.
- Based on the office work hours provided in config.json, the app shows respective custom alert message.
- Each pet information is presented in a cell with Image and title.
- Tapping on a pet info cell does open a new screen that loads the pet information on a webview.
- No third party library are used.
- Images are loaded asynchronously. Placeholder images are displayed until the time original images are loaded from a remote URL.

# Modularized and structured code
- Modularised code is implemented for easy understanding
- Code is structured into various sub-folders like:- view, NetworkRequest, Model.
- Resources are grouped under separate folder named Resources
- Appropriate assets are added to be used when needed.
