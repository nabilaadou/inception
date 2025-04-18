# Docker Inception 🐳

A beginner-friendly overview of Docker, Docker Compose, containers, volumes, networking, and more.

---

## **What is Docker?**

Docker is a **containerization platform** that runs applications in isolated environments called **containers**.

Containers are:
- Lightweight
- Fast
- Portable

Each container contains everything needed to run your application (code, libraries, dependencies, etc.) and does **not** rely on any pre-installed services from the host machine.

---

## **What is Docker Compose?**

Docker Compose is a tool for defining and managing **multi-container Docker applications** using a YAML file.

With a `docker-compose.yml` file, you can:
- Configure services, volumes, networks, etc.
- Spin up the entire stack using one command:
  
  ```bash
  docker-compose up
  ```

---

## **Docker Architecture**

Docker uses a **client-server architecture**:

- **Docker Client**: Sends commands (like `docker run`, `docker build`) to the daemon.
- **Docker Daemon (`dockerd`)**: Performs requested tasks such as building images or running containers.

**Example Flow**:
```bash
docker run hello-world
# --> client sends request to daemon
# --> daemon pulls image and runs container
```

---

## **Docker Layers**

Docker images are built in **layers**, where each layer represents a set of **filesystem (FS) changes**. These changes could include actions like installing a package, modifying a file, or deleting content.

Each instruction in a Dockerfile (like `RUN`, `COPY`, etc.) creates a new layer.

When you build an image:
- Docker stacks these layers on top of each other.
- If you rebuild the image and only the top layer changes, Docker can **reuse cached layers** below to speed up the build.

When you **run a container** from an image:
- Docker uses a **union filesystem** to combine all the image layers into a single, unified view.
- Additionally, a **writable layer** is created on top. This layer captures any changes made by the running container (e.g., logs, temporary files).
- The original image layers remain **unchanged**, so multiple containers can share the same image without affecting each other.

This layered architecture makes Docker **efficient**, **modular**, and **fast** for development and deployment.

---

## **PID 1 — The Init Process**

In Docker containers, the **first process** that runs is called **PID 1** (or init process). It becomes the parent of all other processes in the container.

### Why it's important:
- PID 1 is responsible for **handling and forwarding OS signals** (like `SIGTERM`, `SIGINT`).
- If not handled properly, signals might be ignored, and child processes could remain running or exit improperly.

🛠 **Best Practice**:
Use proper init systems (e.g., [`tini`](https://github.com/krallin/tini)) or ensure your entrypoint handles signals.

---

## **Volumes — Persistent Storage**

By default, data inside a container is **lost** when the container stops or is removed.

Docker provides two main ways to **persist data**:

### 🔸 Volumes
- Managed entirely by Docker
- Stored in `/var/lib/docker/volumes/`
- Accessible only by Docker
- **Recommended** for most use cases due to better performance and ease of management

### 🔸 Bind Mounts
- Mount specific files/directories from the host into the container
- Changes are **reflected both ways** (host <--> container)
- Useful for development, real-time file sync

---

## **Networks — Container Communication**

Docker allows containers to communicate with each other and the outside world using **network drivers**.

### 🔹 Bridge Network (Default)
- Most common driver
- Created automatically (`bridge`)
- Containers on the same bridge network can talk to each other
- Each container has its own **internal IP**
- Provides **isolation** from containers not on the same network
- Enables **internet access** via **NAT (Network Address Translation)**

🧠 You can create **custom bridge networks** to better control container communication and use container names as DNS hostnames.

---

## **Summary Table**

| Concept        | Description |
|----------------|-------------|
| **Docker**     | Container platform to run isolated apps |
| **Compose**    | Tool for defining and managing multi-container apps |
| **PID 1**      | First process in a container; handles signals |
| **Volumes**    | Persistent data storage for containers |
| **Networking** | Allows communication between containers and external systems |

---

## **Resources**

- 📘 [docker basics](https://docs.docker.com/get-started/docker-overview/)
- 🧩 [pid1](https://cloud.theodo.com/en/blog/docker-processes-container)
- 🌐 [volumes && networks](https://pagertree.com/learn/docker/storage)
