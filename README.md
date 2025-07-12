# CivicFund – Participatory Budget Allocation Platform 💸🏙️

Welcome to **CivicFund**, a Ruby on Rails application that enables residents to actively participate in local government by allocating a personal voting budget to community projects. This participatory budgeting tool helps empower communities by involving them directly in how public funds are spent.

---

## 🚀 Features

### ✅ Resident Voting Experience
- Secure **Devise-based authentication** for users.
- Residents receive a **$1,000 voting budget** to distribute among available projects.
- Live updating form with **real-time budget tracking** using StimulusJS.
- Prevents over-allocation with **form-level and backend validations**.
- Post-submission **confirmation summary** of all allocations made.

### 🔐 Admin Panel
- Admin-only dashboard for managing:
  - Predefined **community projects** with name and cost.
  - **Aggregate reports**: total allocations per project across all users.
- Clean UI using **Tailwind CSS**, styled with charts (Recharts planned) and summary tables.

### 🧠 Core Logic & Models

| Model     | Attributes                                  | Relations                             |
|-----------|---------------------------------------------|----------------------------------------|
| `User`    | Devise-authenticated, `admin: boolean`       | `has_many :allocations`               |
| `Project` | `name:string`, `cost:integer`                | `has_many :allocations`               |
| `Allocation` | `amount:integer`, `user_id`, `project_id` | `belongs_to :user` & `project`        |

**Business Rules:**
- Users can split their budget across multiple projects.
- Allocation total must not exceed $1,000 per user.
- Allocation form uses StimulusJS for **instant feedback** on budget usage.

---

## 📷 Screenshots

> (Consider uploading screenshots of Resident allocation UI, Admin dashboard, and confirmation screen)

---

## 🛠️ Tech Stack

- **Ruby on Rails** 8.0.2
- **Ruby** 3.4.1
- **Tailwind CSS** for clean styling
- **StimulusJS** for interactivity
- **Devise** for authentication
- **PostgreSQL** as the database

---

## 🧪 Manual Testing

> Although formal tests aren't included in this challenge assignment, the app is **manually tested** for:

- User registration, login, and logout
- Real-time remaining budget calculation
- Validation errors for over-allocation
- Admin access control and reporting accuracy

---

## 🧭 Getting Started

```bash
# Clone the repo
git clone https://github.com/Athikajishida/civicfund-budget-allocation.git
cd civicfund-budget-allocation
```

# Install dependencies
```bash 
bundle install
```

# Setup the database
```bash
rails db:setup
```

# Start the dev server
```bash
./bin/dev
```
