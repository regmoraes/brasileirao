# Brasileirão

A very simple app where users can see matches and matches insights of the Brasileirão Championship.

<p float="left">
<img width="40%" vspace="20" hspace="20" src="https://user-images.githubusercontent.com/4440882/83931697-82292180-a774-11ea-8576-e0559d685950.png" />
<img width="40%" vspace="20" hspace="20" src="https://user-images.githubusercontent.com/4440882/83931702-85bca880-a774-11ea-8538-2155beaefc84.png" />
</p>

## Use Cases

- The user can see a list of matches with their date and score;
- Tapping on a match show a detailed view of the match with match insights (best moment and time)
-- The insights are updated automatically once new events are registered on Firebase Realtime DB.

## Running
The project was made with Flutter + Dart, but can run only on Android due to platform specific Firebase's configuration.
| ⚠️   Warning                                                                                                                 |
| :---------------------------------------------------------------------------|
| The project uses Firebase Realtime Database to store data but all secrets were removed from the repo.



## Architecture

Due to the reactive nature of Flutter applications, the BLoC pattern was used. The BLoC pattern works with the concept of Data/Event Streams and Stream Subscribers, working in the same way as the MVI(Model-View-Intent) and MVVM(Model-View-ViewModel) patterns.

### Structure 
The project pacakges were structured according to "types and responsibilities", so each pacakge contains files of the "package type".

- **blocs**: BLoCs responsible for controlling/managing flow of data and state in the app.
- **model**: Basic domain models used to represent data from Firebase Realtime DB.
- **pages**: Pages/Screens of the app.
- **repository**: Repository interface and implementation.
- **widgets**: Widgets that are used to compose pages.

### Components

The main components of the application are:

- **MatchBloc**: Core component, responsible for controlling/managing flow of data and state in the app. The receives calls from Pages/Widgets and emits events for matches (`MatchEvent`) and insights (`InsightEvent`);

- **MatchesPage**: Page that requests and shows matches insights, and listen to `MatchEvent`s stream emitted by `MatchBloc`;

- **InsightsPage**: Page that requests and shows matches, and listen to `InsightEvent`s stream emitted by `MatchBloc`;

- **MatchRepository**: Interface for a repository that provides `Match` related data;

- **FirebaseRealtimeDb**: Firebase Realtime Database implementation of `MatchRepository`;

The image below shows how the components are connected

<img align="center" src="https://user-images.githubusercontent.com/4440882/83931617-fc0cdb00-a773-11ea-8f9b-d8fcb5503b71.png" width="600" height="400"/>
