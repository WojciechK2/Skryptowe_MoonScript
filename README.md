## Docker

### Docker image
Based on [openresty/openresty](https://hub.docker.com/r/openresty/openresty).
My image has:
* Lua 5.4 with Lapis and Moonscript
* PostgreSQL

Please build with following command:
`docker build -t my-lua .`

### Start docker container

Please run following command:
`docker run -dti -v "$(pwd)/source-code:/var/source-code" -p 8080:8080 my-lua`

The app will be avaiable on the 8080 port.

## Functionality

### Get all categories

`curl -s -X GET -H "Content-Type: application/json" http://localhost:8080/categories | jq`   

```
[
  [
    {
      "name":"products"
    }
    ,{
      "name":"unsellables"
     }
  ]
]

```

Manipulating the categories tables wasn't sucessful.
Got lost in the creation of new tables (to be fixed in further commits)

### Get all products

`curl -s -X GET -H "Content-Type: application/json" http://localhost:8080/products | jq`

```
[
  [
    {
      "id": 1,
      "name": "ksiazka historyczna",
      "price": 55
    },
    {
      "id": 2,
      "name": "playstation 4",
      "price": 2137
    },
    {
      "id": 3,
      "name": "karta graficzna",
      "price": 5555
    },
    {
      "id": 4,
      "name": "kubek",
      "price": 25
    }
  ]
]
```

### List items in each category

products

`curl -s -X GET -H "Content-Type: application/json" http://localhost:8080/products`

unsellables

`curl -s -X GET -H "Content-Type: application/json" http://localhost:8080/unsellables`

### Get specific product (by product id)

`curl -s -X GET -H "Content-Type: application/json" http://localhost:8080/products/3 | jq`

```
[
  {
    "name": "karta graficzna",
    "id": 3,
    "price": 5555
  }
]
```

Analogic for unsellables, only path is /unsellables/:id

### Add new product

`curl -s -X POST -H "Content-Type: application/json" -d '{"name":"Telewizor","price":4500}' http://localhost:8080/products | jq`

```
{
  "success": true
}
```

Analogic for unsellables, only path is /unsellables/:id

### Update a product

`curl -s -X PUT -H "Content-Type: application/json" -d '{"price":2500}' http://localhost:8080/products/2 | jq`

```
{
  "success": true
}
```

Analogic for unsellables, only path is /unsellables/:id

### Delete a product

`curl -s -X DELETE -H "Content-Type: application/json" http://localhost:8080/products/2 | jq`

```
{
  "success": true
}
```

Analogic for unsellables, only path is /unsellables/:id
