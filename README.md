# Fetch Meals

## Overview

**Fetch Meals** is a SwiftUI application that allows users to browse recipes from two provided API endpoints. The app features a user-friendly interface for viewing recipes and their details, including names, instructions, and ingredients/measurements.

## User Requirements

### User Registration and Authentication (if needed)
- Users should be able to create an account and log in.
- Authentication can be managed via Firebase or another service if applicable.

### Recipe Browsing
- Users should be able to browse recipes from two provided API endpoints.
- Recipes should be displayed in a list or grid format.

### Recipe Details
- When a user selects a meal, they should be taken to a detail view.
- The detail view should include:
  - Meal name
  - Instructions
  - Ingredients with measurements

### Search and Filter (optional but recommended)
- Users should be able to search for specific recipes.
- Users should be able to filter recipes by category or other criteria.

## Architecture

**Fetch Meals** uses the MVVM (Model-View-ViewModel) architecture to ensure a clean separation of concerns.

### Model
The Model represents the data and business logic of the application.

- **Recipe**: Represents a recipe, including its name, instructions, and ingredients.
- **Ingredient**: Represents an ingredient with its name and measurement.
- **ApiService**: A singleton class responsible for fetching data from the API endpoints.

### View
The View represents the user interface of the application.

- **RecipeListView**: Displays a list of recipes and allows navigation to the RecipeDetailView.
- **RecipeDetailView**: Shows detailed information about a selected recipe, including its name, instructions, and ingredients.

### ViewModel
The ViewModel manages the state for the views and handles data manipulation.

- **RecipeViewModel**: Handles fetching recipes from the API and managing loading and error states.

## Data Flow

1. **User Interaction**: Users interact with the UI, such as selecting a recipe from the list.
2. **ViewModel Update**: The ViewModel processes user interactions and updates state, including fetching data from the API.
3. **Model Interaction**: The ViewModel communicates with the Model to perform actions like making API requests.
4. **View Update**: The ViewModel publishes updates to its properties, which the View observes to update the UI.

## API Integration

The app integrates with two API endpoints to fetch recipes.

- **Recipes Endpoint**: Provides a list of recipes.
- **Recipe Details Endpoint**: Provides detailed information about a specific recipe.

## Concurrency

**Fetch Meals** uses Swift concurrency with `async` and `await` for asynchronous operations. This ensures efficient network requests and a responsive user experience.

## Error Handling

The app includes error handling to manage network issues and display appropriate messages to users. The `RecipeViewModel` handles errors during data fetching and updates the UI to reflect error states.

## Future Enhancements

### Search and Filter Functionality
- Implement search functionality to find specific recipes.
- Add filters to narrow down recipes based on categories or other criteria.

### User Authentication
- Add user registration and authentication using Firebase or another service, if needed.

### Enhanced Error Handling
- Improve error handling to provide more detailed messages and recovery options.

### Offline Support
- Implement offline support to access previously viewed recipes without an internet connection.

## Setup and Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/fetch-meals.git

2. Open the project in Xcode:
   open FetchMeals.xcodeproj

3. Build and run the app on a simulator or device.

4. (Optional) Configure Firebase or another authentication service if user registration and authentication are implemented.

## License
This project is licensed under the MIT License. See the LICENSE file for details.

### Contributing
Contributions are welcome! Please follow the standard fork-and-pull request workflow.

Fork the repository.
Create a new branch (git checkout -b feature-branch).
Commit your changes (git commit -am 'Add new feature').
Push to the branch (git push origin feature-branch).
Create a new Pull Request.

## Contact
For any questions or inquiries, please contact bdo.appworkshop@gmail.com.

