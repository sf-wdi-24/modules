# <img src="https://cloud.githubusercontent.com/assets/7833470/10423298/ea833a68-7079-11e5-84f8-0a925ab96893.png" width="60">  Elasicsearch Setup and Configuration

<img src="https://cloud.githubusercontent.com/assets/1329385/12210263/7e707438-b60d-11e5-86a4-da08c62efd29.gif">

## What is Elasticsearch (ES)?

> Elasticsearch is a search server based on Lucene. It provides a distributed, multitenant-capable full-text search engine with an HTTP web interface and schema-free JSON documents. Elasticsearch is developed in Java and is released as open source under the terms of the Apache License. Elasticsearch is the second most popular enterprise search engine after Apache Solr, also based on Lucene <a href="https://en.wikipedia.org/wiki/Elasticsearch" target="_blank">Wiki</a>

We'll go over this description in class and focus on terms which may not be clear.

<details>
  <summary>Question to ask yourself, what is the difference between Elasticsearch and other database systems we've learned?</summary>

  <a href="https://www.quora.com/What-are-the-main-differences-between-ElasticSearch-and-NoSQL-DBs-like-MongoDB" target="_blank">What are the main differences between ElasticSearch and NoSQL DBs like MongoDB?</a>
</details>

## Installing

In order to use ES locally we're going to install it and check it's working via the following tutorial:

<a href="http://red-badger.com/blog/2013/11/08/getting-started-with-elasticsearch/" target="_blank">ES Setup Tutorial</a>

## Connecting with Rails

We could make requests directly to ES via its REST API but instead we'll use a gem named <a href="https://github.com/elastic/elasticsearch-rails/tree/master/elasticsearch-rails" target="_blank">Elasticsearch::Rails</a> to run searches.

Let's use <a href="https://github.com/elastic/elasticsearch-rails/tree/master/elasticsearch-rails#rails-application-templates" target="_blank">the Rails Application Templates</a> example to quickly generate a working app.

## What do we do when we deploy?

Once you deploy, you'll need an environment variable which points at your ES server. To simplify deployment we will use <a href="https://devcenter.heroku.com/articles/bonsai" target="_blank">Bonsai</a> as our ES server.
