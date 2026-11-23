# FloodSafe Architecture

## Components

### Frontend

Next.js renders a mobile-first MapLibre map, 15/30/60-minute risk modes, citizen reports, evacuation routes, and an evidence panel.

### API

FastAPI exposes:

- `GET /roads?risk_window=15|30|60`
- `GET /routes/start=<lat,lon>&end=<lat,lon>&window=30`
- `POST /reports`
- `GET /alerts?city=<name>`
- `GET /health`

### Data

PostgreSQL with PostGIS stores road segments, rainfall observations, drainage capacity, elevation, sensors, citizen reports, and predicted risk.

### Model

The MVP trains LightGBM or XGBoost using synthetic and public historical rainfall/flood observations. At inference, each road segment receives a probability and explanation factors.

### Routing

Valhalla or a lightweight weighted-graph service penalizes high-risk road segments. For the fastest prototype, OR-Tools or Dijkstra can calculate an alternative over road segments loaded into PostgreSQL/PostGIS.

## Unique differentiation

The system adds report verification and decision explainability before routing. A route is selected only after segment-level risk, report confidence, sensor freshness, and prediction horizon are considered.

## Demo flow

1. Select a simulated rainburst.
2. Show road segments changing color.
3. Submit a geotagged citizen report.
4. Open the evidence panel.
5. Request an alternative route.
6. Compare recommended and predicted flooded paths.
