# Documentation

## Requirements
- Ruby: version 2.6.4
- Rails: version 6.0.0
- Database: Mysql
- Other: nodejs, yarn (require of Rails 6 that using `webpacker`)
```
brew install node
brew install yarn
```

## Configuration and Setup
### Config connect to database
- In file `.env`, change information to connect to your Mysql

```
DATABASE_HOSTNAME=localhost
DATABASE_USERNAME=root
DATABASE_PASSWORD=
```

### Setup
```bash
# Install yarn
yarn install

# Install gem
bundle install

# Init database
rails db:create
rails db:migrate
rails db:seed

# Start rails
rails s
```

## Structure of database

![Database structure](https://user-images.githubusercontent.com/12421656/65848126-d6bb0800-e36e-11e9-9483-69d1bca13e3d.png)

## Access to swagger UI for APIs document
- Url: http://localhost:3000/api_docs
- Basic authentication: `admin/admin`

## Demo
### Web admin
- Url: https://evening-plateau-47262.herokuapp.com/
- Login with sample user: `teacher@example.com/12345678`

### Document for APIs
- Url: https://evening-plateau-47262.herokuapp.com/api_docs
- Basic authentication: `admin/admin`

## Problems

### Technical Problems

#### Problem 1
- Description:
  - Gem `swagger_ui_engine` is not support for Rails 6

- Solution:
  - I found that branch `1.1.4-version` has supported Rails 6, so I use that branch.

### Logic Problems

#### Problem 1
- Description:
  - If you loginned with email `teacher@example.com` and delete yourself. The application will be not loginned later.

- Solution:
  - Exclude yourself on user list. 
  - It should have a profile page for edit profile

#### Problem 2
- Description:
  - When using `:validatable` of `devise` to validate data for create and update user, the password must be required. In case you want to update name, email or role of an user, it hard to know current password of the user and you can not update a new password for user. Because if you update a new password for users, they can not login anymore.

- Solution:
  - I have customized the validation of user instead of using `:validatable`
