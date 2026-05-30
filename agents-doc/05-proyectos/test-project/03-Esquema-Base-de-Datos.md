---
database: "PostgreSQL"
---

# Database Schema

### Users
- id: UUID (PK)
- email: string (unique)
- password: string
- role: enum(admin, user)
- created_at: timestamp

### Tasks
- id: UUID (PK)
- title: string
- description: text
- status: enum(pending, in_progress, completed)
- user_id: UUID (FK -> Users)
