# Backend Specification: Scalable Media API
**Focus:** Efficient file processing and relational task structures.

### 1. Core Stack
* **Language:** Python 3.12+
* **Framework:** FastAPI (Asynchronous)
* **Database:** PostgreSQL (using `SQLAlchemy` or `SQLModel`)
* **Task Queue:** Celery + Redis (for background media processing)
* **Storage:** AWS S3 or MinIO

### 2. Database Schema
* **Tasks Table:**
    * `id`: UUID
    * `owner_id`: UUID (FK to Users)
    * `type`: Enum (TEXT, IMAGE, AUDIO)
    * `data_url`: String (S3 path)
    * `metadata`: JSONB (Stores audio duration, image dimensions, etc.)
    * `parent_id`: UUID (Self-referencing for subtasks)

### 3. Media Pipeline
When a media task is uploaded:
1.  **FastAPI** receives the file and streams it to S3.
2.  A **Celery Task** is triggered:
    * *Images:* Uses **Pillow** to generate a 200x200px thumbnail.
    * *Audio:* Uses **FFmpeg** to transcode to a standard AAC format and generate a waveform data array.
3.  The database is updated with the new metadata.

### 4. API Endpoints
* `POST /tasks/upload`: Multipart/form-data for media.
* `GET /tasks/tree`: Returns a nested JSON structure of tasks and subtasks.
* `PATCH /tasks/{id}`: Toggle completion status.