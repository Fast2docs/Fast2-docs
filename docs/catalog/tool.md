## AwsMove <small> - AWS S3 file mover </small> {#AwsMove data-toc-label="AwsMove"}

Reorganize your files inside your AWS S3 environment.

<b>Mandatory settings</b>

|Key      | Type    | Description | 
| - | - | - |
 | AWS access credentials | [AWSConnectionProvider](../credentials/#AWSConnectionProvider) | Must have granted AmazonS3FullAccess permission | 
 | Target key | `String` | The destination path inside your bucket where the document must be placed. Use as standard Pattern (includes S3 Folders) | 


<b>Optional settings</b>

|Key      | Type    | Description | 
| - | - | - |
 | Target bucket | `String` | The target bucket where you want to move your S3 files. If empty use the same as origin | 



## CountPdfPages <small> - Count the number of pages in PDF file </small> {#CountPdfPages data-toc-label="CountPdfPages"}

This task will add the number of pages as a metadata to the document.



<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Throw conversion exceptions | `Boolean` | If Fast2 performs document conversion, it can either fail silently or pop an error when the action has not been properly completed | `true ` | 
 | Mime-type : Check document before content | `Boolean` | You can assume the file extension is accurate, or ask Fast2 to check the content encoding to identify more precisely the document mime-type. By default, Fast2 will check at content level | `false ` | 
 | Process annotation contents | `Boolean` | If annotations are asked to be migrated, you can filter here to process their content(s) or only their metadata | `false ` | 
 | Scan recursive content | `Boolean` | Only convert terminal contents and not container ones | `false ` | 
 | Process all contents | `Boolean` | Fast2 will either only focus on the first encountered content, or process them all | `true ` | 
 | Supported mime-types | `String list` | Specify the list of all mime-types of documents which Fast2 will convert | 
 | Property name | `String` | Name of the property to which the number of pages will be linked | `F_PAGES ` | 



## EndTaskWriter <small> - Create file with custom content when map ends </small> {#EndTaskWriter data-toc-label="EndTaskWriter"}

A task to write a file when all punnets of task are finished.

<b>Mandatory settings</b>

|Key      | Type    | Description | 
| - | - | - |
 | Output file path | `String` | Absolute path to file. This path must include file name and extension. This field will be resolved by Fast2 before the task is run | 


<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | File encoding | `String` | Encoding of the file where the content will be written | `UTF-8 ` | 
 | File content | `String` | Text to write in the output file | 



## ExceptionGenerator <small> - Regularly generate exceptions </small> {#ExceptionGenerator data-toc-label="ExceptionGenerator"}

This task will generates different exception types : either TaskException or RuntimeException. It will be usefull for your when dealing with exception routing.By default, Fast2 will produce 3 task exceptions, then 4 runtime exceptions, and finally 4 no-exception punnets. To force exceptions, set the no-exceptions ratio to zero.



<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Runtime exceptions ratio | `Integer` | The number of runtime exception which will be thrown by Fast2 | `3 ` | 
 | No-exception ratio | `Integer` | The number of no-exception which will be thrown by Fast2 | `4 ` | 
 | Task exceptions ratio | `Integer` | The number of task exception which will be thrown by Fast2 | `3 ` | 



## GenerateExceptionTask <small> - Throw exception when condition is verified </small> {#GenerateExceptionTask data-toc-label="GenerateExceptionTask"}

This task is responsible for exception generation based on a condition which can be dynamically built for each punnet.



<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Condition | `String` | Set here the condition to trigger exception. This field will be resolved by Fast2 before the task is executed <br/> <p> Ex/  mimeType == application/pdf</p> | `true ` | 



## HashSignTask <small> - Compute content hash </small> {#HashSignTask data-toc-label="HashSignTask"}

This task computes the hash of a given document content. This new hash can be confronted to an already existing one.



<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Conten key for hash | `String` | Name of the metadata where the hash value will be stored. This value will be attached to the content and the document dataset itself | `hash ` | 
 | Suffix of ouptut file | `String` | Suffix of the external file containing the hash value to compare with | 
 | Algorithm | `String` | The algorithm of hashing which will be used for document content | `SHA-256 ` | 
 | Process annotation contents | `Boolean` | If annotations are asked to be migrated, you can filter here to process their content(s) or only their metadata | `false ` | 
 | Scan recursive content | `Boolean` | Only convert terminal contents and not container ones | `false ` | 
 | Supported mime-types | `String list` | Specify the list of all mime-types of documents which Fast2 will convert | 
 | Block size | `Integer` | In bytes. The default value is 256 * 1024 | `262144 ` | 
 | Throw conversion exceptions | `Boolean` | If Fast2 performs document conversion, it can either fail silently or pop an error when the action has not been properly completed | `true ` | 
 | Mime-type : Check document before content | `Boolean` | You can assume the file extension is accurate, or ask Fast2 to check the content encoding to identify more precisely the document mime-type. By default, Fast2 will check at content level | `false ` | 
 | Existing hash to compare | `String` | Document data name to compare the new hash with. Throws TaskException when different | 
 | Process all contents | `Boolean` | Fast2 will either only focus on the first encountered content, or process them all | `true ` | 
 | Document key for hash | `String` | Name of the metadata where the hash value will be stored, at document level | 



## MailMover <small> - Move email conversation into folder </small> {#MailMover data-toc-label="MailMover"}

This task will be useful when your needs will be to move a given email conversation into a dedicated folder. Whether this folder exists or not, Fast2 will be able to retrieve or create it.

<b>Mandatory settings</b>

|Key      | Type    | Description | 
| - | - | - |
 | Email provider | [MailBoxProvider](../credentials/#MailBoxProvider) | The Fast2 module establishing the connection to the email server, from the account of a given user. For more about the configuration of the object, please refer to the appropriate section | 
 | Destination folder | `String` | The folder where the email will eventually be moved to. This value will be resolved by Fast2 prior to the task execution | 


<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | mailNotFoundException | `Boolean` |  | 
 | Data to find | `String` | The data to look for. This value will be resolved by Fast2 prior to the task execution | `${Message-Id} ` | 
 | Maximum connection TTL | `Long` | Fill the value in milliseconds | `60 ` | 
 | Create destination folder | `Boolean` | Ask Fast2 to create the destination folder to move the email into, in case this specific folder does not exist yet | `false ` | 
 | Search field name | `String` | The name of the field where to find the data. Only 'Subject' and 'Message-Id' are available | `Message-Id ` | 



## MimeTypeFinder <small> - Find mime-type of documents </small> {#MimeTypeFinder data-toc-label="MimeTypeFinder"}

This task is used for automatic detection of mime type for documents



<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Process annotation contents | `Boolean` | If annotations are asked to be migrated, you can filter here to process their content(s) or only their metadata | `false ` | 
 | Scan recursive content | `Boolean` | Only convert terminal contents and not container ones | `false ` | 
 | Stop at first exception | `Boolean` | Stop processing punnets when one could not been properly processed | `false ` | 
 | Supported mime-types | `String list` | Specify the list of all mime-types of documents which Fast2 will convert | 
 | Use most specific mime type | `Boolean` | Otherwise use the first mime type found | `false ` | 
 | Throw conversion exceptions | `Boolean` | If Fast2 performs document conversion, it can either fail silently or pop an error when the action has not been properly completed | `true ` | 
 | Default mime type | `String` | The default mime-type to set if none has been found. This value must be set, or it will throw a RuntimeException | `application/octet-stream ` | 
 | Mime-type : Check document before content | `Boolean` | You can assume the file extension is accurate, or ask Fast2 to check the content encoding to identify more precisely the document mime-type. By default, Fast2 will check at content level | `false ` | 
 | Update document mime type | `Boolean` | Otherwise update only page or content mimetype | `true ` | 
 | Force to identify mime type | `Boolean` | If the mime type could not be found by looking at the metadata, either Fast2 skips the document or digs deeper into the content to retrieve the mime type | `false ` | 
 | Process all contents | `Boolean` | Fast2 will either only focus on the first encountered content, or process them all | `true ` | 



## MimetypeToExtension <small> - Append extension to name </small> {#MimetypeToExtension data-toc-label="MimetypeToExtension"}

Based on the mime-type of the content, this task will resolve the correct extension to append to the name of the document. Only supported for one content per document



<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Key of name property | `String` | Key of the current name metadata, whose value will be appended by the matching extension. | `name ` | 
 | Document mime-type | `String` | This value will be resolved by Fast2, `${...}` syntax is supported. Use this option when only the document mime-type has been provided, without the actual content. | 



## MoveAnnotationContent <small> - Move the content of any annotation </small> {#MoveAnnotationContent data-toc-label="MoveAnnotationContent"}

This task is responsible for moving content of annotations from a given folder into a new one.

<b>Mandatory settings</b>

|Key      | Type    | Description | 
| - | - | - |
 | Source folder | `String` | Absolute path of the folder where to find the annotations to move | 
 | Destination folder | `String` | Absolute path of the folder where to move the annotations | 



## MoveContent <small> - Move or copy the content of a document </small> {#MoveContent data-toc-label="MoveContent"}

This task is responsible for moving content of documents from a given folder into a new one.

<b>Mandatory settings</b>

|Key      | Type    | Description | 
| - | - | - |
 | Destination folder | `String` | The path of the folder where the contents will be moved into | 


<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Copy files | `Boolean` | Copy the file to the destination folder instead of moving it | `false ` | 
 | Delete original copy | `Boolean` | Delete the file in the source folder when it has been migrated | `false ` | 
 | Process annotation contents | `Boolean` | If annotations are asked to be migrated, you can filter here to process their content(s) or only their metadata | `false ` | 
 | Checking interval | `Integer` | Time to wait between two checks if target file exists | `1000 ` | 
 | Scan recursive content | `Boolean` | Only convert terminal contents and not container ones | `false ` | 
 | Exclude file name for renaming file | `Boolean` | Renamed the file based on the value of the destination folder only | `false ` | 
 | Wait until target file exists | `Boolean` | Only process next document when the current has successfully been migrated | `false ` | 
 | Supported mime-types | `String list` | Specify the list of all mime-types of documents which Fast2 will convert | 
 | Allowed retries | `Integer` | Number of checks before despair and exception | `60 ` | 
 | Source folder | `String` | Set here the common prefix of all document contents to move. If null use file folder | 
 | Throw conversion exceptions | `Boolean` | If Fast2 performs document conversion, it can either fail silently or pop an error when the action has not been properly completed | `true ` | 
 | Mime-type : Check document before content | `Boolean` | You can assume the file extension is accurate, or ask Fast2 to check the content encoding to identify more precisely the document mime-type. By default, Fast2 will check at content level | `false ` | 
 | File extension | `String` | The extension to append to the name of the files once they'll be moved | 
 | Keep original filename | `Boolean` | Set the destination file name to the 'title' property defined at the content level. Otherwise, keep the name of the file pointed by the URL | `false ` | 
 | Process all contents | `Boolean` | Fast2 will either only focus on the first encountered content, or process them all | `true ` | 
 | Files to exclude | `String list` | The path of the folder to exclude. Its whole content will remain in place. Leave empty to move all folders children <br/> <p> Ex/  *.out, folder/**/exclude</p> | 



## MovePunnet <small> - Move a punnet from folder to folder </small> {#MovePunnet data-toc-label="MovePunnet"}

This task is responsible for moving a punnet from an embedded path into a new folder.

<b>Mandatory settings</b>

|Key      | Type    | Description | 
| - | - | - |
 | Destination path | `String` | The path where to move the punnets. This field will be resolved by Fast2 prior to the task execution | 


<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Time between two retries | `Integer` | In milliseconds | `1000 ` | 
 | Allowed retries | `Integer` | Maximum number of retries before throwing an exception when renaming failed | `10 ` | 
 | Override existing punnet | `Boolean` | If Fast2 finds an already existing punnet, it will override it with the one being processed | `true ` | 
 | Look for path at punnet level | `Boolean` | Tells Fast2 to look for the absolute path variable (whose key is 'absolutePath') into the punnet dataset. Otherwise Fast2 will look at the first document dataset level | `true ` | 



## Noop <small> - Blank task performing no operation </small> {#Noop data-toc-label="Noop"}

This task does not perform anything, hence you don't have to configure it. All documents and punnets will go through it without having their state updated.




## PropertyHelper <small> - FileNet submodule for properties management </small> {#PropertyHelper data-toc-label="PropertyHelper"}





<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Blacklist for extraction | `String list` |  | 
 | Force user names | `Boolean` | Force assigning users (e.g. Creator, LastModifier) when they don't exist in the destination environment | `true ` | 
 | Date format | `String` |  | `MM dd HH:mm:ss z yyyy ` | 
 | Property name used to explicitly skip Data | `String` |  | 
 | Do not throw Date parsing exceptions | `Boolean` |  | 
 | Store object-store as name | `Boolean` | By default, Fast2 is expecting FileNet UUID as object-store reference on object-typed properties. Enable this option to deal with the object-store name instead of its UUID. This parameter is only use at extraction. | 



## PunnetSerializer <small> - From-java-to-XML punnet converter </small> {#PunnetSerializer data-toc-label="PunnetSerializer"}

This task is responsible for serializing a punnet to an XML file. That can be interesting to check punnet metadata or freeze a punnet at a certain state.




## PunnetWriteId <small> - List all punnet IDs into a file </small> {#PunnetWriteId data-toc-label="PunnetWriteId"}

This task is responsible for writing all punnet IDs into a given text file. Whether the punnet has documents or not, you can keep a trace of all created and encountered punnets.

<b>Mandatory settings</b>

|Key      | Type    | Description | 
| - | - | - |
 | Output file | `String` | The absolute path of the output file where to store all punnet IDs. Specify file name and extension | 


<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 |  | OutputStream |  | 
 | Append | `Boolean` | Create FileOutputStream with this append option | 
 | Always write punnet ID | `Boolean` | Write punnet Id event when it contains no document | `true ` | 



## ReadContent <small> - Resolve mime type from content </small> {#ReadContent data-toc-label="ReadContent"}

This task is responsible to find the mime type of a document accross either its metadata or its content.

<b>Mandatory settings</b>

|Key      | Type    | Description | 
| - | - | - |
 | Mime type retriever | [MimeTypeFinder](../tool/#MimeTypeFinder) | Module to find content mime type | 


<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Dry run | `Boolean` | Process all punnets without editing their state or metadata | `false ` | 
 | Force to identify mime type | `Boolean` | Ask Fast2 to dig deeper into the content to find a mime type. The metadata will be added to the content | `false ` | 
 | Maximum number of page read per content | `Integer` | Only for multi-page content | `Integer.MAX_VALUE ` | 



## SQLMultiQueryTask <small> - Perform SQL statements between database tables and documents in Fast2 </small> {#SQLMultiQueryTask data-toc-label="SQLMultiQueryTask"}

Perform SQL INSERT or UPDATE statements to documents in database, or SELECT from data existing in the database to attach them onto the document dataset.

<b>Mandatory settings</b>

|Key      | Type    | Description | 
| - | - | - |
 | Query caller | SQLQueryColumnCaller | This modules is responsible of establishing the connection between Fast2 and the designated database | 
 | Source attributes | `String/Pattern map` | Key: Desired column for where clause; Value: Source Document data to use for query | 


<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Use PreparedStatements | `Boolean` | Use PreparedStatements instead of plain SQL statements | 
 | Target attributes | `String/Pattern map` | <key, value> set where 'key' refers to the SQL name of the data, and 'value' refers the name of the data in the Fast2 dataset. | 
 | Reset target data | `Boolean` | Clean content when target already exists | `true ` | 
 | SQL column types | `String/String map` | <key, value> where 'key' is the SQL data name, and 'value' is its type. Supported types are : String, float, int, Date. | 
 | SQL query | `String` | Select precisely data you want to extract through a classic SQL query. All retieved values will be attached to the document dataset based on the data listed in the 'Target attributes' configuration section. | 



## SingleCallTask <small> - Call a task only once per campaign </small> {#SingleCallTask data-toc-label="SingleCallTask"}

This task will be useful to perform a given subtask only once in a map execution. You choose to call this subtask at the very begining of the campaign, or at its very end.

<b>Mandatory settings</b>

|Key      | Type    | Description | 
| - | - | - |
 | Subtask | Task | The task to call only once in the campaign execution | 


<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Call at end | `Boolean` | Execute the subtask when the first punnet is processed | `false ` | 
 | Call at begining | `Boolean` | Execute the subtask when the first punnet is processed | `false ` | 



## SleepTask <small> - Wait some time once punnet is processed </small> {#SleepTask data-toc-label="SleepTask"}

Task forcing Fast2 to wait some time before processing the punnet, without updating its state or metadata.



<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Sleep time | `Integer` | In milliseconds | `500 ` | 



