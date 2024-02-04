# Productivity Tracker App

This repository contains two projects: a Flutter app for tracking productivity and its backend server using Express.js and TypeScript.

## Flutter App - Productivity Tracker

### Overview

The Productivity Tracker app is built using Flutter, a UI toolkit that enables the development of natively compiled applications for mobile, web, and desktop from a single codebase.

### Features

- Task tracking: Create, edit, and delete tasks.
- Time tracking: Record time spent on each task.
- Progress visualization: View charts and statistics to monitor productivity.

### Getting Started

1. Make sure you have Flutter installed. If not, follow the [official Flutter installation guide](https://flutter.dev/docs/get-started/install).

2. Clone the repository:

   ```bash
   git clone https://github.com/your-username/productivity-tracker.git
   ```

3. Navigate to the `productivity-tracker` directory:

   ```bash
   cd productivity-tracker
   ```

4. Run the app:

   ```bash
   flutter run
   ```

5. Start tracking your productivity!

## Express.js and TypeScript Backend Server

### Overview

The backend server for the Productivity Tracker app is built using Express.js, a minimal and flexible Node.js web application framework, and TypeScript, a superset of JavaScript that adds static typing.

### Features

- RESTful API: Communicate with the Flutter app to retrieve and store productivity data.
- Database integration: Store task and time tracking data in a database (e.g., MongoDB, MySQL).

### Getting Started

1. Ensure you have Node.js and npm installed. If not, download and install them from [Node.js official website](https://nodejs.org/).

2. Navigate to the `server` directory:

   ```bash
   cd server
   ```

3. Install dependencies:

   ```bash
   npm install
   ```

4. Configure the environment variables in the `.env` file.

5. Start the server:

   ```bash
   npm start
   ```

   The server will be running on `http://localhost:3000` by default.

### Database Configuration

The server is designed to work with various databases. Update the database configuration in the `.env` file based on your preferences.

## Future Development

- Enhance user interface and experience.
- Implement user authentication.
- Add notification features for task reminders.
- Expand backend functionalities, such as user management and additional analytics.

Feel free to contribute, report issues, or suggest improvements to make the Productivity Tracker even better!