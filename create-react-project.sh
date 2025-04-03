#!/bin/bash

# Set default project name or use provided argument
if [ $# -eq 0 ]; then
  PROJECT_NAME="my-react-app"
  echo "No project name provided. Using default name: $PROJECT_NAME"
  echo "You can provide a custom name: ./create-react-project.sh <project-name>"
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
touch src/styles/.gitkeep

# Create a global CSS file
touch src/styles/global.css

# Simplify App.jsx to just display Hello World
cat > src/App.jsx << EOL
import './App.css'
import './styles/global.css'

function App() {
  return (
    <div className="app">
      <h1>Hello World!</h1>
      <p>Welcome to $PROJECT_NAME</p>
    </div>
  )
}

export default App
EOL

# Add some very basic styling
cat > src/App.css << EOL
.app {
  max-width: 1280px;
  margin: 0 auto;
  padding: 2rem;
  text-align: center;
}

h1 {
  color: #646cff;
}
EOL

# Create a README with folder structure information
cat > README.md << EOL
# ${PROJECT_NAME}

This project was created with Vite and includes a standard folder structure.

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
├── styles/        # CSS and styling files
└── utils/         # Utility functions and helpers
\`\`\`

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
echo "✅ React project '$PROJECT_NAME' has been successfully created!"
echo "Your folder structure is ready. The app displays a simple Hello World message."
echo ""
echo "To get started:"
echo "  cd $PROJECT_NAME"
echo "  npm run dev"
echo ""
echo "Project structure has been set up with common folders ready for your components."