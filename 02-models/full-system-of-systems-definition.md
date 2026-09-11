# Full System of Systems Definition

```math
\boxed{ \mathcal S=\{P,T,I,O\} }
```

We study a:

```math
\boxed{\textbf{Multilayer Physical Informational Organizational Interdependent Infrastructure System}}
```

with:

```math
\boxed{ \underbrace{P,T}_{\text{physical infrastructure systems}} \qquad \underbrace{I,O}_{\text{informational and organizational layers}} }
```

The complete system state is:

```math
\boxed{ Y(t)= \begin{bmatrix} x_P(t)\\ x_T(t)\\ z_I(t)\\ z_O(t) \end{bmatrix} }
```

---

# 1. Power System `P`

Framework-level decomposition:

```math
\boxed{ P= P_G \cup P_{Tr} \cup P_D \cup P_{DER} \cup P_C \cup P_{TP} }
```

### `P_G` — Generation

- conventional generation
- solar generation
- wind generation
- distributed generation

### `P_{Tr}` — Transmission

- high-voltage buses
- transmission lines
- bulk substations
- transmission transformers

### `P_D` — Distribution

- distribution substations
- feeders
- transformers
- buses
- LV/MV networks
- critical loads

### `P_{DER}` — Distributed Energy Resources and Storage

- battery energy storage systems
- distributed PV
- microgrids
- local generation
- flexible DERs

### `P_C` — Charging Power Infrastructure

- EV charging stations
- fast chargers
- bus depot chargers
- opportunity chargers
- AC/DC converters
- bidirectional chargers
- smart-charging infrastructure
- V2G interfaces

### `P_{TP}` — Traction Power Supply

- traction substations
- traction transformers
- rectifiers
- inverters
- railway feeders
- catenary
- third rail
- return circuits
- wayside storage
- AC traction systems
- DC traction systems

Therefore:

```math
\boxed{ P= \{\text{generation, transmission, distribution, DER/storage, charging, traction power}\} }
```

Representative physical state:

```math
\boxed{ x_P= [ V,\theta,f,P_{ij},Q_{ij},P_G,P_L,SOC ]^{\top} }
```

---

# 2. Transportation System `T`

Framework-level decomposition:

```math
\boxed{ T= T_R \cup T_B \cup T_U \cup T_H \cup T_M }
```

### `T_R` — Road Transportation

- road links
- intersections
- traffic signals
- traffic flows
- private vehicles
- EVs
- taxis
- shared mobility
- charging access
- critical road corridors
- emergency routes
- repair crew routes

### `T_B` — Electric Bus Transportation

- electric buses
- bus routes
- depots
- terminals
- depot charging
- opportunity charging
- bus scheduling
- fleet operations

### `T_U` — Urban Rail Transit

```math
\boxed{ T_U= \{ \text{Metro}, \text{MRT}, \text{Subway}, \text{LRT}, \text{Tram} \} }
```

Include:

- trains
- tracks
- stations
- platforms
- signaling
- traction interfaces
- depots
- passenger transfer nodes
- operational schedules

### `T_H` — Regional and Heavy Electrified Rail

- commuter rail
- suburban rail
- regional rail
- intercity rail
- high-speed rail
- electrified freight rail where relevant

### `T_M` — Multimodal and Transfer System

- intermodal stations
- transfer hubs
- road-to-rail connections
- bus-to-rail connections
- alternative routes
- passenger transfers
- emergency substitution between modes

Therefore:

```math
\boxed{ T= \{\text{road EV, electric bus, urban rail, regional/heavy rail, multimodal transfer}\} }
```

Representative state:

```math
\boxed{ x_T= [ q,k,v,TT,A,SOC_{EV},s_{\rm rail} ]^{\top} }
```

where `A` captures accessibility and `s_{\rm rail}` represents relevant rail operational states.

---

# 3. Information System `I`

Framework-level decomposition:

```math
\boxed{ I= I_S \cup I_C \cup I_D \cup I_E \cup I_A \cup I_X \cup I_{\tau} }
```

### `I_S` — Sensing and Measurement

Power:

- SCADA measurements
- PMUs
- smart meters
- IEDs
- feeder/substation sensors
- traction-power measurements
- charging-station measurements

Transportation:

- traffic detectors
- cameras
- roadside sensors
- vehicle telemetry
- EV SOC telemetry
- bus telemetry
- train position/speed
- track/station sensors

### `I_C` — Communication and Networking

Power:

- utility WAN
- SCADA communication
- substation communication
- PMU communication
- AMI networks

Transportation:

- V2V
- V2I
- V2X
- roadside units
- cellular communication
- ITS networks
- train-to-wayside communication
- rail radio/fiber networks

### `I_D` — Data Acquisition and Management

- SCADA databases
- synchrophasor streams
- AMI data
- traffic-management data
- vehicle/train telemetry
- charging data
- event logs
- databases
- APIs
- data streams
- data fusion

### `I_E` — Estimation and Situational Awareness

Power:

- state estimation
- load estimation
- topology estimation
- outage detection
- DER/EV estimation

Transportation:

- traffic-state estimation
- congestion estimation
- accessibility estimation
- travel-time estimation
- train localization
- service-state estimation

Mathematically:

```math
\boxed{ \hat X(t)=\mathcal E(y_{[0,t]},I(t)) }
```

### `I_A` — Automation, Signaling and Control Logic

Power:

- EMS
- DMS
- SCADA control logic
- protection commands
- DER control
- charging-control signals

Road:

- adaptive traffic signals
- route guidance
- charging scheduling

Rail:

- CBTC
- ATP
- ATO
- ATS

### `I_X` — Cross-Domain Interoperability

- EV-grid communication
- smart charging
- V2G information exchange
- charging platforms
- power-transport APIs
- traction energy management
- energy-mobility coordination
- edge/cloud platforms

Central relation:

```math
\boxed{ P \leftrightarrow I_X \leftrightarrow T }
```

### `I_{\tau}` — Timing, Synchronization and Positioning

- timestamps
- clock synchronization
- update timing
- GNSS/location
- train positioning
- measurement synchronization
- information freshness

Key information attributes:

```math
\boxed{ z_I= [ A_I,L_I,Q_I,\Delta_I,p_{\rm loss},e_X,\epsilon_{\rm sync} ]^{\top} }
```

with:

- availability `A_I`
- latency `L_I`
- data quality `Q_I`
- information age `\Delta_I`
- data loss `p_{\rm loss}`
- estimation error `e_X`
- synchronization error `\epsilon_{\rm sync}`

Conceptually:

```math
\boxed{ I=\text{SENSE + COMMUNICATE + ESTIMATE + SIGNAL} }
```

or simply:

```math
\boxed{I=\textbf{KNOW}}
```

---

# 4. Organizational System `O`

Framework-level decomposition:

```math
\boxed{ O= O_A \cup O_G \cup O_D \cup O_C \cup O_R \cup O_W \cup O_L \cup O_M \cup O_X \cup O_K }
```

### `O_A` — Actors and Responsibilities

- power utilities
- system/grid operators
- distribution operators
- charging operators
- traction-power operators
- road authorities
- traffic management centers
- bus operators
- Metro/MRT operators
- railway infrastructure managers
- train operators
- telecom operators
- emergency authorities
- regulators
- contractors
- suppliers

### `O_G` — Governance and Institutional Rules

- laws
- regulations
- contracts
- policies
- operating procedures
- emergency plans
- authority structures
- restoration priorities

### `O_D` — Decision Making

- damage interpretation
- prioritization
- intervention selection
- repair decisions
- service prioritization
- centralized decision making
- decentralized decision making
- collaborative decision making

### `O_C` — Coordination

- intra-agency coordination
- inter-agency coordination
- power-transport coordination
- emergency command
- joint planning
- information sharing
- command alignment

Organizational network:

```math
\boxed{ \mathcal G_O(t)= (V_O,E_O(t),W_O(t)) }
```

### `O_R` — Resource Allocation

- repair crews
- maintenance vehicles
- equipment
- spare parts
- mobile generation
- batteries
- emergency vehicles
- budgets
- technical resources

### `O_W` — Workforce Capability

- engineers
- operators
- dispatchers
- maintenance personnel
- repair crews
- specialists
- training
- expertise
- workforce availability

### `O_L` — Logistics and Mobilization

- crew dispatch
- equipment deployment
- staging
- spare-part delivery
- route selection
- mobile generator deployment
- resource mobilization

### `O_M` — Restoration Management

- inspection priorities
- repair prioritization
- crew assignment
- restoration sequence
- restoration scheduling
- critical-service priorities

### `O_X` — Cross-Sector Collaboration

```math
\boxed{ O_P \leftrightarrow O_T \leftrightarrow O_I \leftrightarrow O_E }
```

including coordination among:

- power operators
- road authorities
- rail/transit operators
- communication operators
- emergency organizations
- regulators

### `O_K` — Learning and Adaptation

- after-action learning
- institutional memory
- procedure updates
- adaptive governance
- lessons learned
- long-term organizational adaptation

Representative organizational state:

```math
\boxed{ z_O= [ A_O,C_O,R_O,W_O, \tau_D,\tau_C^{O},\tau_M ]^{\top} }
```

representing authority, coordination, resources, workforce, decision time, coordination time, and mobilization time.

Conceptually:

```math
\boxed{ O=\text{DECIDE + COORDINATE + RESOURCE + MOBILIZE} }
```

---

# 5. The Complete Physical Coupling

The two physical systems interact through several interfaces, not one generic `P\leftrightarrow T` arrow.

### Road and EVs

```math
\boxed{ P_D \leftrightarrow P_C \leftrightarrow T_R }
```

through charging, smart charging and V2G.

### Electric buses

```math
\boxed{ P_D \leftrightarrow P_C \leftrightarrow T_B }
```

through depot and opportunity charging.

### Metro, MRT, Subway, LRT and Tram

```math
\boxed{ P_{Tr/D} \leftrightarrow P_{TP} \leftrightarrow T_U }
```

through traction power and regenerative braking.

### Regional and Heavy Rail

```math
\boxed{ P_{Tr} \leftrightarrow P_{TP} \leftrightarrow T_H }
```

### Restoration dependency

```math
\boxed{ T \rightarrow \text{crew accessibility} \rightarrow \text{power restoration} }
```

---

# 6. Complete Cognitive and Control Architecture

The four systems connect through:

```math
\boxed{ X \rightarrow y \rightarrow I \rightarrow \hat X \rightarrow O \rightarrow u \rightarrow X }
```

where:

```math
\boxed{ X= \begin{bmatrix} x_P\\ x_T \end{bmatrix} }
```

is physical reality,

```math
\boxed{I=\text{KNOW}}
```

constructs system knowledge,

```math
\boxed{O=\text{DECIDE, COORDINATE, MOBILIZE}}
```

determines feasible response,

and:

```math
\boxed{u=\text{ACT}}
```

changes the physical system.

Therefore:

```math
\boxed{ u(t)\in\mathcal U(I(t),O(t)) }
```

---

# 7. Full System Architecture

The most compact representation is:

```math
\boxed{ \mathcal S= \left\{ \begin{array}{l} P= \{P_G,P_{Tr},P_D,P_{DER},P_C,P_{TP}\}\\[1mm] T= \{T_R,T_B,T_U,T_H,T_M\}\\[1mm] I= \{I_S,I_C,I_D,I_E,I_A,I_X,I_\tau\}\\[1mm] O= \{O_A,O_G,O_D,O_C,O_R,O_W,O_L,O_M,O_X,O_K\} \end{array} \right\} }
```

with:

```math
\boxed{ \begin{array}{ccc} & I &\\ \swarrow & \downarrow & \searrow\\ P & \rightleftarrows & T\\ \nwarrow & \uparrow & \nearrow\\ & O & \end{array} }
```

and the global state:

```math
\boxed{ Y(t)= [ x_P(t),x_T(t),z_I(t),z_O(t) ]^\top. }
```

## Framework level vs MSc implementation

The **framework remains comprehensive** as above.

For the numerical MSc demonstrator, a tractable core would be:

```math
\boxed{ P_{\mathrm{case}} = \{P_D,P_{DER},P_C,P_{TP}\} }
```

```math
\boxed{ T_{\mathrm{case}} = \{T_R,T_B,T_U\} }
```

```math
\boxed{ I_{\mathrm{case}} = \{\text{sensing, communication, estimation, cross-domain signaling}\} }
```

```math
\boxed{ O_{\mathrm{case}} = \{\text{decision, coordination, resource allocation, mobilization}\} }
```

This preserves the **general System-of-Systems theory** while keeping the validation computationally feasible.
