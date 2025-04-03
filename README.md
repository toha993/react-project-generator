# React Project Generator

A simple bash script to quickly generate a new React project with Vite and an organized folder structure.

## Purpose

This tool helps developers quickly bootstrap a new React project with a standardized folder structure, saving time that would otherwise be spent manually creating directories and organizing files. It's particularly useful for teams that want to maintain consistency across projects or for developers who frequently start new React applications.

## What it Does

- Creates a new React project using Vite
- Sets up a comprehensive and organized folder structure following best practices
- Initializes a Git repository with appropriate `.gitignore`
- Creates placeholder files to ensure Git tracks empty directories
- Generates a simple "Hello World" React application as a starting point
- Provides detailed documentation on the folder structure

### Folder Structure Created

```
src/
├── assets/        # Static assets like images, fonts, etc.
│   ├── images/    # Image files
│   ├── fonts/     # Font files
│   └── icons/     # Icon files
├── components/    # Reusable UI components
│   ├── common/    # Shared components like Button, Input, etc.
│   └── layout/    # Layout components like Header, Footer, etc.
├── context/       # React context providers
├── hooks/         # Custom React hooks
├── pages/         # Page components for routing
├── services/      # API services and external integrations
├── styles/        # CSS and styling files
└── utils/         # Utility functions and helpers
```

## Installation

1. Clone this repository:

   ```bash
   git clone https://github.com/yourusername/react-project-generator.git
   ```

2. Navigate to the directory:

   ```bash
   cd react-project-generator
   ```

3. Make the script executable:
   ```bash
   chmod +x create-react-project.sh
   ```

## How to Use

### Basic Usage

Run the script with a project name:

```bash
./create-react-project.sh my-awesome-project
```

This will create a new folder called `my-awesome-project` with all the necessary structure.

### Using the Default Project Name

If you run the script without specifying a project name, it will use the default name "my-react-app":

```bash
./create-react-project.sh
```

### After Creation

Once the project is created:

1. Navigate to the project folder:

   ```bash
   cd my-project-name
   ```

2. Start the development server:

   ```bash
   npm run dev
   ```

3. Open your browser and visit `http://localhost:5173` to see your new React app.

## Requirements

- Node.js (v18 or later recommended)
- npm or yarn
- Bash shell environment

## Customization

Feel free to modify the script to suit your specific needs:

- Add or remove folders from the structure
- Change the default project name
- Include additional dependencies or configuration files
- Modify the "Hello World" template

## License

MIT

## Contributing

Contributions are welcome! Feel free to submit a pull request or open an issue if you have suggestions for improvements.
