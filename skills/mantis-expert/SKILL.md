# Mantis Integration Skill

## Overview

This skill integrates with a MantisBT issue tracking system.

It provides secure issue operations with automatic session management.
Login is handled internally — the agent does NOT manage cookies.

## Tools

### mantis_action

Performs an action against the Mantis server.

Supported actions:

- login
- fetch_issue
- close_issue

The backend automatically manages session cookies.
If the session is expired, the skill will re-authenticate automatically.

## Security Model

- Session cookies are stored server-side only.
- Cookies are never returned to the agent.
- Credentials should be stored securely (env vars or keychain).
- All actions require authentication.

## Example Usage

Fetch issue:

{
  "action": "fetch_issue",
  "issue_id": "1234"
}

Close issue:

{
  "action": "close_issue",
  "issue_id": "1234"
}
