import Model from require "lapis.db.model"
import respond_to from require "lapis.application"
import json_params from require "lapis.application"

lapis = require "lapis"
class Products extends Model
class Unsellables extends Model
class Categories extends Model

class extends lapis.Application
  [products: "/products"]: respond_to {

    GET: =>
      result = Products\select ""
      {
        json: {
          result
        }
      }

    POST: json_params =>
      product = Products\create {
        name: @params.name
        price: @params.price
      }
      {
        json: {
          success: true
        }
      }

  }
  
  [unsellables: "/unsellables"]: respond_to {

    GET: =>
      result = Unsellables\select ""
      {
        json: {
          result
        }
      }

    POST: json_params =>
      product = Unsellables\create {
        name: @params.name
        price: @params.price
      }
      {
        json: {
          success: true
        }
      }

  }
  
  [categories: "/categories"]: respond_to {

    GET: =>
      result = Categories\select ""
      {
        json: {
          result
        }
      }

    --POST: json_params =>
    --  product = Categories\create {
    --    name: @params.name
    --  }
    --  {
    --    json: {
    --      success: true
    --    }
    --  }

  }
  
  [products: "/products/:id"]: respond_to {    

    GET: =>
      result = Products\find @params.id
      {
          json: {
            result
          }
      }

    PUT: json_params =>
      product = Products\find @params.id
      ifSuccess = ""
      if product
        ifSuccess = true
      else
        ifSuccess = false
      product\update {
        name: @params.name
        price: @params.price
      }
      {
        json: {
          success: ifSuccess
        }
      }

    DELETE: =>
      -- Check if product exists
      product = Products\find @params.id
      ifSuccess = ""
      if product
        if product\delete!
          ifSuccess = true
      else
        ifSuccess = false
       
      -- Return proper JSON
      {
        json: {
          success: ifSuccess
        }
      }
    }
      
    [unsellables_item: "/unsellables/:id"]: respond_to {    

    GET: =>
      result = Unsellabless\find @params.id
      {
          json: {
            result
          }
      }

    PUT: json_params =>
      product = Unsellabless\find @params.id
      ifSuccess = ""
      if product
        ifSuccess = true
      else
        ifSuccess = false
      product\update {
        name: @params.name
        price: @params.price
      }
      {
        json: {
          success: ifSuccess
        }
      }

    DELETE: =>
      -- Check if product exists
      product = Unsellabless\find @params.id
      ifSuccess = ""
      if product
        if product\delete!
          ifSuccess = true
      else
        ifSuccess = false
       
      -- Return proper JSON
      {
        json: {
          success: ifSuccess
        }
      }

  }
  
  
