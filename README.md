# Rubytube

Um clone do Youtube escrito em Ruby on Rails usando uma base de dados PostgreSQL e MetroUICSS.
Essa apl A Youtube clone made in Ruby on Rails using a PostgreSQL database and MetroUI CSS framework.

Veja a demonstração em https://wp-rubytube.herokuapp.com/

## Ruby version
2.5.3

## Rails version
5.2.3

## Database Server
PostgreSQL >= 9.6

## Configuração
Clone ou realize o download do codigo.
Dentro da pasta do projeto, execute:
```console
$ bundle install
```
## Inicialização do banco de dados
Para conexão local de desenvolvimento, altere as constantes encontradas no arquivo .ENV na pasta raiz do projeto
```console
$ rake db:setup
```
## Executar os testes
```console
$ rspec
```
