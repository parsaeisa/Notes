# Automated Driving

The whole system architecture:
```mermaid
flowchart TD
    %% Subgraphs / Layers
    subgraph L1 ["1. Sensing Layer (Hardware & Data Ingestion)"]
        S1["LiDAR Sensors"]
        S2["Cameras (RGB / Stereo)"]
        S3["Radar Sensors"]
        S4["IMU & Wheel Odometry"]
        S5["GNSS / RTK GPS"]
    end

    subgraph L2 ["2. Perception & State Estimation Layer"]
        subgraph L2_Loc ["Localization & Mapping"]
            SLAM["SLAM (Simultaneous Localization & Mapping)"]
            HDMap["HD-Map Matching & Localization"]
            DeadReck["Dead Reckoning & Sensor Fusion"]
        end
        
        subgraph L2_Dyn ["Dynamic Scene Understanding"]
            Det["3D Object Detection (Cars, Pedestrians)"]
            Track["Multi-Object Tracking (MOT)"]
            Pred["Trajectory & Behavior Prediction"]
        end
    end

    subgraph L3 ["3. Planning & Decision Making Layer"]
        RoutePlan["Mission & Global Route Planning"]
        BehavPlan["Behavioral Planning & Decision Logic"]
        MotionPlan["Local Path & Trajectory Planning"]
    end

    subgraph L4 ["4. Control & Actuation Layer"]
        Controllers["Vehicle Controllers (MPC, PID)"]
        Actuators["Drive-by-Wire Actuators (Steer, Throttle, Brake)"]
    end

    %% Data Flow Connections
    L1 --> L2
    
    SLAM --> MotionPlan
    HDMap --> BehavPlan
    Pred --> MotionPlan
    
    RoutePlan --> BehavPlan
    BehavPlan --> MotionPlan
    MotionPlan --> Controllers
    Controllers --> Actuators

    %% Styling & Classes
    classDef highlight fill:#2B4C7E,stroke:#4A90E2,stroke-width:2px,color:#FFFFFF,font-weight:bold;
    classDef defaultNode fill:#1E222D,stroke:#3D4450,stroke-width:1.5px,color:#E0E0E0;
    classDef layerBox fill:#0F131A,stroke:#262C36,stroke-width:2px,color:#64B5F6;

    class SLAM highlight;
    class S1,S2,S3,S4,S5,HDMap,DeadReck,Det,Track,Pred,RoutePlan,BehavPlan,MotionPlan,Controllers,Actuators defaultNode;
    class L1,L2,L2_Loc,L2_Dyn,L3,L4 layerBox;
```

<img src="https://github.com/parsaeisa/Notes/blob/main/AI/Image/autonomous-driving-architecture.png">

1. **Sensing Layer:** Raw data acquisition from physical sensors (LiDAR, Cameras, Radar, IMU, GNSS).
2. **Perception & State Estimation Layer:**
   * **Localization & Mapping:** Determining exact vehicle pose via **SLAM** or **HD-Map Matching**.
   * **Dynamic Perception:** 3D object detection, multi-object tracking, and trajectory prediction.
3. **Planning Layer:** Behavioral decision-making and optimal collision-free path/trajectory generation.
4. **Control & Actuation Layer:** Executing steering, throttle, and brake commands (e.g., via MPC/PID controllers) to track planned trajectories.
