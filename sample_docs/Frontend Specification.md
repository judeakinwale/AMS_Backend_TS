# Frontend Specification: Media-Rich Task Management
**Focus:** High-performance media rendering and intuitive UI.

### 1. Core Stack
* **Language:** TypeScript 5.x
* **Framework:** React 19 (using Server Components where applicable)
* **State Management:** Zustand (for UI state) & TanStack Query (for server state)
* **Styling:** Tailwind CSS + Framer Motion (for smooth task transitions)
* **Audio Visualization:** `wavesurfer.js` or `react-audio-visualize`

### 2. Architecture Logic
The frontend treats every task as a "Media Node."
* **Polymorphic Components:** A `TaskItem` component that dynamically switches views based on a `type` property (`text`, `image`, or `audio`).
* **Optimistic UI:** When a user adds an image/audio task, the UI displays a "pending" state using a local `Blob` URL immediately, then swaps it for the S3 URL once the backend confirms the upload.

### 3. Key Components
* **MediaUploadZone:** A drag-and-drop area that handles MIME-type validation (limiting audio to MP3/WAV and images to JPG/PNG).
* **AudioPlayerTask:** A custom mini-player that shows the waveform and allows playback without opening a separate modal.
* **SubtaskTree:** A recursive component that allows users to nest images under audio tasks or vice-versa.

### 4. API Integration
```typescript
interface Task {
  id: string;
  type: 'text' | 'image' | 'audio';
  contentUrl?: string; // S3 link
  textContent?: string;
  parentId: string | null;
  completed: boolean;
}