# Articles Management System

## Features

### User Authentication
- User registration and login (powered by Devise)
- User session management

### Article Management
- Create, read, update, and delete articles
- Article status management (draft, published, archived, deleted)
- Image attachments for articles
- User-specific article listings

### Reporting System
- Users can report inappropriate articles
- Automatic archiving of articles with 3+ reports
- Admin task to remove articles with 6+ reports
- Reports counter tracking

### Automated Moderation
- Articles with 3+ reports are automatically archived
- Scheduled task runs every 5 minutes to remove articles with 6+ reports
- Background job processing for content moderation

## Pages and Routes

### Public Pages
- **Home Page** (`/`) - Landing page and article listings
- **User Authentication**
  - Sign up (`/users/sign_up`)
  - Sign in (`/users/sign_in`)
  - Password reset (`/users/password/new`)

### Article Pages
- **Articles Index** (`/articles`) - List all articles
- **Article Show** (`/articles/:id`) - View individual article
- **New Article** (`/articles/new`) - Create new article
- **Edit Article** (`/articles/:id/edit`) - Edit existing article

### Reporting
- **Report Article** (`/articles/:id/reports`) - Submit reports (POST only)

### Key Dependencies
- **Authentication**: Devise
- **Authorization**: CanCanCan
- **Styling**: TailwindCSS
- **Job Scheduling**: Whenever (cron jobs)
- **File Uploads**: Active Storage
- **Image Processing**: Active Storage variants

### Development Tools
- **Security**: Brakeman scanner
- **Code Style**: RuboCop Rails Omakase
- **Testing**: Capybara, Selenium WebDriver
- **Model Annotations**: Annotate gem

### Background Jobs
```bash
rails jobs:work
```

### Scheduled Tasks
The application uses `whenever` gem to schedule:
- Article cleanup task (every 5 minutes)

## Content Moderation

### Automatic Moderation
- Articles with 3+ reports → Automatically archived
- Articles with 6+ reports → Removed by scheduled task



### Manual Tasks
```bash
# Remove heavily reported articles manually
rails articles:remove_heavily_reported
```


## Screenshots
![image](https://github.com/user-attachments/assets/ea53f193-ac44-45ca-b87e-d444a28fabb1)
![image](https://github.com/user-attachments/assets/f6092fb3-db95-4db0-a070-ea6228f94d7e)
![image](https://github.com/user-attachments/assets/9d80da06-cedc-4b61-a4b3-7d3d04fbb082)
![image](https://github.com/user-attachments/assets/3d94621c-bd06-45c0-945c-2c2126ec1921)
![image](https://github.com/user-attachments/assets/732c9994-387c-4a48-934e-0eb6e9733313)
![image](https://github.com/user-attachments/assets/654a91be-a84c-4fab-8493-4775cd9d1fba)


