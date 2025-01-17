This section here is about the raw requirement to get the worker successfully communicate with a Documentum server, either for extraction or injection.

!!! note

      Since Documentum architecture involves particular port and access management, a worker should be started on the same server where Documentum is running. Check out the [deployment variants topic](https://www.fast2.tech/blog/deployment-variants/#option-3--hybrid) for more information

## Dependencies and additional binaries

Following Documentum-specific configuration files and libraries must be added into `./worker-libs/` folder of the worker extracting from Documentum :

- `dfc.keystore`
- `dfc.properties`
- `dfc-x.y.z.jar`, which can be retrieved from the Documentum installation folder
- `commons-lang-x.y.jar`, matching the DFC JAR version. This dependency is accessible from the official [Apache Commons website](https://commons.apache.org/proper/commons-lang/download_lang.cgi) (for a `dfc-6.7.XXX-YYY.jar`, use the `commons-lang-2.4.jar`)

It also is necessary to remove the `fast2-worker-package-X.Y.Z.jar/BOOT-INF/lib/log4j-over-slf4j.jar` log dependency from the worker.

## Worker-specific configuration

The remote worker needs specific configuration too, which are to be configured from the `./config/application.properties` file :

| Configuration field      | Description                                                                                                |
| ------------------------ | ---------------------------------------------------------------------------------------------------------- |
| `worker.queue.regex`     | Documentum extraction dedicated queues <br />&nbsp;&nbsp;&nbsp;ex/ `worker.queue.regex=Dctm.*`             |
| `broker.url`             | Since the broker will be remotely accessed, the worker needs to be aware of where to reach it.             |
| `worker.content.factory` | This field has to be set to `remote` so the temporary binary contents will be stored on the broker server. |
