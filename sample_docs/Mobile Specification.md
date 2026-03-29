# Mobile Specification: Local-First Media Tasks
**Focus:** Rapid capture and offline reliability.

### 1. Core Stack
* **Framework:** React Native (Expo)
* **Navigation:** React Navigation (Native Stack)
* **Storage:** WatermelonDB (for high-performance offline persistence)
* **Media APIs:** `expo-av` (Audio), `expo-image-picker`, `expo-file-system`

### 2. Mobile-Specific Challenges
* **Offline Sync:** Since media files are large, the app saves metadata to the local DB immediately and queues the file upload for when the user has Wi-Fi (using `expo-task-manager`).
* **Haptics:** Using `expo-haptics` to provide physical feedback when completing tasks or starting an audio recording.

### 3. Feature Set
* **Quick Capture:** A "Hold to Record" button on the home screen that creates an audio task instantly.
* **Camera Integration:** A "Scan Task" feature using the camera to turn a photo into a task item.
* **Thumbnail Caching:** Aggressively caching image thumbnails locally to reduce data usage and improve scrolling performance.

### 4. Security
* Secure storage for Auth tokens using `expo-secure-store`.