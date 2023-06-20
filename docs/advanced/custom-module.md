## Create your own custom task, ok but why? { #why data-toc-label="Why ?" }

You are no doubt aware of both tasks, the [XSLTransform](../../catalog/transformer/#XSLTransform) and [JSTransform](../../catalog/transformer/#JSTransform) (checkout [here](../javascript) for how to use the latter), which are quite handy for quick and light changes of the migrated data. For deeper customization and operations though, you might need to build a dedicated task, a dedicated injector for your in-house storage system, and so on!

## Create your own custom task, how? { #how data-toc-label="How ?" }

The good news is Fast2 has a Java API available for any custom or in-house task development for you to achieve exactly what is needed for a tailor-made migration. You are just a few steps away of having your own.

The product is built on the Maven framework, reason for what the following dependencies will be required:

```xml
<dependencies>
	...
    <!-- Packages for basic migration objects -->
	<dependency>
		<groupId>com.fast2</groupId>
		<artifactId>fast2-model-base</artifactId>
		<version>${fast2.version}</version>
	</dependency>
	<dependency>
		<groupId>com.fast2</groupId>
		<artifactId>fast2-model</artifactId>
		<version>${fast2.version}</version>
	</dependency>

    <!-- Packages for task configuration by the user -->
	<dependency>
		<groupId>com.arondor.common.reflection</groupId>
		<artifactId>arondor-common-reflection-model</artifactId>
		<version>${acr.version}</version>
	</dependency>
</dependencies>
```

These 2 first dependencies will be used by the task to execute properly the operations at any level of the punnet (either the documents, dataset, folders, data properties etc), while the last one's role will consist in the fields configuration. A non-configurable task is not future-proof as it is too rigid, however if you still decide to go for it, there is no need to include the _Arondor common reflection_ dependency.

## Task creation

If the task creation can be a straightforward operation, the decisions regarding its deeper role, how it can integrate your migration workflow, are not. Here, we will only focus on the technical aspects to add your task to the Fast2 catalog.

### The code, show me the code !

Once the correct dependencies are added to your project, the new task can be created based on the following code snippet:

```java
package com.example;

import com.arondor.common.management.mbean.annotation.*;
import com.fast2.model.context.PatternResolver;
import com.fast2.model.punnet.ContentContainer;
import com.fast2.model.punnet.Document;
import com.fast2.model.punnet.Punnet;
import com.fast2.model.task.TaskException;
import com.fast2.model.task.annotation.TaskType;
import com.fast2.model.task.annotation.TaskType.Type;
import com.fast2.task.common.BasicTask;

@TaskType(...) //(1)!
@Description("...")                      // can be used for keyword search in catalog
public class MyTask extends BasicTask
{
    @Description("Label of field")
    @LongDescription("Helper text when field is focused")
    @Example("Used for the documentation")
    @DefaultValue("The default value")    // Automatically filled value
    @Mandatory                            // Show field for basic task configuration
    @Password                             // Hide input when filling field
    private String myTaskVariable = "The default value";


    @Override
    public boolean runTask(Punnet punnet) throws TaskException
    {
        if(myTaskVariable == null)
            throw new TaskException("Missing value for ...");

        for(Document document: punnet.getDocuments()){
            // Iterate on documents embedded by the punnet
        }

        return true;
    }

    @Override
    public synchronized void finishTask()
    {
    }

    public void setMyTaskVariable(String myTaskVariable)
    {
        this.myTaskVariable = myTaskVariable;
    }

    public String getMyTaskVariable()
    {
        return this.myTaskVariable;
    }
}
```

1. Availables task types are<ul><li>Source,</li><li>ContentSource,</li><li>Credentials,</li><li>Loader,</li><li>Transformer,</li><li>Converter</li></ul>

### Regarding types, to each its own ! { #task-types data-toc-label="Task type" }

The task type is related to the role of this task during the migration. It also will be used to sort the task within the catalog. Each type annotation has to be used on purpose :

| Type          | Use                                                                                                                                                                                                                                                                                               | Extends     |
| ------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| Source        | Extraction for a given ECM, relying in the Java API provided by the source ECM. This type of tasks usually focus on the extraction of primary keys/ID of elements to extract. This task litterally build the punnets for the rest of the workflow. The source tasks cannot be multi-threaded yet. | BasicSource |
| ContentSource | The tasks of such type will mainly extract the content of the documents, but can extract the remaining metadata if required. They can be multi-threaded in order to increase the performance rates of the extraction.                                                                             | BasicTask   |
| Loader        | The loaders are the tasks injecting the punnets into the destination environment. They can be multi-threaded.                                                                                                                                                                                     | BasicTask   |
| Credentials   | These components are used to connect to the ECMs. Sources, ContentSources and Loaders will required such elements. They are not tasks strictly speaking.                                                                                                                                          | Ø           |
| Transformer   | The transforming tasks will edit the data of the punnet or its embedded documents or references, by adding, removing or changing the metadata. They can be multi-threaded.                                                                                                                        | BasicTask   |
| Converter     | The converting tasks are dedicated to the format conversion of the content to migrate. They can be multi-threaded.                                                                                                                                                                                | BasicTask   |
| Tool          | The tools are any other task matching none of the types mentioned above.                                                                                                                                                                                                                          | BasicTask   |

<br/>

!!! info

    Only tasks of type Source, ContentSource, Loaders, Transformer, Converter and Tool will be accessible from the catalog.

### Instance variables: it's all about balance ! { #parameterized-fields data-toc-label="Parameterized fields" }

You can have as many instance variables as required, depending on your level of configuration expected for the task.

The more a task will have parameters, the more flexible it will be. However the heavier the configuration is, the trickier it is for the user not to miss the very fields.

The getters and setters are to be properly generated to prevent the field not to be accessible in the configuration panel of your task, during the design stage of the migration workflow. Most IDEs can automatically generate the accessors with proper form, consider relying on this feature in case of hesitation.

!!! success "`@Description` is not mandatory"

    A variable without any annotation will still be configurable from the Fast2 UI as long as both the getter and setter are present in the class.

### Add your task to Fast2

Once the behavior of the custom task meets your needs, you can add this task to your current Fast2 binaries in 4 easy steps:

1.  Run the command `mvn clean install` on the package of your custom task
2.  Copy the JAR `<custom-package-name>-<version>.jar` from the `target/` folder to the `{Fast2-HOME}/worker-libs/` folder of the Fast2 binaries
3.  Since your custom task belongs to a new package, this very package needs to be declared to the worker.

    Do so by completing the L36 of the `{Fast2-HOME}/config/application.properties`, where `com.example` is your package name with the custom task:

    ```ini hl_lines="2"
    # Worker packages to scan for classes to configure as Tasks and Sources
    worker.scan.packages=com.fast2.,com.arondor.,com.example
    ```

4.  Start Fast2 if it wasn't already, restart it otherwise

Open the catalog of the design area, and here you go: you custom task can be found in the section related to the task type you set in your Java class.

## Q&A

### Error "Could not get method for class..."

When starting Fast2 (with the embedded worker) you may run into the following error in the console:

```txt
com.arondor.common.reflection.parser.java.JavaAccessibleClassParser:530 - Could not get methods for class … because of …
```

Make sure all the required dependencies (which can be checked in the pom.xml of the custom package) are also in the `{Fast2-HOME}/worker-libs/` folder.

If all they already are, make sure not to have any version conflicts induced by the new dependencies.

### My task is missing from the catalog

4 main reasons can explain such issue:

- The package is not declared to the worker (cf. point #3 of how to [add your task to Fast2](#add-your-task-to-fast2))
- Your task class does not have a `@TaskType` annotation (cf. [task creation](#task-creation))
- Your browser cache needs to be cleaned (Ctrl+F5)
- Fast2 has not been stopped nor restarted during once the new custom JAR has been added to the worker libraries folder.

### My task is missing some configuration fields

Make sure the getters and setters of this non-showing field have been properly written(cf. [task creation](#task-creation)).
