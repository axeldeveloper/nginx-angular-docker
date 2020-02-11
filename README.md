# Projeto de desmostração 
App node angular com docker 


# NgNodeAngular
This project was generated with [Angular CLI](https://github.com/angular/angular-cli) version 8.3.19.


## Create app 
Run `ng new app`


## Development server

Run `ng serve` for a dev server. Navigate to `http://localhost:4200/`. The app will automatically reload if you change any of the source files.

## Code scaffolding

Run `ng generate component component-name` to generate a new component. You can also use `ng generate directive|pipe|service|class|guard|interface|enum|module`.

## Build

Run `ng build` to build the project. The build artifacts will be stored in the `dist/` directory. Use the `--prod` flag for a production build.

## Running unit tests

Run `ng test` to execute the unit tests via [Karma](https://karma-runner.github.io).

## Running end-to-end tests

Run `ng e2e` to execute the end-to-end tests via [Protractor](http://www.protractortest.org/).

# Docker
# Building your image
> docker build -t  axedeveloper/nginx-angular-docker:dev .

> docker run --rm -d -p 4200:4200/tcp axedeveloper/nnginx-angular-docker:dev

> docker run -d --name app-producao -p 8484:80 axedeveloper/nginx-angular-docker:dev  

# Subindo o container
> docker run -d --name app-producao -p 8484:8484 axedeveloper/nginx-angular-docker:dev                                    

# Building com proxy
> docker build . -t axedeveloper/nginx-angular-docker:dev --build-arg http_proxy=http://funcionario@empresa:AXXXPTO@proxy.sgr.mr.net.br:8081 --build-arg https_proxy=funcionario@empresa:AXXXPTO@proxy.sgr.mr.net.br:8081



# Subindo o container com volue
> docker run -v ${PWD}:/app -v /app/node_modules -p 4201:4200 --rm axedeveloper/nginx-angular-docker:dev


# GIT HUB

# Defina um novo remote
> git remote add origin https://github.com/axeldeveloper/nginx-angular-docker.git

> git pull origin master
 
> touch test

> git add test

> git commit -m "Iniciando o push"

> git remote -v



# Verifique  o novo remote
> origin  https://github.com/user/repo.git (fetch)
> 
> origin  https://github.com/user/repo.git (push)