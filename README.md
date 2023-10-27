The official GitHub Repo of team diffərənt. This repository contains the official onepager and prototypes (Framer, Principle etc.).

💻 You can find the website on → [https://michelvanheest.github.io/different-designers/](https://michelvanheest.github.io/different-designers/) _~[http://differentdesigners.nl](http://www.differentdesigners.nl/)~_

💻  Our masterprototype → [https://michelvanheest.github.io/different-designers/prototypes/masterprototype.framer/](https://michelvanheest.github.io/different-designers/prototypes/masterprototype.framer/) _~[http://differentdesigners.nl/prototypes/masterprototype.framer](http://www.differentdesigners.nl/prototypes/masterprototype.framer)~_

---

# How to locally run our Framer proto’s without using Framer
To be able to run our prototypes on your local machine (to make changes or whatever reason you have to not use our hosted version(s)) you need to have a Node server installed. 

### Install Node HTTP-server
- Install NodeJS → [https://nodejs.org/en/download/](https://nodejs.org/en/download/)
- Open your terminal, type the following command to install the _HTTP-server_


```
npm install http-server -g
```

- When you don’t have the right permissions:


```
sudo npm install http-server -g
```

### Run a prototype using the HTTP-server
- Open terminal
- Type (note the space at the end!!):


```
cd 
```

- Drag the folder with the Framer prototype into your terminal and press “enter”. You'll get something like:

```
Michels-MBP:~ michelvanheest$ cd /Users/michelvanheest/Dropbox\ \(Personal\)/School/CMD\ Jaar\ 4/Minor\ IUXD/Designing\ Digital\ Experiences/different-designers/prototypes/masterprototype.framer 
```

- After you pressed enter, your server _with_ the Framer prototype is now running
- Open `localhost:8080` in your (Chrome) browser et voila ✌️

### Edit the Framer prototypes
- Drag the folder with the Framer prototype to your VSCode or editor of choice
- Edit `app.coffee` and save your changes
- Use CMD+Shift+R to reload the prototype in your browser after you changed something in the code.

