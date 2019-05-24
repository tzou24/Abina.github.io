---
published: true
author: YaoBin Zou
layout: post
title: SpringBoot 注解实现数据缓存
categories: 开发
summary:
comment: true
tags:
  - dev
---
`文/邹耀斌`

### 写在前面
一般软件的开发中，关于数据的获取效率，增加缓存冗余数据一种很好手段。日益健全的开发环境，已经有很多封装好的产品，拿来即用实现数据的缓存。本篇介绍 SpringBoot + Redis，基于注解的方法来对后台数据进行简单的缓存操作。

### 缓存
**缓存** 需要关注三个方面
- 命中缓存
> 如果数据被缓存，则在此请求数据需要拉取缓存中的数据，实现命中。
- 更新缓存
> 如果数据库数据有变化，而缓存没有及时更新，这样拉取到的数据就不是最新的，所以在更新数据时，需要同步更新缓存数据。
- 缓存失效
> 对于缓存来说，它应该是对常用数据的快速响应，如果部分数据长期未调用，则需要清理，保证缓存空间大小，且保持数据拉取效率。

### 配置
开发中，引入一个插件或工具，必须要做一个基础配置，来进行整合到当前工程。
> 版本: SpringBoot 2.1.1.RELEASE

```xml
<dependency>
  <groupId>org.springframework.boot</groupId>
  <artifactId>spring-boot-starter-data-redis</artifactId>
</dependency>
```
RedisConfiguration 继承重写 CachingConfigurationSupport 
``` java

@Configuration
@EnableCaching
public class RedisConfiguration extends CachingConigurationSupport {
  
  @Autowired
  private JedisConnectionFactory jedisConnectionFactory;

  @Override
  public KeyGenerator keyGenerator() {
    //自定义缓存 key 键值生成策略，这里可以定义全局默认的，也可以在具体方法中自己定义。
  }
  
  @Bean
  @Override
  public CacheManager cacheManager() {
    //初始化缓存管理器，可以设置过期时间等, 这里使用默认
    RedisCacheManager.RedisCacheManagerBuilder builder = RedisCacheManager.RedisCacheManagerBuilder
                                                                          .fromConnectionFactory(jedisConnectionFactory);
    return builder.build();
  }
  
  
  @Baen
  public RedisTemplate<String, Serializable> redisTemplate(JedisConnectionFactory jedisConnectionFactory) {
    //选用序列化方式, Spring data 提供了多种序列化方法，这里使用 jackson
    Jackson2JsonRedisSerializer jackson2JsonRedisSerializer = new Jackson2JsonRedisSerializer(Object.class);
    //配置 redisTemplate
    RedisTemplate<String, Serializable> redisTemplate = new RedisTemplate();
    redisTemplate.setConnectionFactory();
    redisTemplate.setKeySerializer(new StringRedisSerializer()); //key 使用 String 序列化
    redisTemplate.setHashKeySerializer(new StringRedisSerializer());
    redisTemplate.setValueSerializer(jackson2JsonRedisSerializer); //value 使用 jackson 序列化
    redisTemplate.setHashValueSerializer(jackson2JsonRedisSerializer);
    
    redisTemplate.afterPropertiesSet();
    return redisTemplate;
  }
  
  @Bean
  @Override
  public CacheErrorHandler errorHandler() {
    CacheErrorHandler cacheErrorHandler = new CacheErrorHandler(){
      // do Override  处理异常
    }
  }
}
```

### 使用注解
以上完成一个简单的 redis 序列化缓存配置, 接下来使用注解对数据进行缓存, 常用的注解有以下几种:

**@Cacheable**
该注解可以作用在类或方法上, 在类上表示所有方法返回对象都加入缓存, 如果在方法上则指定该方法返回对象加入缓存. 该注解包含三个属性, value 为缓存名称, key 为缓存数据键值, 可以自己定义, condition 为表达式,由自己定义.使用如下:
``` java
public interface ModuleService {
  @Cacheable(value="cache1", key="#p0.id", condition="#p0.id == '1'")
  List query(Query query);
}

```

**@CachePut**
该注解与 @Cacheable 类似，区别在于它会每次都执行，并且替换缓存中相同名称，一般用来更新缓存。
``` java
public interface ModuleService {
  @CachePut(value="cache1")
  int update(Module module);
}
```
**@CacheEvict**
该注解用来清除缓存，它的属性与 @Cacheable 相比多了两个，allEntries 默认 false，根据 key 来清除指定缓存，如果为 true 则表示忽略 key 属性，对所有缓清除。beforeInvocation 属性为 true 时表示，在执行该方法之前执行清除缓存操作。 
``` java
public interface ModuleService {
  @CacheEvict(value="cache1", allEntries=true)
  int remove(int id);
}
```

以上, 就可以实现简单的数据缓存操作。
关于 key 属性和 condition 属性中的表达式可以参考 [Spring Expression Language (SpEL)](https://docs.spring.io/spring/docs/4.2.x/spring-framework-reference/html/expressions.html) 规范

(全文完)


