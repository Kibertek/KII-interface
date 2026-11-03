# KII Interface: UX baseline

## Visual identity

- Graphite / near-black background.
- White primary text.
- Orange accent.
- Minimal geometric Presence core with restrained orbital elements.
- No human avatar and no unnecessary decorative panels.

## Presence states

The same identity should communicate:
- idle;
- listening;
- processing;
- speaking;
- executing an action;
- connection degraded;
- offline;
- error;
- synchronizing.

Animation should reflect real application events and status. It must not present fabricated internal reasoning.

## Presence notifications

When a notification is delivered, KII Presence may appear in a compact overlay, show the message and read it aloud when permitted.

If the operating system is in a quiet / Do Not Disturb mode, use text-only presentation and do not speak. Respect notification permissions and platform policy.

Notifications should be concise, grouped when repetitive, and support configurable priority and duration. Critical visual alerts must not silently bypass system quiet settings.

## Connection alerts

Notify the user about:
- loss of the active server route;
- start of reconnection attempts;
- route switch between WAN and LAN;
- successful reconnection;
- prolonged server unavailability.

Avoid a notification for every retry. Show retry progress in the connection panel and notify on meaningful state changes.

## Responsive behavior

The same design language adapts to desktop and mobile layouts. Floating Presence is a separate compact presentation, not a second application identity.
