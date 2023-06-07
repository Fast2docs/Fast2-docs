# Fast2 documentation

To get started, you need to have Docker installed.

From the root of the project, head out here : https://squidfunk.github.io/mkdocs-material/creating-your-site/#previewing-as-you-write

Windows CMD :

```sh
docker run --rm -it -p 8000:8000 -v "%cd%":/docs squidfunk/mkdocs-material
```

## Deploy :

File `./CNAME` is required to deploy on custom domain, do not remove !
