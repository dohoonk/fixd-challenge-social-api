# README

* Ruby version
    2.7.2
* Rails version
    6.1.7
* Gems used
    faraday
    devise
    jbuilder
    rspec-rails
    factory_bot_rails
    faker

* How to run the test suite
    rspec
    - Test was designed without seed file and uses factory_bor_rails to create fixtures

* Deployment instructions
    bundle install
    rails db:create db:migrate

* API Endpoints
    - Resources Post
        - POST /api/v1/posts
            - Creates post objects
            - Params:
                - title:string required
                - body:text required
                - user_id:integer required
                - ex:
                - post '/api/v1/posts', params: { 
                    post: {
                            title: test_post.title,
                            body: test_post.body,
                            user_id: user.id
                          } 
                      }

        - GET /api/v1/posts:id
            - Responds with json object
            - Params:
                - user_id:integer required
                - ex:
                - get '/api/v1/posts:id', params: {
                    user_id:integer required 
                }


    - Resouces Comments
        - POST /api/v1/comments
            - Creates comments objects
            - Params:
                - user_id:integer required
                - post_id:integer required
                - message:string required
                - ex:
                    post '/api/v1/comments', params: { 
                    comment: {
                            user_id: comment.user.id,
                            post_id: comment.post.id,
                            message: comment.message
                          } 
                        }

        - DELETE /api/v1/comments:id
            - Destroys comments objects
            - Params:
                - comment_id:integer required
                - ex:
                    delete "/api/v1/comments/#{comment.id}"


    - Resources Ratings
        - POST /api/v1/ratings
            - Creates ratings objects
            - Params:
                - user_id:integer required
                - rater_id:integer required
                - rating:integer required
                - ex:
                - post '/api/v1/ratings', params: {
                    rating: {
                        user_id: rating.user.id,
                        rater_id: rating.rater.id,
                        rating: rating.rating
                    }
                }


     - Resources Feeds
        - GET /api/v1/feeds
            - Responds with json object
            - Params:
                - user_id:integer required
                - ex:
                - get '/api/v1/feeds?user_id=1', params: {
                    user_id:integer required 
                }

    

