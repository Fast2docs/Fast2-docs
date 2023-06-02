## AWSSource <small> - Complete extractor module from AWS S3 </small> {#AWSSource data-toc-label="AWSSource"}

This AWS extractor performs from a list of sources the extraction of your document content. Many options (suffix, prefix...) exist to optimally specify the documents you want to take into account

<b>Mandatory settings</b>

|Key      | Type    | Description | 
| - | - | - |
 | AWS connection provider | [AWSConnectionProvider](../Credentials/#AWSConnectionProvider) | Must have AmazonS3FullAccess permission | 
 | Source buckets | `String list` | Buckets where folders are stored | 


<b>Optional settings</b>

|Key      | Type    | Description | 
| - | - | - |
 | AWS start-after key | `String` | Absolute path of S3 object to start after | 
 | ARN key for KMS encryption | `String` |  | 
 | AWS suffix | `String` | S3-object will be extracted if its key has such suffix | 
 | Source folders | `String list` | Folders in the S3 bucket(s) containing the files to migrate | 
 | AWS prefix | `String` | S3-object will be extracted if its key has such prefix | 



## AlfrescoRestSource <small> - Alfresco extractor using Alfresco REST protocol </small> {#AlfrescoRestSource data-toc-label="AlfrescoRestSource"}

This task relies on the Alfresco public REST API (with v1.0.4 of the Alfresco REST client) to retrieve documents and metadata into a given Alfresco instance

<b>Mandatory settings</b>

|Key      | Type    | Description | 
| - | - | - |
 | CMIS query | `String` | Query used to retrieve the objects from Alfresco <br/> <p> Ex/  SELECT * FROM cmis:document WHERE cmis:name LIKE 'test%'</p> | 
 | Alfresco connection provider | [AlfrescoRESTConnectionProvider](../Credentials/#AlfrescoRESTConnectionProvider) |  | 


<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Max item to return per call | `Integer` | Set the paging max items threshold to specify the number of Alfresco objects to retrieve per call. | `100 ` | 
 | Fields to extract | `String` | The less the better ! Only the 'id' is necessary to start the migration workflow. Separate the different values with a comma, no space. Use properties from `com.alfresco.client.api.common.constant.PublicAPIConstant` library. <br/> <p> Ex/  id,name</p> | `id ` | 



## AlfrescoSource <small> - Alfresco extractor using CMIS technology </small> {#AlfrescoSource data-toc-label="AlfrescoSource"}

Through an SQL query, this alfresco extractor will use the CMIS technology to fetch the content, the metadata and the annotations of your documents from a given Alfresco repository

<b>Mandatory settings</b>

|Key      | Type    | Description | 
| - | - | - |
 | SQL query to extract documents | `String` | Fast2 will retrieve all documents, folder, references, items and metadata matching this query. If the query is exhaustively specifying data to extract, uncheck the 'Extract document properties'. The data `cmis:objectId` will be mandatory. <br/> <p> Ex/  SELECT * FROM cmis:document</p> | 
 | Alfresco connection provider  | [AlfrescoCMISConnectionProvider](../Credentials/#AlfrescoCMISConnectionProvider) | CMIS version must be 1.1 | 


<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Property Helper | PropertyHelper |  | 
 | Number of items per result page | `Integer` | Maximum number of results provided | `1 ` | 
 | Extract document properties | `Boolean` |  | `true ` | 
 | Number of documents per punnet | `Integer` |  | `1 ` | 
 | Keep folder structure within document | `Boolean` | requires extractProperties to be true | `true ` | 
 | Extract document content | `Boolean` | Does not work asynchronously | `false ` | 



## BlankSource <small> - Empty punnet generator </small> {#BlankSource data-toc-label="BlankSource"}

This source builds a punnet list containing one or more empty documents. Each document will only contain its identifier : documentId. This punnet can then be enriched by other steps in the processing chain.

<b>Mandatory settings</b>

|Key      | Type    | Description | 
| - | - | - |
 | Document IDs | DocumentIdList | Source list of documents to extract from their IDs | 


<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Document per punnet | `Integer` | Number of documents each punnet punnet must carry on <br/> <p> Ex/  The input file includes 10 lines meaning 10 document identifiers to extract. By setting this value to 2, Fast2 will create 5 punnets, each containing 2 documents</p> | `1 ` | 



## CMODSource <small> - Complete extraction module from a CMOD environment </small> {#CMODSource data-toc-label="CMODSource"}

This task is used to extract documents in the Content-Manager On Demand ECM. One CMOD document is equivalent of 1 punnet of 1 document. Indexes, optional content and annotations will also be extracted. A WAL request is made to find the corresponding documentId in ImageServices. The metadata extraction is then carried out. Relative data are stored in each document of the punnet being processed.Note: All Image Services properties are exported systematically. This task is not a real source task. The documents to be extracted are identified by an BlankSource task generating a set of empty Punnets, i.e. containing only documents each bearing a document number (documentId) to extract.This task relies on the 'libCMOD.dll' library. This library must be in a directory of the Windows PATH. In the wrapper.conf or hmi-wrapper.conf file, activate the use of this library: wrapper.java.library.path. <increment> = ../libCMOD/dll32For the moment, only 32-bit libraries are configured

<b>Mandatory settings</b>

|Key      | Type    | Description | 
| - | - | - |
 | CMOD connection provider | [CMODConnectionProvider](../Credentials/#CMODConnectionProvider) |  | 
 | Folders to extract | `String list` | List of CMOD folders which will be scanned. Additional level(s) of filter can be used with the SQL query down below. | 


<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | SQL query to extract documents | `String` | Enter here the `WHERE` clause used to filter documents. Since this request is made on the indexes of CMOD documents, the property used to filter out the documents need to be indexed in CMOD prior to any extraction. <br/> <p> Ex/  WHERE Date = '2012-11-14'</p> | 
 | Extract document annotations | `Boolean` | The document annotation will be extracted during the process | `false ` | 
 | Number of documents per punnet | `Integer` |  | `1 ` | 
 | Extract document content | `Boolean` | The document content will be extracted during the process | `false ` | 
 | Maximum results count | `Integer` |  | `2000 ` | 



## CMSource <small> - Complete extractor from Content Manager solution </small> {#CMSource data-toc-label="CMSource"}



<b>Mandatory settings</b>

|Key      | Type    | Description | 
| - | - | - |
 | CM connection provider | [CMConnectionProvider](../Credentials/#CMConnectionProvider) |  | 
 | SQL query | `String` | Select precisely documents you want to extract through a classic SQL query | 


<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Extract advanced system properties from DKDDO object | `Boolean` |  | `false ` | 
 | Extract standard system properties | `Boolean` |  | `false ` | 
 | Maximum results returned by the query | `Integer` | Set to 0 to disable limiting number of results | `0 ` | 
 | Extract custom properties | `Boolean` |  | `false ` | 
 | Query type | `Integer` | See com.ibm.mm.beans.CMBBaseConstant for further details. Default value is XPath (7) | `7 ` | 



## CSVSource <small> - CSV file parser </small> {#CSVSource data-toc-label="CSVSource"}

This task can be used to start a migration from a CSV file. By default, the first line of your file is considered as the column headers. Whether the column values are surrounded with double-quotes (`\_`) or not, the CSVSource task will process either way. If you need to force the document ID for the whole process, use the metadata `documentId`.

<b>Mandatory settings</b>

|Key      | Type    | Description | 
| - | - | - |
 | CSV paths | `String list` | List of paths to CSV files to be parsed. Check out the following examples for allowed formats <br/> <p> Ex/  <br />`C:/samples/myDocument.csv`<br />`C:\\samples\\myDocument.csv`<br />`C:\\\\samples\\\\myDocument.csv`<br />`\"C:\\samples\\myDocument.csv\"`<br />`C:/samples/${map}.csv`</p> | 


<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | CSV file path metadata | `String` | Punnet property name containing the CSV file path. Set to empty or null to disable | 
 | File name for error CSV file | `String` | This option might be useful when you need to have a specific file name where to register the lines in error of your CSV file. The name can both be linked to some workflow properties surrounded with `${...}` (ex/ campaign, punnetId, etc) or hard-written. Warning: This value can be overwritten by the _Associate CSV-error file with original CSV filename_ option | `lines_in_error.csv ` | 
 | New column names to set | `String list` | If empty, populated from first line | 
 | Folder path for error CSV file | `String` | The error file will be stored in your system. You can choose where by configuring this very field. Here as well you can set the path either with workflow properties (`${...}`) or hard-write it | `./csv_errors/ ` | 
 | Number of lines to skip | `Integer` | This option helps to skip lines, meaning their data will not be processed. By default, only the 1st line is skipped considering it surely consists in the headers row <br/> <p> Ex/  In a file of 10 lines, putting '3' in the input field will skip the 1st, 2nd and 3rd lines</p> | `1 ` | 
 | Generate hash of CSV content | `Boolean` | The hash of the content will be generated and stored in the punnet among a property named hashData | `false ` | 
 | Continue on fail | `Boolean` | If enabled, the following errors will not trigger an exception: <br />- CSV file does not exist <br />- CSV file is empty (no line) <br />- CSV file has only headers and no line for documents.<br /><br />Note that if you give 5 CSV paths and the number 3rd is in error, only the Fast2 logs will provide information regarding the failing CSV file. | 
 | Column headers in first CSV file only | `Boolean` | Only read column definitions from the first parsed CSV file | `false ` | 
 | File encoding | `String` | CSV encoding character set | `UTF-8 ` | 
 | CSV separator | `String` | Only the first character will be considered | `; ` | 
 | Associate CSV-errors file with original CSV filename | `Boolean` | This checkbox allows you to match your error file with your original CSV file, just suffixing the original name with '_KO'. That way, if you use multiple files, all the lines in error will be grouped by file name. Using this option overwrite the *File name for error CSV file*, but still can be used in addition of the *Folder path for error CSV file* | `false ` | 
 | Stop at first error in CSV | `Boolean` | Fast2 will automatically be stopped at the first error encountered in the CSV | `false ` | 
 | File scanner (Deprecated) | FileScanner | *THIS OPTIONS IS DEPRECATED*, consider using the 'CSV paths' instead. | 
 | Column of document ID | `String` | Column header of the metadata to set as the document ID | `documentId ` | 
 | Document property name containing CSV file path | `String` | Set to empty or null to disable | 
 | Move to path when finished | `String` | Consider using ${variable} syntax | 
 | Document per punnet | `Integer` | Number of documents each punnet punnet will carry <br/> <p> Ex/  By setting this value to 2, each punnet created will contained 2 documents</p> | `1 ` | 
 | Extra columns | `String list` | List of the form target=function:arg1:arg2:... | 



## DctmSource <small> - Complete extractor from Documentum </small> {#DctmSource data-toc-label="DctmSource"}

This connector will extract basic information from the source Documentum repository. Since Documentum architecture involves particular port and access management, a worker should be started on the same server where Documentum is running.<br/><br/>Make sure to check the basic requirements at <a href=_https://www.fast2.tech/documentation/setup-with-environment/documentum/_>the setup for Documentum</a> on the official Fast2 documentation.

<b>Mandatory settings</b>

|Key      | Type    | Description | 
| - | - | - |
 | Connexion information to Documentum Repository | [DctmConnectionProvider](../Credentials/#DctmConnectionProvider) |  | 
 | The DQL Query to run to fetch documents | `String` | The less attributes you fetch, the faster the query will be executed on the Documentum side. <br/> <p> Ex/  `SELECT r_object_id FROM dm_document WHERE ...`</p> | 


<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Batch size | `Integer` | If size is <1, the size will be defined from the Documentum server-side. | `50 ` | 



## FileNet35Source <small> - Complete extractor from FileNet 3.5 </small> {#FileNet35Source data-toc-label="FileNet35Source"}

The FileNet35Source retrieves existing documents from the FileNet P8 3.5 ECM through a query. This punnet will contain the metadata of the recovered document, its content and annotations

<b>Mandatory settings</b>

|Key      | Type    | Description | 
| - | - | - |
 | FileNet 3.5 connection provider | [FileNet35ConnectionProvider](../Credentials/#FileNet35ConnectionProvider) | Connection parameters to the FileNet instance | 
 | SQL query | `String` | SQL query corresponding to the list of documents to extract | 


<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Attribute used for Document IDs | `String` | Name of the FileNet P8 3.5 attribute corresponding to the values ​​retrieved in the Document IDs list | `Id ` | 
 | Empty punnet when no result | `Boolean` | An empty punnet will be created even if the result of the query is null | `false ` | 
 | Documents per punnet | `Integer` | Number of documents each punnet punnet must carry on <br/> <p> Ex/  By setting this value to 2, each punnet created will contained 2 documents</p> | `1 ` | 
 | Document IDs | DocumentIdList | Source list of documents to extract from their IDs | 



## FileNetSource <small> - Complete extractor from FileNet P8 </small> {#FileNetSource data-toc-label="FileNetSource"}

The FileNetSource source retrieves existing documents from the FileNet P8 5.x ECM through an SQL query. This punnet will contain the metadata of the recovered document, security information and parent folders.

<b>Mandatory settings</b>

|Key      | Type    | Description | 
| - | - | - |
 | Object store name | `String list` | Name of the repository to extract from | 
 | SQL query | `String` | SQL query corresponding to the list of documents to extract | 
 | FileNet connection provider | [FileNetConnectionProvider](../Credentials/#FileNetConnectionProvider) | Connection parameters to the FileNet instance | 


<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Documents per punnet | `Integer` | Number of documents each punnet punnet must carry on <br/> <p> Ex/  By setting this value to 2, each punnet created will contained 2 documents</p> | `1 ` | 
 | Number of entries per result page | `Integer` | Number of results returned per page by the FileNet P8 query | `1000 ` | 
 | Extract object type properties | `Boolean` | The FileNet P8 metadata of the document which are Object type will be saved at the punnet level | `false ` | 
 | Extract FileNet system properties | `Boolean` | System metadata during extraction is saved at the punnet level | `false ` | 
 | Properties to extract | `String list` | Exhaustive list of FileNet metadata to extract. If empty, all properties will be extracted. | 
 | Extract documents instance informations | `Boolean` | The fetchInstance method makes a round trip to the server to retrieve the property values of the ObjectStore object | `false ` | 
 | Extract FileNet security | `Boolean` | The security of the document will be saved at the punnet level | `false ` | 
 | Extract folders absolute path | `Boolean` | The absolute path of the folder inside the FileNet instance will be extracted during the process | `false ` | 
 | Throw error if no result | `Boolean` | Throw exception when SQL Query finds no result. | 



## LocalSource <small> - A generic broker for wildcarded punnet lists </small> {#LocalSource data-toc-label="LocalSource"}

This class will search for local files to analyze them from a defined path

<b>Mandatory settings</b>

|Key      | Type    | Description | 
| - | - | - |
 | File scanner | FileScanner | Recovers your files | 


<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Fallback XML/Json parsing | `Boolean` | If true, the file will be added as document content in the punnet when XML parsing fails. Consider adding this file as a regular file (not an XML) | `false ` | 
 | Skip parse exceptions | `Boolean` | The task does not throw an error when XML parsing fails. Do not stop parsing and resume to next candidate | `false ` | 
 | XSL Stylesheet path | `String` | The XSL stylesheet file to use when parsing XML files | 
 | Number of files per punnet | `Integer` | If the files are not in XML format, the punnet will contain as many documents as defined in this option | `1 ` | 
 | Allow any kind of file | `Boolean` | All types of files can be added. Otherwise, only XML-based Punnet descriptions are allowed | `true ` | 
 | Skip XML parsing | `Boolean` | The XML file will not be parsed before being added to the punnet. Not recommended in most cases | `false ` | 
 | Maximum number of files scanned | `Integer` | If this field is completed, the number of files scanned will not exceed the value filled in. Leave empty to retrieve all files matching input pattern filter | ` ` | 



## MailSource <small> - Complete extractor from mail box </small> {#MailSource data-toc-label="MailSource"}

The MailSource task extracts messages from an e-mail box. Each extracted message will correspond to a punnet, one document per punnet

<b>Mandatory settings</b>

|Key      | Type    | Description | 
| - | - | - |
 | MailBox connection provider | [MailBoxProvider](../Credentials/#MailBoxProvider) |  | 


<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Search in Headers | `String` | Enter a pair of header and pattern to search separated by a colon `:`. <br/> <p> Ex/  cc:copy</p> | 
 | Header names | `String list` | List of header names (case-sensitive) to retrieve from the mail. Message-Id, Subject, From, To, Cc and Date are added by default | 
 | Start Id | `Integer` | Index from which the first message should be extracted | `1 ` | 
 | Update document with mail root folder name | `String` | Name of the metadata to add to the document. If filled, the full name of the source folder is indexed in this metadata. Set to null or empty to disable updating | 
 | Folders to scan | `String list` | List of files to scan in the mailbox. If filled, override root folder name from MailBox connection provider configuration | 
 | AND condition for search | `Boolean` | Checking this options will only retrieve messages matching all search conditions possible (unread messages, text in header, body or subject). If unchecked, the 'OR' operand will be applied. | 
 | Forbidden characters | `String` | List of characters to remove from Message-Id when building the DocumentId | `<>:\"/\\|?* ` | 
 | Only unread messages | `Boolean` |  | 
 | Search in Subject | `String` |  | 
 | Search in Body | `String` |  | 



## RandomSource <small> - Random punnet generator </small> {#RandomSource data-toc-label="RandomSource"}

Randomly produces punnets containing documents, metadata, content...

<b>Mandatory settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Number of punnet to generate | `Integer` | If 'minimum punnet number' is set, this value here will be considered as the higher threshold | `1000 ` | 


<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Maximum document number | `Integer` | Excluded | `1 ` | 
 | Minimum content number | `Integer` | Included | 
 | Minimum metadata number | `Integer` | Included | `1 ` | 
 | Minimum punnet number | `Integer` | If not set, the number of generated punnets will be exactly the number set at 'Number of punnets to generate' | 
 | Maximum number of metadata values | `Integer` | Included | `6000 ` | 
 | Minimum number of metadata values | `Integer` | Included | `0 ` | 
 | Maximum content number | `Integer` | Excluded | 
 | Maximum metadata number | `Integer` | Excluded | `10 ` | 
 | Minimum document number | `Integer` | Included | `1 ` | 



## SQLSource <small> - Complete extractor from SQL database </small> {#SQLSource data-toc-label="SQLSource"}

Extract and map to punnet or document layout specified properties

<b>Mandatory settings</b>

|Key      | Type    | Description | 
| - | - | - |
 | SQL connection provider | [SQLQueryGenericCaller](../Credentials/#SQLQueryGenericCaller) |  | 
 | SQL query | `String` | Select precisely documents you want to extract through a classic SQL query | 


<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Property name to group by document | `String` | Column used to group lines by document. If used set an 'ORDER BY' in your sql query | 
 | SQL mapping for punnet | `String/String map` | Mapping of SQL properties to punnet metadata. Use 'punnetId' for Punnet Id | 
 | Allow duplicates data | `Boolean` |  | 
 | Property name to group by punnet | `String` | Column used to group lines by punnet. If used set an 'ORDER BY' in your sql query | 
 | SQL mapping for document | `String/String map` | Mapping of SQL properties to document metadata. Use 'documentId' for Document Id, otherwise the first column will be used as documentId | 
 | Push remaining, non-mapped columns as document properties | `Boolean` |  | `true ` | 



## ZipSource <small> -  </small> {#ZipSource data-toc-label="ZipSource"}






