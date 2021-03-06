## Portfolio

<a href="http://agile-shelf-6960.herokuapp.com/" target="#">Live Portfolio on Heroku</a>

By Ian MacDonald (<a href="https://github.com/matchbookmac" target="#">GitHub</a>)

@ Epicodus Programming School, Portland, OR

GNU General Public License, version 3 (see below). Copyright (c) 2015 Ian C. MacDonald.

### Description

**Portfolio**

A web app for displaying a personal portfolio. It is also setup so that multiple users can be added if a group portfolio is needed with individual user accounts

### Author(s)

Ian MacDonald

### Setup

This app was written in `Rails '4.2.3'`.

Clone this repo with
```console
> git clone https://github.com/matchbookmac/portfolio.git
```

Install gems:

```console
> cd portfolio
> bundle install
```

Create database
```console
> rake db:create
> rake db:migrate
> rake db:seed
```

Run tests
```console
> rspec
```

Start App:
```console
> rails s
```

#### List of relations
        Name        | Type  
--------------------|-------
categories          | table
categories_profiles | table
categories_projects | table
profiles            | table
profiles_projects   | table
projects            | table

#### Categories
id  | language | description | created_at | updated_at
----|----------|-------------|------------|------------
int | string   | string      | datetime   | datetime

####  Profiles

id  | first_name | last_name |  bio | created_at  |   updated_at
----|------------|-----------|------|-------------|--------------
int | string     | string    | text |   datetime  | datetime

####  Projects

id  | name   | description | repo_URL | URL    | created_at | updated_at
----|--------|-------------|----------|--------|------------|-----------
int | string | string      | string   | string |  datetime  | datetime

#### Categories Projects

id  | category_id | project_id
----|-------------|------------
int | varchar     | varchar

#### Categories Profiles

id  | profile_id | category_id
----|------------|-------------
int | varchar    | varchar

#### Profiles Projects

id  | profile_id | project_id
----|------------|------------
int | varchar    | varchar

### License ###
Copyright  (C)  2015  Ian C. MacDonald

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
