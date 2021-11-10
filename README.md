# Survey System Backend

This project is a sample API backend for a Survey feedback collection system. Developed with `ruby 3.0.2` and `rails 6.4.1.4`.

### Installation
Clone the repository to your system. Then `cd` into the project directory.
Make sure you are using the right version of ruby (3.0.2) and then run

```bundle install```

to install necessary ruby gems.

### Start Server
This is a dockerized ([Dockerfile](Dockerfile)) project. Simply run

```docker-compose up```

inside the project directory to start the services. 
This project requires `postgres14-alpine` container to run the database and creates it's own container from `ruby-3.0.2`.

- The project container will run a Puma based Ruby on Rails server on `port 3000` and expose the 3000 port to host. Make sure nothing else runs on the same port on host.
- Similarly, port 5432 on host machine will also be mapped to postgresql container of the project.
- The data directory of PostgreSQL database container will be mapped as a volume to `~/Data/survey-backend/postgres` on host machine. You can change it in [docker-compose.yml](docker-compose.yml)file.

### Seeding
The seeds.rb file contains dummy data that can be used for testing. Run the command

```rails db:seed```

to fill the database. You can specify the database using `RAILS_ENV` parameter.

### Testing

This project uses Rspec library for testing. 
**The tests can be runned outside the Docker container of the project.** Make sure the database container is running and is accessible on port 5432 on the host machine. Then run the command:

```rspec```

inside the project directory on host machine.

- The test database will be truncated and re-seeded each time you run tests.

#### Postman
You can find a postman collection file in the project directory, [SurveyBackend.postman_collection.json](SurveyBackend.postman_collection.json), that can be used to test API endpoints of the project manually.

