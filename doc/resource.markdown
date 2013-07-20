https://github.com/paulmillr/top-github-users/blob/master/get-details.coffee
https://github.com/caok/resume/blob/master/app/controllers/users_controller.rb

#### search api
http://developer.github.com/v3/search/ 

#### user => repos

```ruby
JSON.parse(open(user.repos_url).read)
```

#### repo => commit

```ruby
JSON.parse(open(repos.first['commits_url'].gsub(/\{.*\}/,'')).read)
```

#### V3

[v3 api](http://developer.github.com/v3/)
