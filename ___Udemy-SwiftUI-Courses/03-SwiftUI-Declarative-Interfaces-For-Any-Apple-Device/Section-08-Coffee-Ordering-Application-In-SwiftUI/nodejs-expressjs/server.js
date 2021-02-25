
// init project
const express = require('express');
const app = express();
const Order = require('./order')
const Session = require('./session')
const cors = require('cors')

app.use(cors())
app.use(express.json())

let orders = [] 

app.get('/clear',(req,res) => {
  orders = [] 
  res.json(orders)
})

app.get('/top-news',(req,res) => {
  
   let articles = [
     
     {
       title: "The Bull Market is Charging into 2020",
       publication: "The Wallstreet Journal", 
       imageURL: "https://thumbor.forbes.com/thumbor/fit-in/1200x0/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F5f2c667737950e6bf2338de1%2F0x0.jpg"
       
     }, 
     {
       title: "Cyber News Rundown: Twitter Hack Arrests",
      publication: "CNN",
      imageURL: "https://blog-en.webroot.com/wp-content/uploads/2020/08/06154526/CNR-800x400_Twitter-hack.jpg",
     }
     
   ]
   
   res.json(articles)
  
})

app.get('/stocks',(req,res) => {
  let stocks = [
    {
      symbol: "GOOG", 
      description: "Google Innovation Media", 
      price: 1000, 
      change: "-0.24"
    }, 
    {
      symbol: "MSFT", 
      description: "Microsoft Cooporation", 
      price: 200, 
      change: "+3.24"
    }
  ]
  
  res.json(stocks)
})

app.post('/orders',(req,res) => {
     
  let name = req.body.name 
  let coffeeName = req.body.coffeeName 
  let total = parseFloat(req.body.total ) 
  let size = req.body.size
  
  if(name && coffeeName && total && size) {
    
    let order = new Order(name, coffeeName, total, size) 
    orders.push(order)
  
  res.status(200).json({success: true})
  } else {
    res.json({success: false, message: 'Missing fields'})
  }
  
  
  
})

app.get('/orders',(req,res) => {
  res.json(orders)
})

app.get('/clear-orders', (req,res) => {
  orders = [] 
  res.json({message: 'Orders have been cleared!'})
})


let sessions = [
  {title: 'REAL-LIFE COMBINE', speaker: 'Shai Mishali'}, 
  {title: 'IMPLEMENTING A COMPONENT LIBRARY', speaker: 'Roy Marmelstein'}, 
  {title: 'IOS APPLICATION SECURITY', speaker: 'Julia Vashchenko'}, 
  {title: 'A MICRO-SERVICES PERSPECTIVE ON IOS ARCHITECTURE', speaker: 'Mugunth Kumar'}
] 

app.get('/sessions',(req,res) => {
  res.json(sessions)
})


// listen for requests :)
const listener = app.listen(process.env.PORT, function() {
  console.log('Your app is listening on port ' + listener.address().port);
});
