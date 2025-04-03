# React Project Generator Scripts

A collection of bash scripts to quickly generate new React projects with organized folder structures. This repository includes two script options:

1. **Basic React Setup** - A clean React + Vite setup with a standard folder structure
2. **React + Tailwind CSS Setup** - Same as the basic setup but with Tailwind CSS pre-configured

## Purpose

These tools help developers quickly bootstrap new React projects with standardized folder structures, saving time that would otherwise be spent manually creating directories and organizing files. They're particularly useful for teams that want to maintain consistency across projects or for developers who frequently start new React applications.

## What They Do

### Basic React Setup (`create-react-basic.sh`)

- Creates a new React project using Vite
- Sets up a comprehensive and organized folder structure following best practices
- Initializes a Git repository with appropriate `.gitignore`
- Creates placeholder files to ensure Git tracks empty directories
- Generates a simple "Hello World" React application as a starting point

### React + Tailwind CSS Setup (`create-react-tailwind.sh`)

- Does everything the basic setup does
- Additionally installs and configures Tailwind CSS
- Uses Tailwind classes in the sample components
- Provides a more styled Hello World example

### Folder Structure Created (Both Scripts)

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

3. Make the scripts executable:
   ```bash
   chmod +x create-react-basic.sh create-react-tailwind.sh
   ```

## How to Use

### Basic React Setup

```bash
./create-react-basic.sh my-project-name
```

### React with Tailwind CSS

```bash
./create-react-tailwind.sh my-tailwind-project
```

### Using Default Project Names

Both scripts use a default project name if none is provided:

```bash
./create-react-basic.sh     # Creates "my-react-app"
./create-react-tailwind.sh  # Creates "my-react-tailwind-app"
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
- npm
- Bash shell environment

## Customization

Feel free to modify the scripts to suit your specific needs:

- Add or remove folders from the structure
- Change the default project names
- Include additional dependencies or configuration files
- Modify the template components

## License

MIT

## Contributing

Contributions are welcome! Feel free to submit a pull request or open an issue if you have suggestions for improvements.
