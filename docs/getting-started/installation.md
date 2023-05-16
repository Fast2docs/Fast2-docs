---
weight: 10
draft: false

title: Installation
icon: las la-laptop-code
---

## Requirements

The installation of Fast2 requires a few environment specifications to run properly :

| What      |                        | Description                                                                                                                                                                                                                                                                                                                                                                                             |
| --------- | ---------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| RAM       | 8GB+                   | We highly recommend having at least 8GB. <br /><br />When switching to production environments, 16GB or 32GB will be required since more documents will be handled at once, and heavy tasks (_e.g._ conversion, extraction) might get short on resources.                                                                                                                                               |
| Processor | 8 CPUs                 | Processor capabilities need to be aligned with migration requirements, such as data mapping, content conversion and heavy I/O.                                                                                                                                                                                                                                                                          |
| Storage   | 128GB+                 | Although the contents dealt by Fast2 will be temporarily stored (and deleted afterwards if asked), the server needs enough storage for the files/contents alongside the database tracking all the migration information.                                                                                                                                                                                |
| Java      | JRE8, JRE11            | Any provider will fit (Oracle, [OpenJDK](https://developers.redhat.com/products/openjdk/download), etc). If you have multiple JDK/JRE already installed, specify the correct one in the `./config/env.properties` file.                                                                                                                                                                                 |
| OS        | Windows&nbsp;7+, Linux | All versions of Windows 7+ are supported. <br/><br/>All common distros of Linux are supported (Ubunto, RedHat, CentOS, etc)<br /><br />Power architecture are supported as well (except the ones running in AIX), but only Java parts will work seamlessly whereas third-party software (_e.g._ imagemagick, libreoffice, etc) might not, as they have not all have been developed for such plateforms. |

<br /><br />

While setting up the production server for Fast2, make sure to scale the Fast2 machine accordingly. You may need to increase the allocated memory for both the broker and the background database. If you planned to deal with campaigns of a few millions of documents, setting **8GB** of memory for the [broker](../../components/broker/#configure-the-broker) and **8GB** for the [database](../../components/database/#configuration) as well is a good starting point.

!!! warning

    If you decide to go for a custom Elasticsearch database, make sure to confirm the compatibility with your environment at [Elasticsearch Support Matrix](https://www.elastic.co/fr/support/matrix).

## Fast2 packages

The Fast2 distribution you need depends on your target environment. It exists three way to deploy a Fast2 :

&nbsp;&nbsp;&nbsp;&nbsp;:material-folder-zip-outline: On premise: regular package, as an all-in-one zip file<br/>
&nbsp;&nbsp;&nbsp;&nbsp;:fontawesome-brands-aws: AWS: Standard AMIs<br/>
&nbsp;&nbsp;&nbsp;&nbsp;:material-docker: K8S: Docker Images

Each distribution ships the following

- A broker with one embedded worker and a user interface
- An additional worker with all tasks catalog
- A template to create workers with custom tasks

## Root folder anatomy

| Item                                                     | Purpose                                             |
| -------------------------------------------------------- | --------------------------------------------------- |
| :material-folder: config                                 | Configuration files, broker endpoint, Java home     |
| :material-folder: logs                                   | Logging files for both broker and worker(s)         |
| :material-folder: maps                                   | XML files of all maps accessible from the UI        |
| :material-folder: database                               | Either Elasticsearch or OpenSearch                  |
| :material-folder: service                                | All files required to start Fast2 as a service      |
| :material-folder: worker-libs/\*                         | All libraries and dependencies for tasks executions |
| :fontawesome-brands-java: fast2-broker-package-X.Y.Z.jar | Broker unit                                         |
| :fontawesome-brands-java: fast2-worker-package-X.Y.Z.jar | Worker main unit                                    |
| :material-microsoft-windows: startup-broker.bat          | Binary file for Windows                             |
| :fontawesome-brands-linux: startup-broker.sh             | Binary file for Linux                               |
| :material-microsoft-windows: startup-worker.bat          | Binary file for Windows                             |
| :fontawesome-brands-linux: startup-worker.sh             | Binary file for Linux                               |

## Start-up sequence

When Fast2 is started, either as a standalone application or a service, its different modules share a precisely defined roll-out schedule:

- First, the broker and its internal databse are started. The connection between these 2 components has to be effective, otherwise Fast2 will automatically shut down after a couple of attempts to reach the database;
- The worker is then triggered, and has to register itself to the broker.
- Finally, the dashboard will be started if asked so, and if the binaries have been detected. First, Fast2 will try to connect to any dashboard instance running on the configured port.

There is no direct connection between the broker and the dashboard. The only exchange area is the Elasticsearch database, as explained in the [architecture section](../overall-concepts/#architecture).

## Start Fast2 Broker

Once the regular Fast2 package is unzipped, Fast2 can be launched right away.

Whether Fast2 is launched from the batch file or as a service on your environment, the UI will be available at [http://localhost:1789/]().

By default, Fast2 Broker starts an embedded Elastic Search and an embedded Fast2 Worker.

All commands below are to be run under the Fast2 install path (where the Zip has been unzipped).

### From command line

=== ":fontawesome-brands-windows: Windows"

    Go into the Fast2 install folder, and run :

    ```cmd
    C:\path-to-fast2\> startup-broker.bat
    ```

    Administrator rights might be required since Fast2 will handle some port communications.

=== ":fontawesome-brands-linux: Linux"

    The following Linux installation steps work for most of Unix-based sytems.
    Elasticsearch cannot be started from root user, you will need to create a secondary user to start the database binary alongside your Fast2 process.

    Once connected as the latter user, start Elasticsearch via its binaries.

    Then, since you started Elasticsearch manually, disable the command triggering Fast2 to start the embedded Elasticsearch, from the `config/application.properties` file :

    ```log
    broker.elasticsearch.embedded.enabled=false
    ```

    You can now properly execute the following script:

    ```
    $ ./startup-broker.sh
    ```

To end the Fast2 process, just hit `Ctrl+C` in the command line the startup file opened.

### As service

=== ":fontawesome-brands-windows: Windows"

    Go into the Fast2 installation folder, and open the Windows Command Prompt.

    To install the service :

    ```cmd
    C:\path-to-fast2\service\windows> Fast2_broker_service.exe install
    ```

    Your machine may prompt a message asking to download .NET components. Please click [OK] and proceed.

    Once this command is complete, you should see in your services registory a newly installed Fast2 service. You can start/stop/restart it as any other service, or via the Command Prompt (just replace `install` in the previous command by _start_/_stop_/_uninstall_/_restart_/_status_).

    The logs of the service will be available from the `path-to-fast2\service\log` folder.

=== ":fontawesome-brands-linux: Linux"

    There are several ways to create a service under linux distribution. We will do it through systemd.
    Its major benefit is that it has been the default init system for the majority of linux distributions (Ubuntu, Red Hat, Fedora...).

    <br />

    ##### :material-numeric-1-circle: Create a user for Fast2

    Since the embedded database cannot be started in sudo mode, an additional user needs to be created in the Linux machine so the broker will successfully initiate the database bootup.

    Let's condider here our user to be *fast2user*.

    Head out to the `./startup-broker.sh` and get the user start the broker by switching users (with `su fast2user -c`) for the Java command.

    The result should be as follows:

    ```diff
    - "$JAVA" -Xmx$BROKER_MAX_MEMORY -jar fast2-broker-package-X.Y.Z.jar
    + su fast2user -c "$JAVA -Xmx$BROKER_MAX_MEMORY -jar fast2-broker-package-X.Y.Z.jar"
    ```

    <br/>

    ##### :material-numeric-2-circle: Execution path

    Edit the `ExectStart` field from the file `service/linux/fast2-broker.service` by changing the `PATH/TO/FAST2` portion: set it to Fast2 install path.

    ```
    [Unit]
    Description=Fast2 Broker

    [Service]
    ExecStart=/home/userName/fast2-complete-package-2.0.0/startup-broker.sh

    [Install]
    WantedBy=default.target
    ```

    <br />

    ##### :material-numeric-3-circle: Symbolic link

    Now link it to the `/etc/systemd/system` directory through a symbolic link.

    ```
    $ sudo ln -s SOURCE TARGET

    $ sudo ln -s service/linux/fast2-broker.service /etc/systemd/system
    ```

    If the links are broken once they're created, you probably need to put an absolute path for the target as follow ;

    ```
    $ sudo ln -s /home/userName/fast2-complete-package-2.0.0/service/linux/fast2-broker.service /etc/systemd/system
    ```

    Next, reload systemd services unit and enable them :

    ```
    $ systemctl daemon-reload
    $ systemctl enable fast2-broker.service
    ```

    The terminal should prompt the following message :

    ```
    Created symlink from /etc/systemd/system/default.target.wants/fast2-broker.service to /etc/systemd/system/fast2-broker.service.
    ```

    <br />

    ##### :material-numeric-4-circle: Script uses

    Test your script by starting it and then checking the status :

    ```sh
    $ service fast2-broker start
    $ service fast2-broker status
    ```

    or

    ```sh
    $ systemctl start fast2-broker.service
    $ systemctl status fast2-broker.service
    ```

    You can restart or stop the service at anytime with the commands :

    ```
    $ service fast2 start | restart | stop | status
    ```

## Start Fast2 Worker

The Broker starts an embedded worker by default.

=== ":fontawesome-brands-windows: Windows"

    If you wish to start multiple workers, just hit :

    ```cmd
    C:\path-to-fast2\> startup-worker.bat
    ```

=== ":fontawesome-brands-linux: Linux"

    ```
    ./startup-worker.sh
    ```

If the worker and broker are not booted up on the same machine, you need to setup the Broker host name in the worker configuration file.
Edit the file `config/application.properties` and modify `broker.host` accordingly.

You can setup Fast2 Worker as a service the same way you did for the Fast2 Broker.
