# Brasileirão

A very simple app where users can see matches and matches insights of the Brasileirão Championship.

Be advised that all data
## Use Cases

- The user cant see a list of matches
- Tapping on a match show a detailed view of the match with match insights (best moment and time)
-- The detailed view is updated automatically once a new insight is registered on Firebase RealtimeDB

## Running

| ⚠️   Warning                                                                                                                 |
| :---------------------------------------------------------------------------|
| The project uses Firebase Realtime Database to store data but all secrets were removed from the repo.

The project was made with Flutter + Dart, but can run only on Android due to platform specific Firebase's configuration.

## Architecture

"Perfection is achieved, not when there is nothing more to add, but when there is nothing left to take away". With this in mind the code was made to be as simple and straightforward as possible, but not abdicating of some good patterns and practices.

The project was divided into three packages, each one representing a layer (domain, data, presentation):

- **model**: Data models and mappings. Equivalent to the domain layer.
- **graphql**: GraphQL client and Repository Implementation. Equivalent to the data layer.
- **presentation**: Widgets, pages, BLoCs and states. The presentation layer.

Due to the reactive nature of Flutter applications, the BLoC pattern was used. The BLoC pattern works with the concept of Data/Event Streams and Stream Subscribers, working in the same way as the MVI(Model-View-Intent) and MVVM(Model-View-ViewModel) patterns.

The overall app architechture is as follows

![marketplace_arch](https://user-images.githubusercontent.com/4440882/77957826-7cade780-72aa-11ea-8cdc-cea6727fbd08.png)

## Tests
Tests (and coding) were made using the Behavior-driven Development approach to ensure the use cases were working as expected. Tests were made to cover the 3 layers, so covering Widgets behavior, data consuming and management and data fetching.

## Design Rationale

As good as showing why something was made, it's important to show why something was **not** made.

**Why just one BLoC?**

Although it's recommended to have one BLoC per page and to share data between them through a shared stateful repository, to maintain simplicity and reduce communication overhead, only one BLoC was used. This BLoC holds and shares states with all pages.

**Why not use interfaces to promote Dependency Inversion between layers?**

In most cases, interfaces are only useful for runtime polymorphism, so if you have an InterfaceImpl class, think twice. Interfaces as an excuse to make testing easier is not solid, as it's possible to Mocks classes and to perform custom injections if correct single responsibility pattern and referential transparency is implemented. In addition, Dart allows classes to be implemented as interface, thus forcing the use of their behavior instead of their implementation.

**Why not use Dependency Injection?**

Dependency Injection is useful when you have a complex dependency graph with complex object creation and/or when you want to provide scoped dependencies that aren't application wide. Since all the data of the app is shared and consumed by the two pages and this data is application wide, there's no need for a DI Framework/Library.


**Why not use Repository + Data Source?**

The main advantage of using repositories + data source is to provide multiple data sources and to isolate data models from domain models and their mappings. Since this app has simple models, no complex runtime business rules validation, and uses dynamic data from GraphQL with in memory cache, the problems of defining, retrieving and manipulating data are reduced, and there's no need to add these kind of abstractions.

I hope you enjoy the code review ;)