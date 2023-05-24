This section here is about the raw requirement to get Fast2 to communicate with an IBM CMOD server.

!!! note

        The very first thing to do is check out the [Content Manager OnDemand - Setting up the development environment](https://www.ibm.com/docs/en/cmofm/10.5.0?topic=applications-setting-up-development-environment) documentation

Store under the `LD_LIBRARY_PATH` environment variable the path of the libs where the worker will have to look up for the CMOD libs (ex/ `/opt/fast2/ondemand/V10.5/www` _vs_ `/opt/fast2/ondemand/V10.5/www/lib64`).

## 🐧 Linux

Make sure the 2 following `.rpm` packages, shipped in ODWEK client bundle package, are properly installed

- gskssl64-{ver}.linux.x86_64.rpm
- gskcrypt64-{ver}.linux.x86_64.rpm

by running the following command :

```sh
$ ldd /path/to/libars3wapi64.so
```

The missing dependent libraries will be highlighted like so :

```sh
libgsk8ssl_64.so => not found
libgsk8iccs_64.so => not found
libgsk8km_64.so => not found
```

When they are present they should be resolved to `/lib64/lib*.so`.

!!! Warning

        CMOD ODWEK client library requires to be installed in `/opt/ibm/cmod/V{ver}` folder.

        (This value is hard-coded in the `libarswapi64.so` library)

## ⚙️ Configure Fast2

### Required libs

1.  Copy all following libraries into a dedicated directory at the root of Fast2 (ex/ `FAST2_HOME/cmod-dlls/`):

    <ul>
    <li>ars3wapi64.dll</li>
    <li>arsgsk64.dll</li>
    <li>icudt48.dll</li>
    <li>icuin48.dll</li>
    <li>icui048.dll</li>
    <li>icule48.dll</li>
    <li>iculx48.dll</li>
    <li>icuuc48.dll</li>
    </ul>

1.  Declare the folder in `FAST2_HOME/config/application.properties` so the worker will load the libraries :
    ```ini
    worker.java.library.path=cmod-dlls/
    ```

### Update PATH environment variable

In `<FAST2_HOME>/startup-broker.bat` (resp. `<FAST2_HOME>/startup-broker.sh`)

```bat
SET PATH=%PATH%;cmod-dlls\

%JAVA% -Djava.library.path=cmod-dlls\dll64\ -Dfile.encoding...
```

## 🪲 Troubleshooting

### Error opening folder DLL

```log
java.lang.RuntimeException: Error opening folder : C:\...\www\ars3wapi32.dll: Can't load IA 32-bit .dll on a AMD 64-bit platform
  at com.fast2.cmod.CMODSource.fillHitIterator(CMODSource.java:217)
  at com.fast2.cmod.CMODSource.produce(CMODSource.java:103)
  at com.fast2.worker.SourceWorker.processCampaignSource(SourceWorker.java:114)
  at com.fast2.worker.SourceWorker.lambda$run$2(SourceWorker.java:61)
  at com.fast2.worker.NoFail.noFail(NoFail.java:31)
  at com.fast2.worker.SourceWorker.run(SourceWorker.java:61)
  at com.fast2.worker.QueueWatcher$5.run(QueueWatcher.java:299)
 Caused by: java.lang.UnsatisfiedLinkError: C:\...\www\ars3wapi32.dll: Can't load IA 32-bit .dll on a AMD 64-bit platform
  at java.lang.ClassLoader$NativeLibrary.load(Native Method)
  at java.lang.ClassLoader.loadLibrary0(ClassLoader.java:1934)
```

This error can be thrown due to either a misconfiguration of the `worker.java.library.path` key in the `application.properties` files, inducing the worker not to find the libs.

It can also be due to the `cmod-dlls/` folder not declared in the `PATH` environment variable, from the startup script files.
