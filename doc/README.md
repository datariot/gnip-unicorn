# Unicorn Roulette Docker Image

This document describes how to build and run the Unicorn Roulette web application using Docker.

## Prerequisites
- Docker installed on your system
- Task installed for build automation (`brew install go-task/tap/go-task`)

## Quick Start
```bash
# Build and run in one command
task all

# Access the application at http://localhost
```

## Individual Commands

### Building the Image
```bash
task build
```

### Running the Container
```bash
task run
```
The application will be available at http://localhost

### Stopping the Container
```bash
task stop
```

### Cleaning Up
To remove the container and image:
```bash
task clean
```

## Architecture
The application uses nginx:alpine as the base image for minimal footprint and security. Static files are served directly by nginx configured with security best practices.

### Components
- Base Image: nginx:alpine (minimal, secure)
- Web Server: nginx (serving static files)
- Static Files: HTML, JavaScript, and images
- Configuration: Custom nginx configuration with security headers

## Security Considerations
- Using official nginx:alpine base image
- Running as non-root user (nginx)
- Implementing security headers:
  - X-Frame-Options
  - X-XSS-Protection
  - X-Content-Type-Options
  - Content-Security-Policy
- Minimal image size and attack surface
- No unnecessary files or tools included

## Development
To modify the application:
1. Make changes to the HTML/JavaScript files
2. Rebuild the image: `task build`
3. Restart the container: `task stop && task run`

## Troubleshooting
If the container fails to start:
1. Check if port 80 is already in use: `lsof -i :80`
2. Review logs: `docker logs unicorn-roulette`
3. Verify all files are present: `docker exec unicorn-roulette ls -la /usr/share/nginx/html`