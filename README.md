## Docker

### Docker image
Opiera się o: [openresty/openresty](https://hub.docker.com/r/openresty/openresty).   
Zawiera:

- Lua 5.4 with Lapis and Moonscript
- PostgreSQL

Wybrałem Moonscript, bo ustawienie środowiska wydawało się łatwiejsze do zrealizowania.   
(Co pewnie było błędem)

build:
`docker build -t <nazwa> .`

### Start kontenera

`docker run -dti -v "$(pwd)/source-code:/var/source-code" -p 8080:8080 <nazwa>`

## Funkcjonalność

### Pobranie informacji o tablicy categories (GET)

`curl -s -X GET -H "Content-Type: application/json" http://localhost:8080/categories`   

Utworzenie mechanizmu do rutowania {categories}/prodct się niepowiodło.  
Zostanie to naprawione w następnych commitach, jednak już po czasie oddawania projektów.   
Generalnie trzeba przypomnieć sobie informacje o kompozycjach baz danych i zrozumieć dokładniej mechanizmy moonscript.    

### Pobranie informacji z tablic (products,unsellables)

products

`curl -s -X GET -H "Content-Type: application/json" http://localhost:8080/products`

unsellables

`curl -s -X GET -H "Content-Type: application/json" http://localhost:8080/unsellables`

### Informacje o jednym produkcie (product/id)

`curl -s -X GET -H "Content-Type: application/json" http://localhost:8080/products/3`

Dla Unsellables path = /unsellables/:id

### Dodanie produktu

`curl -s -X POST -H "Content-Type: application/json" -d '{"name":"Podkoszulek","price":45}' http://localhost:8080/products`

Dla Unsellables path = /unsellables/:id

### Update

`curl -s -X PUT -H "Content-Type: application/json" -d '{"price":25}' http://localhost:8080/products/2`

Dla Unsellables path = /unsellables/:id

### Delete

`curl -s -X DELETE -H "Content-Type: application/json" http://localhost:8080/products/2`

Dla Unsellables, path = /unsellables/:id
