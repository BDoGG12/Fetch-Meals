# Architecture

## MVVM Architecture

### Model
The Model represents the data and business logic of the application. It includes data structures for recipes and ingredients, as well as the API service to fetch data from the endpoints.

#### Key Components:
- **Recipe**: Data structure representing a recipe, including its name, instructions, and ingredients.
- **Ingredient**: Data structure representing an ingredient with its name and measurement.
- **ApiService**: A singleton class responsible for fetching data from the API endpoints.

### View
The View represents the UI of the application and displays data provided by the ViewModel. It is composed of SwiftUI views that are bound to the ViewModel.

#### Key Components:
- **RecipeListView**: Displays a list of recipes fetched from the API. Allows navigation to the RecipeDetailView.
- **RecipeDetailView**: Displays detailed information about a selected recipe, including its name, instructions, and ingredients.

### ViewModel
The ViewModel acts as an intermediary between the View and the Model. It handles data manipulation and business logic, exposing the necessary data to the View through published properties.

#### Key Components:
- **RecipeViewModel**: Manages the state for the RecipeListView, including fetching recipes from the API and handling loading and error states.
