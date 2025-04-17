🐳 Docker Basics
This document provides a concise yet informative overview of Docker, Docker Compose, container lifecycle essentials, and networking. Whether you're just starting out or need a quick refresher, this guide will help clarify key Docker concepts.

📦 What is Docker?
Docker is a containerization platform that allows you to run applications in isolated environments called containers.
Each container is a lightweight, standalone, and executable package that includes everything needed to run the application, such as:

Code

Runtime

System tools

Libraries

Dependencies

Unlike virtual machines, containers share the host system's kernel, making them efficient and fast. They do not rely on pre-installed services from the host.

🧩 What is Docker Compose?
Docker Compose is a tool used to manage multi-container Docker applications.
With Compose, you can:

Define services, volumes, and networks in a single docker-compose.yml file

Use simple commands like docker-compose up and docker-compose down to manage the whole stack

Great for managing environments like:

Web + database + cache servers

Microservice-based systems

⚙️ Docker Architecture
Docker uses a client-server architecture:

Docker Client:
The interface through which users interact with Docker (e.g., via CLI commands like docker build, docker run, etc.).

Docker Daemon (dockerd):
The background service that listens for Docker API requests and manages Docker objects like images, containers, networks, and volumes.

Flow example:

arduino
Copy
Edit
You run `docker run` --> Docker Client sends API request --> Docker Daemon processes it and spins up a container
🧠 PID 1 — The Init Process in Containers
Every Docker container has a PID 1 process — the first process started inside the container. It acts as the init process and is the ancestor of all other processes within the container.

Why PID 1 matters:

It is responsible for forwarding OS signals (e.g., SIGTERM, SIGINT) to its child processes.

If PID 1 doesn’t handle these signals correctly, child processes might not shut down cleanly, causing unexpected behavior.

💡 Best practice: Use tools like tini or write proper signal handling logic in your container's entrypoint script.

💾 Volumes — Persisting Data
By default, data written inside a container is ephemeral—it disappears once the container stops or is removed.

To persist data, Docker offers two main storage mechanisms:

1. Volumes
Managed by Docker itself

Data is stored in a part of the host filesystem managed by Docker (/var/lib/docker/volumes/...)

Only accessible by Docker

Recommended approach due to performance and portability

2. Bind Mounts
Link a specific file or directory from the host into the container

Changes in the container reflect on the host and vice versa

Useful for development scenarios or sharing data between host and container

🌐 Docker Networks
Docker networking allows containers to communicate with each other and with the outside world. Docker provides several network drivers, but the most commonly used one is:

🔗 Bridge Network
Default network driver used by Docker

Created automatically when Docker is installed (bridge)

Containers on the same bridge network can communicate with each other

Each container gets its own IP address

Supports NAT (Network Address Translation) for internet access

Provides isolation between containers on different networks

📝 You can create custom bridge networks to control communication more precisely and use container names as DNS hostnames.
ressources
docker basics:
  https://docs.docker.com/get-started/docker-overview/
pid1:
  https://cloud.theodo.com/en/blog/docker-processes-container
volumes && networks
  https://pagertree.com/learn/docker/storage
