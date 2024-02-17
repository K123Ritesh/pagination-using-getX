# GetX Flutter Controller - ItemController

This Flutter controller utilizes the GetX package to manage the state and handle the fetching of items from a remote API. The controller is designed for a Flutter application, and it follows the GetX reactive state management approach.

## Overview

### Dependencies
- `dart:convert`: Used for encoding and decoding JSON data.
- `get: ^x.x.x`: GetX package for state management and dependency injection.
- `http: ^x.x.x`: HTTP package for making HTTP requests.

### Controller Features
1. **API URL**: The controller has a designated API URL for fetching items. It includes parameters for the JSON format and item limit.

2. **Observable Lists**: Utilizes GetX's `RxList` to create an observable list (`items`) to store the fetched items.

3. **Observable Flags**: `RxBool` is used for an observable flag (`isLoading`) to indicate whether data is currently being loaded.

4. **Pagination**: The `page` variable is used to keep track of the current page for paginated data loading.

5. **Initialization**: The `onInit` method is overridden to load items when the controller is initialized.

6. **Data Loading Method**: The `loadItems` method makes an HTTP GET request to the API, handles the response, and updates the state accordingly. It avoids loading data if the controller is already in a loading state.

## How to Use

1. **Controller Initialization**: Create an instance of `ItemController` in the desired part of your Flutter application.

   ```dart
   ItemController itemController = ItemController();
