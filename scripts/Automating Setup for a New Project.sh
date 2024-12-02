#!/bin/bash

# Get the directory of the current script and set ROOT_DIR to the parent of scripts/
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"

# Display usage information
usage() {
  echo "Usage: $0 <project_name>"
  echo ""
  echo "Description:"
  echo "  This script creates a new project structure under the root directory."
  echo ""
  echo "Arguments:"
  echo "  <project_name>   Name of the project to be created."
  echo ""
  echo "Example:"
  echo "  ./Automating Setup for a New Project.sh my_new_project"
  echo ""
  echo "Notes:"
  echo "  - The new project will be created at: $ROOT_DIR/<project_name>"
  echo "  - Ensure the project name is unique and does not already exist."
  exit 1
}

# Name of the project to create
PROJECT_NAME=$1

# Check if a project name is provided
if [[ -z "$PROJECT_NAME" ]]; then
  usage
fi

# Define the path for the new project
PROJECT_DIR="$ROOT_DIR/$PROJECT_NAME"

# Ensure the project doesn't already exist
if [[ -d "$PROJECT_DIR" ]]; then
  echo "Error: Project '$PROJECT_NAME' already exists in $ROOT_DIR."
  exit 1
fi

# Create the directory structure
mkdir -p "$PROJECT_DIR"/{bin,config,tests,logs,data/input,data/output,docs}

# Add a basic README.md for the project
cat <<EOF >"$PROJECT_DIR/README.md"
# $PROJECT_NAME
This directory contains the structure and files for the $PROJECT_NAME project.

## Directories:
- **bin/**: Executable scripts
- **config/**: Configuration files
- **tests/**: Test scripts
- **logs/**: Log files
- **data/**: Data files
  - **input/**: Input data
  - **output/**: Output data
- **docs/**: Documentation for the project
EOF

# Notify the user
echo "Project '$PROJECT_NAME' has been initialized at $PROJECT_DIR."
