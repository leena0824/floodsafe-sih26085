# FloodSafe – Street-Level Urban Flood Nowcasting

FloodSafe is a unique SIH 26085 software prototype for predicting short-term street flooding and recommending safer routes.

## Why it is different

- Predicts flood risk for individual road segments, not only entire districts.
- Combines rainfall, elevation, drainage capacity, sensor readings, and community reports.
- Generates routes that avoid flooded roads.
- Shows why each warning was issued and how reliable it is.
- Supports an offline emergency state for low-connectivity situations.

## Core features

- 15, 30, and 60-minute flood-risk forecasts
- Verified citizen flood reports with confidence scores
- Street-level risk map
- Safe-route recommendations
- Evidence panel with rainfall, drainage, elevation, and sensor inputs
- Admin dashboard for municipal teams
- Multilingual interface

## MVP architecture

```text
Next.js + MapLibre
        |
        v
FastAPI backend
        |
PostgreSQL + PostGIS
        |
LightGBM/XGBoost + routing service
```

## Repository structure

```text
backend/       FastAPI application and ML service
frontend/      Next.js application and map interface
data/          synthetic data and database seed scripts
docs/          architecture, API, and demo documentation
```

## 48-hour implementation plan

1. Create synthetic road segments and flood observations.
2. Build the FastAPI endpoints and PostGIS schema.
3. Train a baseline LightGBM or XGBoost risk model.
4. Add MapLibre risk visualization and citizen reporting.
5. Compute safe routes with Valhalla or OR-Tools.
6. Add explainability, confidence labels, and source timestamps.
7. Record a 3-minute mobile-first demo.

## Local setup

Prerequisites: Node.js 20+, Python 3.12+, Docker, and Docker Compose.

```bash
docker compose up -d
```

Detailed setup and API documentation will be added in `docs/`.

## SIH mapping

- **Catalogue:** SIH26085
- **Track:** Software
- **Theme:** Disaster Management
- **Problem:** Urban Flood Nowcasting – Drainage and Rainfall Coupling

## References

The following repositories are implementation references, not starter code copies:

- https://github.com/mKs2609/setu_ner
- https://github.com/MahmoudNagiubX/Egypt-Smart-City-Digital-Twin
- https://github.com/adev0x3b/jugrid
- https://github.com/nitinc264/Flood-prediction-Model

## Ethical and safety goals

FloodSafe must never present a predicted risk as guaranteed. The prototype should use clearly visible confidence ranges, timestamps, and fallback directions to official emergency services.
