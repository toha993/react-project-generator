#!/bin/bash

# Set default project name or use provided argument
if [ $# -eq 0 ]; then
  PROJECT_NAME="my-react-tailwind-app"
  echo "No project name provided. Using default name: $PROJECT_NAME"
  echo "You can provide a custom name: ./create-react-tailwind.sh <project-name>"
else
  PROJECT_NAME=$1
fi

# Create Vite React project
echo "Creating React project with Vite: $PROJECT_NAME"
npm create vite@latest $PROJECT_NAME -- --template react

# Navigate to project directory
cd $PROJECT_NAME

# Install dependencies
echo "Installing dependencies..."
npm install

# Install Tailwind CSS and its dependencies
echo "Installing Tailwind CSS..."
npm install -D tailwindcss @tailwindcss/vite

# Configure Tailwind
cat > tailwind.config.js << EOL
/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
EOL


# Create Vite config
cat > vite.config.js << EOL
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import tailwindcss from "@tailwindcss/vite";


export default defineConfig({
  plugins: [react(), tailwindcss()],
})
EOL

# Create folder structure
echo "Setting up project folder structure..."

# Create common directories
mkdir -p src/assets/{images,fonts,icons}
mkdir -p src/components/{common,layout}
mkdir -p src/pages
mkdir -p src/hooks
mkdir -p src/services
mkdir -p src/utils
mkdir -p src/context
mkdir -p src/styles

# Create placeholder files to ensure Git tracks empty directories
touch src/assets/images/.gitkeep
touch src/assets/fonts/.gitkeep
touch src/assets/icons/.gitkeep
touch src/components/common/.gitkeep
touch src/components/layout/.gitkeep
touch src/pages/.gitkeep
touch src/hooks/.gitkeep
touch src/services/.gitkeep
touch src/utils/.gitkeep
touch src/context/.gitkeep

# Create Tailwind CSS entry file
cat > src/index.css << EOL
@import "tailwindcss";
EOL

# Create a Tailwind-styled App.jsx
cat > src/App.jsx << EOL
import './index.css'

function App() {
  return (
    <div className="min-h-screen bg-gray-100 flex flex-col items-center justify-center p-4">
      <div className="bg-white p-8 rounded-lg shadow-lg max-w-md w-full text-center">
        <h1 className="text-3xl font-bold text-blue-600 mb-4">Hello World!</h1>
        <p className="text-gray-700 text-lg">Welcome to $PROJECT_NAME</p>
        <div className="mt-6 p-4 bg-gray-50 rounded-md">
          <p className="text-sm text-gray-500">
            Edit <code className="bg-gray-100 p-1 rounded text-sm font-mono">src/App.jsx</code> and save to test HMR
          </p>
        </div>
        <button className="mt-4 bg-blue-500 hover:bg-blue-600 text-white font-medium py-2 px-4 rounded transition-colors">
          Tailwind Button
        </button>
      </div>
    </div>
  )
}

export default App
EOL

# Remove App.css as we're using Tailwind
rm -f src/App.css

# Create a README with folder structure information
cat > README.md << EOL
# ${PROJECT_NAME}

This project was created with Vite and Tailwind CSS and includes a standard folder structure.

## Project Structure

\`\`\`
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
├── styles/        # CSS and styling files (includes Tailwind CSS)
└── utils/         # Utility functions and helpers
\`\`\`

## Tailwind CSS

This project is set up with Tailwind CSS for styling. You can use Tailwind utility classes directly in your JSX to style your components.

## Available Scripts

In the project directory, you can run:

### \`npm run dev\`

Runs the app in development mode.
Open [http://localhost:5173](http://localhost:5173) to view it in your browser.

### \`npm run build\`

Builds the app for production to the \`dist\` folder.

### \`npm run preview\`

Locally preview the production build.
EOL

# Initialize Git repository with .gitignore
echo "Setting up Git repository..."
git init
cat > .gitignore << EOL
# Logs
logs
*.log
npm-debug.log*
yarn-debug.log*
yarn-error.log*
pnpm-debug.log*
lerna-debug.log*

node_modules
dist
dist-ssr
*.local

# Editor directories and files
.vscode/*
!.vscode/extensions.json
.idea
.DS_Store
*.suo
*.ntvs*
*.njsproj
*.sln
*.sw?
EOL

# Final message
echo ""
echo "✅ React project with Tailwind CSS '$PROJECT_NAME' has been successfully created!"
echo "Your folder structure is ready with Tailwind CSS integration."
echo "The app displays a simple Hello World message styled with Tailwind."
echo ""
echo "To get started:"
echo "  cd $PROJECT_NAME"
echo "  npm run dev"
echo ""
echo "Project structure has been set up with common folders ready for your components."