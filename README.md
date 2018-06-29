
## Steps to run it:

Remember to search for "TODO change" on the files to change example code.

### With Docker

Run:

    docker-compose up --build

After it starts, just on the first time, run on another terminal:

    docker exec target-marketing bash -c "composer start && yarn start"

The application will be available on http://localhost:8000 and the phpMyAdmin on http://localhost:8081

### Common way

Rename the .env.example file to .env, and fill it with your local info, then:

Install PHP and JavaScript dependencies:

    composer install
    yarn

Generate Laravel keys:

    php artisan key:generate

Generate JWT keys

    php artisan jwt:secret

Generate i18n string for Vue, based on Laravel i18n files:

    php artisan vue-i18n:generate

Migrate and seed the database:

    php artisan migrate --seed

Compile all the front-end stuff:

    yarn prod

Test:

    composer test
    yarn test
