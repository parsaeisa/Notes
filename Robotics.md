# Robotics

Topics:
- [Reinforcement Learning](https://github.com/parsaeisa/Notes/blob/main/AI/RL.md)
- 3D understanding

## 3D understanding

The whole idea is there are some cameras which throw some rays to the environment and then surfaces are extracted. 

Some Ray samplers:
- MonteCarloRaysampler
- NDCMultinomialRaysampler

Both are from `pytorch3d.renderer`.

## Tools

3D Vision & Point Cloud Processing:
* **Open3D:** Point cloud filtering, registration, surface fitting, and 3D segmentation.
* **PCL (Point Cloud Library):** Standard C++ framework for point cloud manipulation and filtering.
* **OpenCV:** 2D preprocessing of RGB-D camera feeds and feature extraction.

Robotics Middleware & Simulation:
* **ROS / ROS 2:** Node communication, sensor publishing, coordinate transforms (`tf2`), and actuator control.
* **Gazebo:** Physics simulation for industrial robot cells prior to real-world deployment.
* **RViz:** Real-time visualization of sensor streams, point clouds, and robot trajectories.

Motion Planning & Kinematics:
* **MoveIt / MoveIt 2:** Industrial motion planning, inverse kinematics (IK), and collision avoidance.
* **OMPL (Open Motion Planning Library):** Underlying sampling-based motion planning algorithms (e.g., RRT, PRM).

Core Languages & Scientific Computing:
* **Modern C++ (C++17/20):** High-performance execution, real-time control loops, and sensor drivers.
* **Python:** Rapid algorithmic prototyping, Open3D scripts, and data evaluation pipelines.
* **Eigen / Ceres Solver:** Linear algebra and non-linear optimization for geometric calibration and state estimation.

Industrial Interfaces & UI:
* **Qt / PyQt:** Desktop GUIs and operating panel applications (*Bedienpanels*).
* **Web-based Dashboards (React / rosbridge):** Modern browser panels communicating with the ROS backend.

Deployment & Infrastructure:
* **Docker:** Containerized development, dependency management, and reproducible ROS environments.
* **Linux (Ubuntu):** Operating system foundation for ROS ecosystems and driver integration.
* **GitLab CI / Git:** Version control, automated testing, and build pipelines for robotics codebases.

## ROS
The Robot Operating System (ROS) operates on a distributed graph of processes. The entire communication framework is built around four fundamental concepts:
### Core Architectural Concepts
#### 1. Nodes
* **Definition:** Independent executable processes (written in C++ or Python) designed to perform dedicated tasks.
* **Role:** A robotic system consists of many modular nodes running simultaneously (e.g., one node reads camera frames, another runs SLAM, and another controls motor actuators).

#### 2. Topics
* **Definition:** Asynchronous, multi-directional communication buses based on the **Publish/Subscribe (Pub/Sub)** pattern.
* **Role:** Enable decoupled data streaming between nodes. 
  * *Example:* A LiDAR sensor node **publishes** raw scan point clouds to a topic (e.g., `/scan`), and a SLAM node **subscribes** to that topic to consume the incoming stream.

#### 3. Messages
* **Definition:** Strictly-typed, standardized data structures exchanged across Topics.
* **Role:** Define the schema of data packets (e.g., sensor geometries, integer states, floating-point coordinates, or complex image arrays like `sensor_msgs/Image` and `geometry_msgs/Twist`).

#### 4. Services & Actions
* **Definition:** Synchronous and Goal-driven communication paradigms for non-continuous interactions.
  * **Services:** Synchronous **Request/Response** pairs used for quick queries or state changes (e.g., `/get_battery_status` or `/reset_odometry`).
  * **Actions:** Asynchronous, preemptible, goal-oriented requests designed for long-running tasks that provide real-time feedback and allow cancellation (e.g., navigating to coordinate $(X, Y)$).