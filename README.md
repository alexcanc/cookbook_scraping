# Cookbook Advanced

This project is an advanced version of the Cookbook application. It allows users to manage recipes, including adding, listing, removing, importing recipes from the internet, marking recipes as done, and more.
( In this cookbok for the " Import Recipes fron the internet " we are scraping the Marmiton website )

## Setup Instructions

1. Clone the repository to your local machine.
2. Navigate to the project directory.
3. Install the required dependencies by running `bundle install`.
4. Run the application by executing `ruby app.rb` in your terminal.

## Features

### List Recipes

- Select the "List all recipes" option from the main menu to display a list of all recipes in the cookbook.
- The list includes the name, description, rating, preparation time, and status (done/undone) of each recipe.

### Add Recipe

- Select the "Add a new recipe" option from the main menu to add a new recipe to the cookbook.
- Provide the recipe's name, description, rating, and preparation time.
- The recipe will be saved in the cookbook.

### Remove Recipe

- Select the "Remove a recipe" option from the main menu to remove a recipe from the cookbook.
- Choose the recipe you want to remove from the displayed list.
- The recipe will be deleted from the cookbook.

### Import Recipes from the Internet

- Select the "Import recipes from the Internet" option from the main menu to search for recipes online.
- Enter a keyword for the recipe you want to search for.
- The application will scrape the Marmiton website to find recipes related to the keyword.
- Display the search results, including the recipe name, description, rating, and preparation time.
- Select a recipe from the list to import it into the cookbook.

### Mark Recipe as Done

- Select the "Mark a recipe as done" option from the main menu to mark a recipe as done.
- Choose the recipe you want to mark as done from the displayed list.
- The recipe's status will be updated to "done" in the cookbook.

### Exit the Program

- Select the "Stop and exit the program" option from the main menu to exit the application.

## Dependencies

This project relies on the following dependencies:

- Ruby 2.7.4
- Nokogiri gem
- OpenURI gem
