# Fast2 documentation

To get started, you need to have Docker installed **and started** !

From the root of the project, head out here : https://squidfunk.github.io/mkdocs-material/creating-your-site/#previewing-as-you-write

Windows CMD :

```sh
docker run --rm -it -p 8000:8000 -v "%cd%":/docs squidfunk/mkdocs-material
```

docker run --rm -it -p 8000:8000 -v "%cd%":/docs squidfunk/mkdocs-material

## Deploy :

File `./CNAME` is required to deploy on custom domain, do not remove !

## Generate Fast2 software catalog documentation

- Retrieve the allclasses.xml file from the software at the lastest at copy it at the root of this project;
- Run the allclasses.sh script with a WSL (Linux or Windows with Linux) with the following command :

  ```sh
  ./allclasses.sh
  ```

### Troubleshooting

If the terminal returns _No such file or directory_ like :

```sh
joe@aro-JTE-648:/mnt/c/Users/joseph.tessier_arond/git/Fast2-docs$ ./allclasses2md.sh
-bash: ./allclasses2md.sh: /bin/bash^M: bad interpreter: No such file or directory
```

run the command :

```sh
dos2unix allclasses2md.sh
```

and then run again the `./allclasses2md.sh` command.
