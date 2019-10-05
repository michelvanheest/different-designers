# different-designers
The official GitHub Repo of team diffərənt, probably with the final website, online reports, prototypes and stuff 🤷‍♂️.

You can find the website on → [http://differentdesigners.nl](http://www.differentdesigners.nl/)

---

> 🔴
>  
> SOME BASIC GIT GUIDELINES TO MAKE OUR LIVES EASIER
> 
> - Always develop on a new branch, don't develop on Master. The content of the Master-branch will go live on `differentdesigners.nl` directly.
> - Always Pull Request (PR), never merge directly.
> - Never merge your own PR unless you're 100% sure of what you're doing and you verified the change with the team — unless it's your own branch/prototype of course. 
> - Dare to make mistakes on your branches, that's were Git is for: solving fuck-ups by doing a rollback — it's gonna be okay (I wrecked my whole Shortcuts codebase once by accidentally merging in Master at 1AM, _nothing on the hand_ because of Git)
> - Ask questions when you don't have any clue wtf you're doing; I still don't know what I'm doing either and we're all here to learn.
> - Don't push to Master on Friday. On Friday we smile, don't do (too much) drug and drink quality (!!) beer.
> 
> ~ Love you all — Michel
> 
> 🔴

---

# To do

- [x] Replace `https://michelvanheest.github.io/different-designers/` with `https://differentdesigners.nl`
- [x] Fix SSL/HTTP and redirecting to the right domain
- [ ] Write instructions in this README for running this project (NPM, Node server and other stuff like Jekyll?)
- [ ] Combine [Prototype repo](https://github.com/michelvanheest/iuxd-anwb) with this repo as a submodule or monorepo

---

# Installation guide (for Michel)

🔴 THIS IS PROBABLY OUTDATED, DON'T USE THIS WITHOUT VERIFICATION.

## Install Jekyll for Rapportage website

- Install [brew.sh](https://brew.sh)

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

- Install new [Ruby](https://www.ruby-lang.org) version for installing [Jekyll](https://jekyllrb.com/)

```
brew install ruby
```

- Update Ruby path to not interfere with already installed Ruby version

```
echo 'export PATH="/usr/local/opt/ruby/bin:$PATH"' >> ~/.bash_profile

source ~/.bash_profile
```

- Install Jekyll (this will take some time) (it's possible that you have to confirm at the end with `yN`)

```
gem install --user-install bundler jekyll
```

- Get your Ruby version

```
ruby -v
```

- Type following command, replacing `X.X` with the two first digits of your Ruby version

```
export PATH=$HOME/.gem/ruby/X.X.0/bin:$PATH
```

- Install latest Jekyll version

```
gem install jekyll bundler
```

- Install Jekyll to dir

```
gem install -n /usr/local/bin jekyll
```

## Install and run new Jekyll Rapportage website
- Go to root dir different-designers repo
- Install new Jekyll blog

```
jekyll new rapportage
```

- Run server Jekyll site for the first time

```
bundle exec jekyll serve
```
