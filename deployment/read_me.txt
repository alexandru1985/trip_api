##### Tehnologii #####

Am folosit Laravel7.3, XAMPP server, MySQL, Postman.

##### Descriere #####

Am realizat module CRUD pentru Users, Trips. Am realizat validari pentru operatiile CRUD. 
In plus, am realizat toate functionalitatile cerute in test, inclusiv
limitarea incercarilor de logare la maxim 5 pe minut.
Am incercat sa respect best practices atunci cand am definit rutele pentru api.

Caile pentru fisiere sunt

trip_api/app/Http/Controllers/API
trip_api/Models/API
trip_api/Classes
trip_api/routes

##### Instalare #####

Se copiaza folder-ul trip_api in folder-ul root al server-ului web,
cum ar fi htdocs sau www.
Se importa baza de date trip_api.sql, care se gaseste in trip_api/deployment.

#### Modul Auth #####

Se executa in terminal comanda

php artisan passport:client --personal

Se porneste MySQL.
Se executa in terminal comanda

php artisan serve

Se adauga in Postman, la Headers, Content-Type application/json.
Se bifeaza in Postman, la Body, optiunea raw.
Se adauga mai jos datele pentru conectare la api, in format JSON 

POST http://127.0.0.1:8000/api/login 

{
    "email" : "john.doe@mail.com",
    "password": "john.doe@mail.com"
}

Pentru a se realiza conectarea la api, din raspunsul primit 
se copiaza token-ul si se adauga la Headers, Authorization, Bearer plus token.
Dupa aceea, ar trebui sa user-ul sa fie conectat si sa se poata executa orice cerere
definita in api.

POST http://127.0.0.1:8000/api/logout

Va deloga user-ul. 

##### Modul Users #####

GET http://127.0.0.1:8000/api/users

Va afisa toti userii.

GET http://127.0.0.1:8000/api/users/1

Va afisa user-ul cu id=1.

POST http://127.0.0.1:8000/api/users

Exemplu de payload 

{
    "first_name" : "John1",
    "last_name" : "Doe1",
    "email" : "john.doe1@mail.com",
    "password": "john.doe1@mail.com"
}

Va adauga user-ul de mai sus.

PUT http://127.0.0.1:8000/api/users/1

Va face update pentru user-ul cu id=1.

DELETE http://127.0.0.1:8000/api/users/1

Va sterge user-ul cu id=1.

##### Modul Trips #####

GET http://127.0.0.1:8000/api/trips

Va afisa toate trips.

GET http://127.0.0.1:8000/api/trips/1

Va afisa trip cu id=1.

POST http://127.0.0.1:8000/api/trips

Exemplu de payload

{
    "title" : "Last minute trip to Rome for this year",
    "description" : "You can visit many places.",
    "location": "Rome",
    "price": 350,
    "start_date": "25-04-2022",
    "end_date": "30-04-2022"
}

Va adauga un trip-ul de mai sus.

PUT http://127.0.0.1:8000/api/trips/1

Va face update pentru trip cu id=1.

DELETE http://127.0.0.1:8000/api/trips/1

Va face delete pentru trip cu id=1.

GET http://127.0.0.1:8000/api/trips/slug/last-minute-trip-to-rome

Va afisa trip pentru slug-ul de mai sus.

GET http://127.0.0.1:8000/api/trips/order/price/desc

Va afisa toate trips orderBy price desc.

GET http://127.0.0.1:8000/api/trips/location/rome/price/min/100/max/400/order/price/desc

Va afisa toate trips in fuctie de locatie, pretul minim si pretul maxim.

##### Modul Bookings #####

POST http://127.0.0.1:8000/api/bookings

Exemplu de payload

{
    "user_id" : 1,
    "trip_id" :1
}

Va adauga in tabela user_bookings o rezervare pentru user_id=1 si trip_id=1.

GET http://127.0.0.1:8000/api/user/bookings

Va afisa toate trips pentru fiecare user, care se gasesc in relatia booking_trips.
