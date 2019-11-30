# README

## What is this?

This is a dummy project for me to try it out Rspec with small test.

I created this project with MiniTest disabled.


## Gem requirements

1. [twbs/bootstrap-rubygem](https://github.com/twbs/bootstrap-rubygem) (4.3.1)
2. [faker-ruby/faker](https://github.com/faker-ruby/faker) (2.7)
3. [rspec/rspec-rails](https://github.com/rspec/rspec-rails) (4.0.0.beta3)


# Specification

1. Ruby 2.6.3
2. Rails 6.0.1


## Run Rspec test

For run the Rspec test, please using command below.

```
$ bundle exec rspec
```

## What are the components in the test?

1. Model
    ```
    Article
    Validation Presence Tests
        Ensures title presence
        Ensures post presence
        Ensures author id presence
        Should save successfully
    Validation Length Tests
        Ensures title character  length, not less than 5
        Ensures title character length, not more than 30
        Ensures post character length, not less than 5
    Data Type Tests
        Ensures Author ID is numericality

    Author
    Validation Presence Tests
        Ensures full name presence
        Ensures email presence
        Ensures password presence
        Should save successfully
    Validation Length Tests
        Ensures full name character length, more than 5
        Ensures full name character length, less than 30
        Ensures email character length, less than 50
        Ensures password character length, same or more than 8
    Email Format Tests
        Ensures email format not valid
        Ensures email format valid
    Email Uniqueness Tests
        Ensures email has uniqueness
    ```

2. Controller
    ```
    ArticlesController
    Get #index
        Returns a success response
    Get #show
        Returns a success response

    AuthorsController
    Get #index
        Returns a success response
    Get #show
        Returns a success response
    ```

