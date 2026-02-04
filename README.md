## What This Is

This is a simple React app running in a Docker container. It displays "Codin 1" on the page and runs on port 7775.

I used Vite instead of Create React App because it's faster and more modern.

## Requirements

You need Docker installed on your computer. That's pretty much it - everything else runs inside the container.

## How to Run It

1. Clone this repo
2. Open terminal and go to the project folder
3. Build the Docker image:
   ```bash
   docker build -t singh_arshpreet_coding_assignment11 .
   ```
4. Run the container:
   ```bash
   docker run --name singh_arshpreet_coding_assignment11 -p 7775:7775 singh_arshpreet_coding_assignment11
   ```
5. Open your browser and go to `http://localhost:7775`

You should see "Codin 1" displayed on the page.

## Project Files

- `Dockerfile` - tells Docker how to build and run the app
- `package.json` - lists all the npm packages needed
- `vite.config.js` - configures Vite to use port 7775
- `index.html` - main HTML file
- `src/main.jsx` - the React code

## Useful Docker Commands

Check if container is running:
```bash
docker ps
```

Stop the container:
```bash
docker stop singh_arshpreet_coding_assignment11
```

Start it again:
```bash
docker start singh_arshpreet_coding_assignment11
```

See what went wrong:
```bash
docker logs singh_arshpreet_coding_assignment11
```

Remove the container:
```bash
docker stop singh_arshpreet_coding_assignment11
docker rm singh_arshpreet_coding_assignment11
```

## The Dockerfile Explained

```dockerfile
FROM node:18-alpine
```
Uses Node.js version 18 on Alpine Linux (lightweight version).

```dockerfile
WORKDIR /singh_arshpreet_site
```
Sets up the working directory inside the container.

```dockerfile
COPY package*.json ./
RUN npm install
```
Copies package files and installs dependencies.

```dockerfile
COPY . .
```
Copies all the project files into the container.

```dockerfile
EXPOSE 7775
```
Opens port 7775.

```dockerfile
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0", "--port", "7775"]
```
Starts the Vite dev server on port 7775.

## If Something Goes Wrong

**Port already in use:**
```bash
docker stop singh_arshpreet_coding_assignment11
docker rm singh_arshpreet_coding_assignment11
```
Then try running it again.

**Container keeps stopping:**
Check the logs to see what's wrong:
```bash
docker logs singh_arshpreet_coding_assignment11
```

**Made changes and they're not showing:**
You need to rebuild:
```bash
docker stop singh_arshpreet_coding_assignment11
docker rm singh_arshpreet_coding_assignment11
docker build -t singh_arshpreet_coding-assignment11 .
docker run --name singh_arshpreet_coding_assignment11 -p 7775:7775 singh_arshpreet_coding_assignment11
```

## Why Vite?

I went with Vite instead of Create React App because:
- It's way faster to start up
- Hot reload actually works properly
- Smaller file sizes
- More modern tooling

## Notes

The container name follows the assignment requirement: `singh_arshpreet_coding_assignment11`

The working directory inside the container is `singh_arshpreet_site` as required.

Everything runs on port 7775 as specified in the assignment.
