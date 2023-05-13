import requests
import json


class Accion:
  
  __price: str
  __name: str
  headers = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36",
        "Accept-Language": "en-US,en;q=0.5",
        "DNT": "1",
        "Connection": "keep-alive",
        "Upgrade-Insecure-Requests": "1"
    }
    

  def __init__(self) -> None:
      
      self.__name = "marco"
  
  @property #getter
  def price(self):
    return self.__price
  
  @price.setter
  def price(self,price):
      self.__price = price

  @property
  def name(self):
    return self.__name
  
  @name.setter
  def name(self,name):
    self.__name = name
  
  
  def PrecioAccion(self, name):
    
    self.__name = name
    url = f"https://query1.finance.yahoo.com/v8/finance/chart/{self.__name}"
    response = requests.get(url, headers=self.headers)
    print(response.status_code)
    if response.status_code == 200:
        data = response.json()
        prices = data["chart"]["result"][0]["meta"]["regularMarketPrice"]
        name = data["chart"]["result"][0]["meta"]["symbol"]
        print(prices)
        
        data = {
          "Nombre accion": name,
          "Precio del cierre": prices
        }
        return data
    else:
        return "La solicitud no se realizó correctamente."
    
    