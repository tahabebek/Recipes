### Steps to Run the App
1. Clone the repo.
2. Open `Recipes.xcodeproj` file.
3. Wait until xcode fetches package dependencies.
4. Select an iOS Simulator from destinations.
5. Run.

### Focus Areas: What specific areas of the project did you prioritize? Why did you choose to focus on these areas?
I have focused on image caching, networking, MVVM architecture, and the list UI. These were the must-have items.

### Time Spent: Approximately how long did you spend working on this project? How did you allocate your time?
I've spent around 6 hours. Worked on it approximately one hour every day for 6 days.

### Trade-offs and Decisions: Did you make any significant trade-offs in your approach?
No.

### Weakest Part of the Project: What do you think is the weakest part of your project?
I did not implement a detailed error-handling mechanism. There are only 2 types of errors, which are invalid URL, and unknown error. If I had more time, I would add more types of errors, and handle each type of error differently. For example, if the user doesn't have an internet connection, error handling would be a retry mechanism.

### External Code and Dependencies: Did you use any external code, libraries, or dependencies?
I used [Kingfisher](https://github.com/onevcat/Kingfisher) for image caching and [swift-collections](https://github.com/apple/swift-collections) for an ordered set.

### Additional Information: Is there anything else we should know? Feel free to share any insights or constraints you encountered
I didn't write a complex networking library, I only wrote a struct that can make a get requests, and that is all. I avoided unneeded complexity. 
