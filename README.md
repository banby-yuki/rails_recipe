# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
------------------------------------------------------------------

Prefix        Verb    URL Pattern       Controller#Action

recipes       GET     /recipes          recipes#index   #レシピ一覧
new_recipe    GET     /recipes/new      recipes#new     #レシピ作成
              POST    /recipes          recipes#create  #作成したレシピを送信
edit_recipe   GET     /recipes/:id/edit recipes#edit    #レシピを編集
              PATCH   /recipes/:id      recipes#update  #編集したレシピを送信
recipe        GET     /recipes/:id/show recipes#show    #レシピ一個を表示
              DELETE  /recipes/:id      recipes#destroy #レシピを削除
