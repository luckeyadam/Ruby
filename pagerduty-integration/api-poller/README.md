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

<!-- https://jsonplaceholder.typicode.com/posts/1 -->

rails g resource IntegrationAlert identifier:string title:string description:string status:string integration:references

rails db:migrate