# Beeceptor Users

A tiny modular iOS app demonstrating SwiftUI, async/await + Combine, dependency injection, and unit tests. This project showcases a clean architecture approach for displaying a list of users and their details fetched from a REST API.

## Features

- **User List View**: Display a list of users with profile photos, names, and email addresses
- **User Detail View**: View detailed information about individual users
- **Async/Await**: Modern Swift concurrency for network requests
- **Dependency Injection**: Clean separation of concerns with a DI container
- **Clean Architecture**: Layered architecture (Domain, Data, UI)
- **SwiftUI**: Modern declarative UI framework
- **REST API Integration**: Fetches data from Beeceptor mock API
- **Combine Integration**: Reactive state management with `@Published` properties

## Architecture

The app follows **Clean Architecture** principles with a clear separation of concerns:

```
┌─────────────────────────────────────┐
│           UI Layer (SwiftUI)        │
│  - UserListView                     │
│  - UserDetailView                   │
└─────────────────────────────────────┘
                  ↓
┌─────────────────────────────────────┐
│         Domain Layer                │
│  - ViewModels (Business Logic)      │
│  - Entities (Domain Models)         │
└─────────────────────────────────────┘
                  ↓
┌─────────────────────────────────────┐
│          Data Layer                 │
│  - Repositories                     │
│  - Data Sources (Remote/Local)      │
│  - Mappers                          │
└─────────────────────────────────────┘
                  ↓
┌─────────────────────────────────────┐
│         Core/Infrastructure         │
│  - HTTPClient                       │
│  - DIContainer                      │
└─────────────────────────────────────┘
```

### Key Design Patterns

- **MVVM (Model-View-ViewModel)**: ViewModels handle business logic and state management
- **Repository Pattern**: Abstracts data sources from the domain layer
- **Dependency Injection**: DIContainer manages all dependencies
- **Protocol-Oriented Programming**: Extensive use of protocols for testability

## Technologies

- **Swift 5.0+**
- **SwiftUI**: Modern declarative UI framework
- **async/await**: Swift concurrency for asynchronous operations
- **Combine**: Reactive programming framework (via `@Published`)
- **XCTest**: Unit testing framework
- **URLSession**: Network layer for API calls

## Project Structure

```
UsersApp/
├── App/
│   ├── UsersAppApp.swift          # App entry point
│   └── DIContainer.swift          # Dependency injection container
├── Core/
│   └── Networking/
│       └── HTTPClient.swift       # HTTP client for API requests
├── Modules/
│   ├── Domain/
│   │   ├── Entities/              # Domain models (User, UserDetail)
│   │   └── ViewModels/            # Business logic and state management
│   ├── Data/
│   │   ├── DataSources/           # Remote and local data sources
│   │   ├── Repositories/          # Repository implementations
│   │   ├── Entities/              # Data layer models (UserData)
│   │   └── Mappers/               # Data to Domain mapping
│   └── UI/
│       └── Views/                 # SwiftUI views
│           ├── UserList/
│           └── UserDetail/
└── Assets.xcassets/               # App assets
```

## Requirements

- **Xcode 15.0+**
- **iOS 17.0+**
- **Swift 5.0+**

## Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/hemantchauhan/beeceptor_users.git
   cd beeceptor_users
   ```

2. **Open the project**
   ```bash
   open UsersApp.xcodeproj
   ```

3. **Build and run**
   - Select a simulator or device in Xcode
   - Press `Cmd + R` to build and run the app

## Usage

1. **Launch the app** - The app will automatically fetch and display a list of users
2. **View user list** - Browse through users with their profile photos, names, and emails
3. **View user details** - Tap on any user to see their detailed information including:
   - Company
   - Address
   - Phone number
   - Location details

## API Integration

The app fetches data from the Beeceptor mock API:

- **Base URL**: `https://fake-json-api.mock.beeceptor.com`
- **Endpoints**:
  - `GET /users` - Fetch list of users
  - `GET /users/{id}` - Fetch user details


### Test Structure

- **UsersAppTests**: Unit tests for business logic, repositories, and data sources
- **UsersAppUITests**: UI tests for user interactions

## Future Enhancements

- [ ] Add local caching L1 & L2 with NSCache & Core Data
- [ ] Implement offline support
- [ ] Add pull-to-refresh functionality
- [ ] Add search/filter capabilities
- [ ] Implement error handling with retry logic
- [ ] Add unit tests for ViewModels and Repositories
- [ ] Add UI tests for user interactions

## License

This project is for demonstration purposes as part of a coding challenge.

## Author

Created by Hemant
