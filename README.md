# About

This repository contains the Elixir Plug HTTP Application wrapped in Podman.

# How to compile ?

```shell
mix compile
```

# How to run?

```shell
mix run server.ex
```

# How to run with podman?

```shell
podman build -t  my-first-pod . 
podman run -d --name my-first-pod -p 3001:3000 my-first-pod
```

# How to test?

```shell
curl  --location  http://localhost:3001/  
> What kind of fruit is that? 🍍
```

# Related article