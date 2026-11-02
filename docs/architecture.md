# KII Interface: architecture

## Scope

This repository owns client-side presentation and device integration only.

Out of scope:
- KII Core implementation.
- Server API implementation and database schema.
- Model training or inference infrastructure.
- Server deployment and operations.

The interface may define API contracts and connection requirements, but must not duplicate server business logic.

## Flutter application

A single Flutter application is the shared UI foundation for Windows and Android. Platform-specific features are isolated behind adapters.

Planned client modules:
- Presence: visual identity, animation states and compact/expanded presentation.
- Connection: LAN/WAN route selection, connection health and visible status.
- Notifications: notification presentation, speech policy and event history.
- Voice: playback interface and locally cached voice assets.
- Settings: user preferences and trusted-device presentation.
- Local data: cached settings, recent conversation presentation and sync queue status.

## Connection states

- online: connected through an internet route.
- local: connected directly through LAN.
- degraded: connection exists but is unstable or slow.
- offline: server is unreachable; only supported local client features remain available.

The UI must not assume that internet availability implies server availability.

## Resource ownership

KII Core/server is the source of truth for versioned voice and Presence resource packages. Clients cache compatible packages locally for fast startup and offline presentation. Package updates should be incremental where practical.

A client must never download large voice models on every launch. Resource version, compatibility and storage usage should be visible in diagnostics/settings.

## Background behavior

The main application window and background capabilities are separate concerns.

Windows and Android have different lifecycle and permission models. Notifications, overlays, wake-word listening and background execution must be implemented through platform-specific adapters where required. Respect system quiet modes and notification permissions.

## Performance principles

- Avoid continuous polling when push/event-driven updates are available.
- Pause or reduce Presence animation when it is not visible.
- Load voice assets only when needed.
- Keep the background process small and independent of the full UI.
- Cache only required resources and expose cache management.
- Prefer server-side computation; preserve explicitly supported offline client features.

## Security principles

- Use encrypted transport for LAN and WAN connections.
- Use the same account identity and authorization policy across routes.
- Never store account passwords in plaintext.
- Do not expose private notification content on a locked screen unless the user allows it.
