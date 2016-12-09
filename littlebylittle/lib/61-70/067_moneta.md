## Moneta

* An other way of caching 

In the previous episode, we using Hashing, but...Hashing won't persistent, so
the cache won't survive past the life of the current process.

* [example of how moneta works](067_moneta.rb)

after excute, it would generate yaml file or store file according to you
configuration

```sh
cat store.yaml
tree store
```

* [example with Cacahing API](067_moneta_caching_an_api.rb)
