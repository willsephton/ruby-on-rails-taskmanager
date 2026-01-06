# Taskmanager

This is a small Rails application (a task manager) used to learn Ruby on Rails and PostgreSQL. The project uses Rails 8, Propshaft, Tailwind (via `tailwindcss-rails`), and `image_processing` for image variants.

This README explains how to get the app running locally after cloning (Windows PowerShell oriented). If you use macOS/Linux, the commands are similar but use your preferred shell.

## Prerequisites

- Ruby (this project was developed with Ruby 4.x and Rails 8.x). Use a Ruby version manager or your system Ruby.
- PostgreSQL (server running locally or accessible from your machine).
- Bundler (installed with RubyGems): `gem install bundler`.

## Quick start (Windows PowerShell)

1. Clone the repo and change into the project directory:

```powershell
git clone <repository-url>
cd taskmanager
```

2. Create a `.env` file for local credentials (we use `dotenv-rails` for local ENV loading).

Create a file named `.env` in the project root and add at least these values (example):

```text
POSTGRES_USER=postgres
POSTGRES_PASSWORD=password
POSTGRES_HOST=127.0.0.1
POSTGRES_PORT=5432
DATABASE_URL=postgres://postgres:password@127.0.0.1:5432/taskmanager_development
```

3. Install Ruby gems:

```powershell
bundle install
```

4. Create and migrate the database (development + test as needed):

```powershell
bundle exec rails db:create db:migrate
RAILS_ENV=test bundle exec rails db:create db:migrate
```

5. Build Tailwind CSS for development (or use the watch task while editing):

```powershell
bin/rails tailwindcss:build
```

6. Start the Rails server:

```powershell
bundle exec rails s -e development -p 3000
```

Open `http://127.0.0.1:3000/tasks` in your browser.

## Running tests

```powershell
# prepare test DB (if not already done)
RAILS_ENV=test bundle exec rails db:create db:migrate
# run tests (Minitest / Rails default)
bundle exec rails test
```

## Project layout (important files)

| File / Folder                         | What it does                              |
| ------------------------------------- | ----------------------------------------- |
| `app/models/task.rb`                  | Database model (Task)                     |
| `db/migrate/*`                        | Database migrations                        |
| `app/controllers/tasks_controller.rb` | Controller for tasks                      |
| `app/views/tasks/*`                   | Views for tasks (index/new/edit/show/_form)|
| `config/routes.rb`                    | Routes                                    |

