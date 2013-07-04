###github成员贡献统计和排名

###演示地址
http://grank.herokuapp.com/

### 使用说明

本地测试github登录启动用

```ruby
bundle exec unicorn_rails -c config/unicorn.rb
```

### 报表设计

1. 月周贡献值排行
2. daily贡献变化
3. 个人历史趋势变化

```
 {"Baichuan Li"=>2, "Capri2014"=>1, "Clark"=>9, "Hu Hao"=>9, "Ken"=>41, "Ken Lu"=>86, "Ryan Zhu"=>7, "RyanZhu1024"=>2, "William Herry"=>7, "baichuan"=>11, "caok"=>32, "kaku87"=>1, "mouseshi"=>18, "soffolk"=>1, "vincent178"=>70, "zhangyi2099"=>2}
 
 {"2013-06-24"=>26, "2013-06-25"=>21, "2013-06-26"=>32, "2013-06-27"=>42, "2013-06-28"=>32, "2013-06-29"=>37, "2013-06-30"=>53, "2013-07-01"=>23, "2013-07-02"=>16, "2013-07-03"=>10, "2013-07-04"=>4}
 
```

### Rank form two places

  * repos
    
    - formula

      followers + 1.5 * watchers + 2 * forks

  * users

    - formula:

      待定...


###项目介绍

队长:
- [@hlee](https://github.com/hlee)

成员:
- [@williamherry](https://github.com/williamherry)
- [@RyanZhu1024](https://github.com/RyanZhu1024)
- [@mouseshi](https://github.com/mouse-lin)
