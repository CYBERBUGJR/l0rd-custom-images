# l0rd-custom-images

Custom Docker images for l0rd domain with automated CI/CD pipeline.

## 🏗️ Image Build Pipeline

This repository automatically builds Docker images from individual folders in the `images/` directory using GitHub Actions.

### How it works

1. **Automatic Discovery**: The pipeline scans the `images/` directory for subdirectories containing a `Dockerfile`
2. **Matrix Build**: Each discovered image is built in parallel using a matrix strategy
3. **Multi-Architecture**: Images are built for both `linux/amd64` and `linux/arm64` platforms
4. **Container Registry**: Built images are pushed to GitHub Container Registry (ghcr.io)
5. **Smart Caching**: Uses GitHub Actions cache to speed up subsequent builds

### 🚀 Available Images

| Image | Description | Path |
|-------|-------------|------|
| `nginx-custom` | Custom Nginx with l0rd branding | `images/nginx-custom/` |
| `node-app` | Node.js application template | `images/node-app/` |

### 📁 Directory Structure

```
images/
├── nginx-custom/
│   ├── Dockerfile
│   ├── nginx.conf
│   └── html/
│       └── index.html
└── node-app/
    ├── Dockerfile
    ├── package.json
    └── server.js
```

### 🔄 Pipeline Triggers

The build pipeline runs when:
- **Push to main/develop**: Changes to any files in `images/` directory
- **Pull Requests**: Changes to any files in `images/` directory
- **Manual Trigger**: Via GitHub Actions workflow dispatch

### 🏷️ Image Tagging

Images are automatically tagged with:
- `latest` (for main branch)
- Branch name (for feature branches)
- `{branch}-{sha}` (commit-specific tags)
- PR number (for pull requests)

### 🐳 Using the Images

Pull images from GitHub Container Registry:

```bash
# Pull the latest nginx-custom image
docker pull ghcr.io/cyberbugjr/l0rd-custom-images/nginx-custom:latest

# Pull the latest node-app image
docker pull ghcr.io/cyberbugjr/l0rd-custom-images/node-app:latest
```

### ➕ Adding New Images

To add a new custom image:

1. Create a new directory under `images/` (e.g., `images/my-new-app/`)
2. Add a `Dockerfile` to the directory
3. Include any additional files needed for the image
4. Commit and push - the pipeline will automatically detect and build your image!

### 🔧 Local Development

Build images locally for testing:

```bash
# Build nginx-custom image
docker build -t l0rd/nginx-custom ./images/nginx-custom/

# Build node-app image
docker build -t l0rd/node-app ./images/node-app/

# Run locally
docker run -p 8080:80 l0rd/nginx-custom
docker run -p 3000:3000 l0rd/node-app
```
