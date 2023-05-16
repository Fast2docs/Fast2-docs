# Fast2 documentation

To get started, you need to have Docker installed.

From the root of the project, head out here : https://squidfunk.github.io/mkdocs-material/creating-your-site/#previewing-as-you-write

Windows CMD :

```sh
docker run --rm -it -p 8000:8000 -v "%cd%":/docs squidfunk/mkdocs-material
```

# Left to do

- getting started
  - create a workflow (w GIF)
  - UI controls and presentation
  - UI configuration
    - links
    - tasks
- Catalog (req. XSLS or remodel ?)
- Blogs (req. sponsor status)
- Cookbook
  - JS transform
  - ZIP2Punnet
  - CSV source
  - JDBC
- components (index)
- advanced

  - scheduler
  - shared objects
  - optimization
  - custom modules

- set up property : !ENV GOOGLE_ANALYTICS_KEY
