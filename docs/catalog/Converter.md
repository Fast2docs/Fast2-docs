## ArchiveBuilder <small> - Punnet zipper </small> {#ArchiveBuilder data-toc-label="ArchiveBuilder"}

Zip punnets into a zip file. A zip cannot contains a few punnets but documents carried by the punnet can be splitted into multiple zip files.



<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Zip all documents in a single zip file | `Boolean` |  | `false ` | 
 | Zip size limit | `Integer` | In megabytes | 
 | Maximum number of documents per zip | `Integer` |  | 
 | The compression level between 0 and 9 (included) | `Integer` | Use large number for stronger compression | 
 | Also include annotation contents | `Boolean` |  | `false ` | 



## ConvertDoc <small> - Document conversion </small> {#ConvertDoc data-toc-label="ConvertDoc"}

Convert your documents using the ConvertDoc library.



<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Maximum number of document per call | `Integer` |  | `200 ` | 
 | Temp folder to generate PDF to | `String` |  | 
 | Process annotation contents | `Boolean` | If annotations are asked to be migrated, you can filter here to process their content(s) or only their metadata | `false ` | 
 | Scan recursive content | `Boolean` | Only convert terminal contents and not container ones | `false ` | 
 | Excel hack | `Boolean` | Use Microsoft Excel hack | `true ` | 
 | Supported mime-types | `String list` | Specify the list of all mime<br/>-types of documents which Fast2 will convert | 
 | Conversion exception is fatal | `Boolean` | Conversion exception triggers an exception. Othersie, it's a silent fail | `true ` | 
 |  | `Boolean` |  | 
 | Throw conversion exceptions | `Boolean` | If Fast2 performs document conversion, it can either fail silently or pop an error when the action has not been properly completed | `true ` | 
 | Mime-type : Check document before content | `Boolean` | You can assume the file extension is accurate, or ask Fast2 to check the content encoding to identify more precisely the document mime<br/>-type. By default, Fast2 will check at content level | `false ` | 
 | ConvertDoc path | `String` | Path toward ConvertDoc executable | `ConvertDoc.exe ` | 
 | Process all contents | `Boolean` | Fast2 will either only focus on the first encountered content, or process them all | `true ` | 
 | Temp folder to copy source files to | `String` |  | 
 | Convert to PDFA | `Boolean` | Convert your document to PDFA format | `false ` | 



## ConvertINIToXFDF <small> - Annotation converter from INI to XFDF </small> {#ConvertINIToXFDF data-toc-label="ConvertINIToXFDF"}

Convert ViewOne annotations to XML Form Data Format (XFDF). These operations are supported only for PDF and Tiff files. Content dimensions will be fetched to convert these annotations



<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Overload text and postit page to the first one if related exception is thrown | `Boolean` |  | 
 | Postit annotation position | PageRelativePosition | Default position when an exception is thrown | 
 | Skip conversion error | `Boolean` | Do not throw an exception for conversion errors | `false ` | 
 | All note font are black | `Boolean` |  | 
 | Keep converted annotations | `Boolean` | Do not interrupt punnets if at least one annotation has been converted. Punnets carrying annotations that haven't been converted will be flagged with a data named 'ToReplay' | `false ` | 
 | Text annotation position | PageRelativePosition | Default position when an exception is thrown | 



## ConvertISToFDF <small> - Annotation converter from IS to FDF </small> {#ConvertISToFDF data-toc-label="ConvertISToFDF"}

Convert your old IS annoations to Form Data Format (FDF). FDF file are used to represents form data and annotations in a PDF file with key/value format. They usually contain more information than XFDFs



<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Skip conversion error | `Boolean` | Do not throw an exception when a conversion is triggered | `true ` | 
 | FileNet XFDF annotation converter | FileNetXFDFAnnotationConverter |  | 
 | IsAnnotation parser | ParseISAnnotation |  | 
 | FDF annotation adder | FdfAnnotationAdder |  | 



## ConvertISToXFDF <small> - Annotation converter from IS to XFDF </small> {#ConvertISToXFDF data-toc-label="ConvertISToXFDF"}

Convert your old IS annoations to XML Form Data Format (XFDF). XFDF file are used to represents form data and annotations in a PDF file through an XML. They usually contain more information than XFDFs



<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Popup width | `Float` | Sticky note default popup width | `120 ` | 
 | Skip conversion error | `Boolean` | Do not throw an exception when a conversion is triggered | `true ` | 
 | FileNet XFDF annotation converter | FileNetXFDFAnnotationConverter |  | 
 | IsAnnotation parser | ParseISAnnotation |  | 
 | Popup height | `Float` | Sticky note default popup height | `30 ` | 



## ConvertLighterPdf <small> - PDF converter </small> {#ConvertLighterPdf data-toc-label="ConvertLighterPdf"}

This class allows you to compress your PDF files in order to be lighter than original ones.



<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 |  | `Boolean` |  | 
 | Standard DPI | `Integer` | DPI of a standard PDF document | `72 ` | 
 | Process annotation contents | `Boolean` | If annotations are asked to be migrated, you can filter here to process their content(s) or only their metadata | `false ` | 
 | Target image format | `String` |  | `jpg ` | 
 | Scan recursive content | `Boolean` | Only convert terminal contents and not container ones | `false ` | 
 | Skip invalid image conversion | `Boolean` | Skip image conversion if image is invalid / not supported. Keep the original file | `true ` | 
 | Maximum converted image ratio | `Float` | After conversion, compute the size ratio before and after. Do not replace source image when converted image size is larger to this ratio | `1.0 ` | 
 | Supported mime-types | `String list` | Specify the list of all mime<br/>-types of documents which Fast2 will convert | 
 | Larger threshold to convert | `Integer` | Only convert images which are larger than this minimum byte size | `2000 ` | 
 | Throw conversion exceptions | `Boolean` | If Fast2 performs document conversion, it can either fail silently or pop an error when the action has not been properly completed | `true ` | 
 |  | Map |  | 
 | Mime-type : Check document before content | `Boolean` | You can assume the file extension is accurate, or ask Fast2 to check the content encoding to identify more precisely the document mime<br/>-type. By default, Fast2 will check at content level | `false ` | 
 | Maximum ratio to apply | `Float` | Images will not beconverted if the ratio computation is larger to this value | `1.0 ` | 
 | Process all contents | `Boolean` | Fast2 will either only focus on the first encountered content, or process them all | `true ` | 
 | Target DPI | `Integer` | Required target Image dpi | `300 ` | 
 | Target compression quality | `Float` |  | `0.7 ` | 



## ConvertP8ToXFDF <small> - Annotation converter from IS to XFDF </small> {#ConvertP8ToXFDF data-toc-label="ConvertP8ToXFDF"}

Convert your old IS annotations to XML Form Data Format (XFDF). XFDF file are used to represents form data and annotations in a PDF file through an XML. They usually contain more information than XFDFs



<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Create one annotation container per annotation | `Boolean` |  | 
 | Remove stamp annotation border | `Boolean` | Stamp annotation have by default a border set to 1. Set to true will remove the border | 
 | Overwrite border width | `Integer` | Value of border width for proprietary and arrow annotations | 
 | Default page height | `Float` | Default page height used for text and mail document | 
 | Skip conversion error | `Boolean` | Do not throw an exception for conversion errors | `false ` | 
 | Date format | `String` | Date format of your properties stored by annotations <br/> <p> Ex/  2021-10-01T12:04:56.0000765+0200</p> | `yyyy-MM-dd'T'HH:mm:ss.SSSSSSSZ ` | 
 | Default page width | `Float` | Default page width used for text and mail document | 
 | FileNet XFDF annotation converter | FileNetAnnotationConverter |  | 
 | Font size ratio | `Integer` | Multiply the font size value by this ratio | 



## ConvertRipole <small> - Convert ripole files </small> {#ConvertRipole data-toc-label="ConvertRipole"}

Convert ripoles files to PDF format.



<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Temp executable path | `String` |  | `/tmp/temp_ ` | 
 | Ripole executable path | `String` |  | 



## ConvertTalk <small> - Talk converter </small> {#ConvertTalk data-toc-label="ConvertTalk"}

Convert your talk files to PDF using iText Library.



<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Process annotation contents | `Boolean` | If annotations are asked to be migrated, you can filter here to process their content(s) or only their metadata | `false ` | 
 | Scan recursive content | `Boolean` | Only convert terminal contents and not container ones | `false ` | 
 | Maximum input text size | `Long` | Limit in bytes | `1024 * 1024 ` | 
 | Supported mime-types | `String list` | Specify the list of all mime<br/>-types of documents which Fast2 will convert | 
 | Skip PDF creation | `Boolean` | Only perform text parsing | `false ` | 
 | Throw conversion exceptions | `Boolean` | If Fast2 performs document conversion, it can either fail silently or pop an error when the action has not been properly completed | `true ` | 
 | Auto-detect encoding | `Boolean` | Automatically detect the source text encoding used | `true ` | 
 | Mime-type : Check document before content | `Boolean` | You can assume the file extension is accurate, or ask Fast2 to check the content encoding to identify more precisely the document mime<br/>-type. By default, Fast2 will check at content level | `false ` | 
 | Keep talk header | `Boolean` | Do not parse the talk header and keep the original one | `false ` | 
 | Source text encoding | `String` | Encoding used for the source files <br/> <p> Ex/  CP850</p> | 
 | Process all contents | `Boolean` | Fast2 will either only focus on the first encountered content, or process them all | `true ` | 
 | Font description | `String` | Format as {font family} {size} {style} where font family is one of {COURIER, HELVETICA, TIMES_ROMAN, SYMBOL, ZAPFDINGBATS} and style is 0:normal 1:bold 2:italic 4:underline 8:strikethru | 



## ConvertText <small> - Text converter </small> {#ConvertText data-toc-label="ConvertText"}





<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Process annotation contents | `Boolean` | If annotations are asked to be migrated, you can filter here to process their content(s) or only their metadata | `false ` | 
 | Scan recursive content | `Boolean` | Only convert terminal contents and not container ones | `false ` | 
 | Maximum input text size | `Long` | Limit in bytes | `1024 * 1024 ` | 
 | Supported mime-types | `String list` | Specify the list of all mime<br/>-types of documents which Fast2 will convert | 
 | Skip PDF creation | `Boolean` | Only perform text parsing | `false ` | 
 | Throw conversion exceptions | `Boolean` | If Fast2 performs document conversion, it can either fail silently or pop an error when the action has not been properly completed | `true ` | 
 | Auto-detect encoding | `Boolean` | Automatically detect the source text encoding used | `true ` | 
 | Mime-type : Check document before content | `Boolean` | You can assume the file extension is accurate, or ask Fast2 to check the content encoding to identify more precisely the document mime<br/>-type. By default, Fast2 will check at content level | `false ` | 
 | Source text encoding | `String` | Encoding used for the source files <br/> <p> Ex/  CP850</p> | 
 | Process all contents | `Boolean` | Fast2 will either only focus on the first encountered content, or process them all | `true ` | 
 | Font description | `String` | Format as {font family} {size} {style} where font family is one of {COURIER, HELVETICA, TIMES_ROMAN, SYMBOL, ZAPFDINGBATS} and style is 0:normal 1:bold 2:italic 4:underline 8:strikethru | 



## ConvertWangToXFDF <small> - Convert Wang annotations to XFDF </small> {#ConvertWangToXFDF data-toc-label="ConvertWangToXFDF"}





<b>Optional settings</b>

|Key      | Type    | Description | 
| - | - | - |
 | Fail if no annotation was parsed | `Boolean` |  | 
 | Skip annotation parse exceptions | `Boolean` |  | 
 |  | `Integer` |  | 



## ConvertXFDFToP8 <small> - Annotation converter from XFDF to IS </small> {#ConvertXFDFToP8 data-toc-label="ConvertXFDFToP8"}

Convert your XFDF annotations P8 format. This is mostly used to rollback from P8 to XFDF during complex migration.



<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Skip conversion error | `Boolean` | Do not throw an exception when a conversion is triggered | `true ` | 



## DispatchingArchive <small> - Unzip files </small> {#DispatchingArchive data-toc-label="DispatchingArchive"}

This class allow you to unzip the content of archive files. Multiple mime types are supported : application/zip, application/x-zip, application/x-zip-compressed, application/x-rar-compressed, application/x-rar and application/java-archive. Tar or gz folders are not supported yet.



<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Throw conversion exceptions | `Boolean` | If Fast2 performs document conversion, it can either fail silently or pop an error when the action has not been properly completed | `true ` | 
 | Charset | `String` | Charset used for file names in zip archives | `CP437 ` | 
 | Mime-type : Check document before content | `Boolean` | You can assume the file extension is accurate, or ask Fast2 to check the content encoding to identify more precisely the document mime<br/>-type. By default, Fast2 will check at content level | `false ` | 
 | Process annotation contents | `Boolean` | If annotations are asked to be migrated, you can filter here to process their content(s) or only their metadata | `false ` | 
 | Scan recursive content | `Boolean` | Only convert terminal contents and not container ones | `false ` | 
 | Process all contents | `Boolean` | Fast2 will either only focus on the first encountered content, or process them all | `true ` | 
 | Supported mime-types | `String list` | Specify the list of all mime<br/>-types of documents which Fast2 will convert | 
 | Recursive | `Boolean` |  | `false ` | 



## Eml2Pdf <small> - Convert email to PDF </small> {#Eml2Pdf data-toc-label="Eml2Pdf"}

This class allow you to convert emails to a PDF format. Formats supported are application/msword, rfc822 and outlook.



<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | rtf tags list | `String list` | For mapimessageparser, if provided, can allow to override the list of rtf tags to filter out | 
 | Process annotation contents | `Boolean` | If annotations are asked to be migrated, you can filter here to process their content(s) or only their metadata | `false ` | 
 | Scan recursive content | `Boolean` | Only convert terminal contents and not container ones | `false ` | 
 | Custom mail header | `String` | Mail header to prefix the subject of the mail as pdf title in ARender | `Mail ` | 
 | includeInlineBodyWithHeaders | `Boolean` |  | 
 | Convert Configuration | Eml2PdfConfiguration | Mail to pdf convert options. Can be null | 
 | Attachment in separate folder | `Boolean` | All attachments are included in a separated folder | `false ` | 
 | Mail subject in title | `Boolean` | Display mail subject in title | `true ` | 
 | Supported mime-types | `String list` | Specify the list of all mime<br/>-types of documents which Fast2 will convert | 
 | Separator | `String` | Separator between prefix and mail subject | `: ` | 
 | Throw conversion exceptions | `Boolean` | If Fast2 performs document conversion, it can either fail silently or pop an error when the action has not been properly completed | `true ` | 
 | Attachment in included folder | `Boolean` | Each attachment is included in a separated folder | `false ` | 
 | Mime-type : Check document before content | `Boolean` | You can assume the file extension is accurate, or ask Fast2 to check the content encoding to identify more precisely the document mime<br/>-type. By default, Fast2 will check at content level | `false ` | 
 | Custom body header | `String` | Body header to swap the default <br/>-Content<br/>- header set to the body | `Email body ` | 
 | Supported inline body mime-types | `String list` |  | 
 | Process all contents | `Boolean` | Fast2 will either only focus on the first encountered content, or process them all | `true ` | 



## ExcelConvert <small> - Convert Excel to PDF </small> {#ExcelConvert data-toc-label="ExcelConvert"}

This class allow you to convert an Excel file to a PDF format.



<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Throw conversion exceptions | `Boolean` | If Fast2 performs document conversion, it can either fail silently or pop an error when the action has not been properly completed | `true ` | 
 | Mime-type : Check document before content | `Boolean` | You can assume the file extension is accurate, or ask Fast2 to check the content encoding to identify more precisely the document mime<br/>-type. By default, Fast2 will check at content level | `false ` | 
 | Process annotation contents | `Boolean` | If annotations are asked to be migrated, you can filter here to process their content(s) or only their metadata | `false ` | 
 | Scan recursive content | `Boolean` | Only convert terminal contents and not container ones | `false ` | 
 | Process all contents | `Boolean` | Fast2 will either only focus on the first encountered content, or process them all | `true ` | 
 | Supported mime-types | `String list` | Specify the list of all mime<br/>-types of documents which Fast2 will convert | 



## GenericConvertDoc <small> - Convert from URL to PDF from its URL </small> {#GenericConvertDoc data-toc-label="GenericConvertDoc"}

This task will convert the content of any document into PDF format. All Fast2 needs is you to specify the URL/path of the initial document

<b>Mandatory settings</b>

|Key      | Type    | Description | 
| - | - | - |
 | Destination folder | `String` | Target file path for the locally<br/>-created files | 
 | Converter path | `String` | Set here the path of the converter which will be used for the conversion | 


<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Ingore output file | `Boolean` | Converter does not takes output file instructions | `false ` | 
 | Process annotation contents | `Boolean` | If annotations are asked to be migrated, you can filter here to process their content(s) or only their metadata | `false ` | 
 | Ignore command return value | `Boolean` | Do not perform anything after conversion, whatever the command feedback | `false ` | 
 | Scan recursive content | `Boolean` | Only convert terminal contents and not container ones | `false ` | 
 | Destination folder for original files | `String` | Dump input file in a specific folder path. Set to null to disable dumps | 
 | Supported mime-types | `String list` | Specify the list of all mime<br/>-types of documents which Fast2 will convert | 
 | Protect path with double quotes | `Boolean` | Surround file paths with quotes when building command<br/>-line | `false ` | 
 | Timeout before stopping | `Integer` | Time to wait before killing the process. Value is in seconds | `3600 ` | 
 | Throw conversion exceptions | `Boolean` | If Fast2 performs document conversion, it can either fail silently or pop an error when the action has not been properly completed | `true ` | 
 | Mime-type : Check document before content | `Boolean` | You can assume the file extension is accurate, or ask Fast2 to check the content encoding to identify more precisely the document mime<br/>-type. By default, Fast2 will check at content level | `false ` | 
 | Conversion option | `String` | See application help for more details | 
 | List of error exit codes to skip | `String list` |  | 
 | Extension to append | `String` | The extension to add to the original file name before any conversion. This value should not start with a dot (ex : html) | 
 | Process all contents | `Boolean` | Fast2 will either only focus on the first encountered content, or process them all | `true ` | 



## HtmlCleanup <small> - HTML cleaner </small> {#HtmlCleanup data-toc-label="HtmlCleanup"}

Utility Class to cleanup inconsistent HTML



<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Throw conversion exceptions | `Boolean` | If Fast2 performs document conversion, it can either fail silently or pop an error when the action has not been properly completed | `true ` | 
 | Mime-type : Check document before content | `Boolean` | You can assume the file extension is accurate, or ask Fast2 to check the content encoding to identify more precisely the document mime<br/>-type. By default, Fast2 will check at content level | `false ` | 
 | Process annotation contents | `Boolean` | If annotations are asked to be migrated, you can filter here to process their content(s) or only their metadata | `false ` | 
 | Scan recursive content | `Boolean` | Only convert terminal contents and not container ones | `false ` | 
 | Process all contents | `Boolean` | Fast2 will either only focus on the first encountered content, or process them all | `true ` | 
 | Supported mime-types | `String list` | Specify the list of all mime<br/>-types of documents which Fast2 will convert | 



## IdentifyImageFormat <small> - Detect image format using ImageMagick </small> {#IdentifyImageFormat data-toc-label="IdentifyImageFormat"}

Find automatically the image format with ImageMagick in command line. Several properties can be added and the assiociated command line filled int the property pattern field

<b>Mandatory settings</b>

|Key      | Type    | Description | 
| - | - | - |
 | Property map | `String/Pattern map` | List of the porperties to use during the process <br/> <p> Ex/  targetProperty = documentStringGetter</p> | 


<b>Optional settings</b>

|Key      | Type    | Description | 
| - | - | - |
 | identify.exe path | `String` | ImageMagick identify.exe path to use | 



## JaTiffMerger <small> - Merge tiff files </small> {#JaTiffMerger data-toc-label="JaTiffMerger"}

From a tiff content punnet, merges all its subcontent merge together. All content must be in tiff format. If the subcontents are already lower than 2 images, the merge is cancelled.



<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Throw conversion exceptions | `Boolean` | If Fast2 performs document conversion, it can either fail silently or pop an error when the action has not been properly completed | `true ` | 
 | Mime-type : Check document before content | `Boolean` | You can assume the file extension is accurate, or ask Fast2 to check the content encoding to identify more precisely the document mime<br/>-type. By default, Fast2 will check at content level | `false ` | 
 | Process annotation contents | `Boolean` | If annotations are asked to be migrated, you can filter here to process their content(s) or only their metadata | `false ` | 
 | Scan recursive content | `Boolean` | Only convert terminal contents and not container ones | `false ` | 
 | Process all contents | `Boolean` | Fast2 will either only focus on the first encountered content, or process them all | `true ` | 
 | Supported mime-types | `String list` | Specify the list of all mime<br/>-types of documents which Fast2 will convert | 



## MDOWriter <small> - Write punnet description to a MDO-format </small> {#MDOWriter data-toc-label="MDOWriter"}

This task serializes document metadata in an MDO file format with a fixed length.

<b>Mandatory settings</b>

|Key      | Type    | Description | 
| - | - | - |
 | Target file path for (local) files, can be pattern based | `String` |  | 


<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Throw exception on missing mandatory data | `Boolean` | Throw exceptions if mandatories data are missing. Otherwise, silent fail | `false ` | 
 | MDO format specification file path | `String` | CSV configuration file path containing MDO format specification | 
 | End tag of document content | `String` |  | 
 | Skip from specific index | `Integer` | Skip writing documents from this index | `0 ` | 
 | Data name to add dataline into document data | `String` | If null data isn't added in document | 
 | MDO-format with internal content | `Boolean` | Generate MDO<br/>-format document with internal content | `false ` | 
 | Fallback on missing data | `Boolean` | When data is missing in the document being written, try to search it in the first document | `true ` | 
 | Data name containing original text content | `String` | If null text content isn't added to MDO file, internal content only | 



## MergeAllContents <small> - Merge multiple content </small> {#MergeAllContents data-toc-label="MergeAllContents"}

Merge all contents of document from the first depth level. Can be used after Eml2Pdf task to merge header and body.



<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Throw conversion exceptions | `Boolean` | If Fast2 performs document conversion, it can either fail silently or pop an error when the action has not been properly completed | `true ` | 
 | Mime-type : Check document before content | `Boolean` | You can assume the file extension is accurate, or ask Fast2 to check the content encoding to identify more precisely the document mime<br/>-type. By default, Fast2 will check at content level | `false ` | 
 | Process annotation contents | `Boolean` | If annotations are asked to be migrated, you can filter here to process their content(s) or only their metadata | `false ` | 
 | Scan recursive content | `Boolean` | Only convert terminal contents and not container ones | `false ` | 
 | Process all contents | `Boolean` | Fast2 will either only focus on the first encountered content, or process them all | `true ` | 
 | Supported mime-types | `String list` | Specify the list of all mime<br/>-types of documents which Fast2 will convert | 



## MergeAllMails <small> - Merge multiple mails </small> {#MergeAllMails data-toc-label="MergeAllMails"}

Merge mail header and body after a mail conversion



<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Throw conversion exceptions | `Boolean` | If Fast2 performs document conversion, it can either fail silently or pop an error when the action has not been properly completed | `true ` | 
 | Mime-type : Check document before content | `Boolean` | You can assume the file extension is accurate, or ask Fast2 to check the content encoding to identify more precisely the document mime<br/>-type. By default, Fast2 will check at content level | `false ` | 
 | Process annotation contents | `Boolean` | If annotations are asked to be migrated, you can filter here to process their content(s) or only their metadata | `false ` | 
 | Scan recursive content | `Boolean` | Only convert terminal contents and not container ones | `false ` | 
 | Process all contents | `Boolean` | Fast2 will either only focus on the first encountered content, or process them all | `true ` | 
 | Supported mime-types | `String list` | Specify the list of all mime<br/>-types of documents which Fast2 will convert | 



## MergePdfBox <small> - PDF merger </small> {#MergePdfBox data-toc-label="MergePdfBox"}

Merge your tiff files into PDF format using the PDFBox library (v1.2.1).



<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Remove document direct content | `Boolean` | Not referenced from folders (deprecated) | `false ` | 
 | Convert resursive folders | `Boolean` | Folders referencesd by the document are converted recursively (deprecated) | `false ` | 
 | Ignore conversion exceptions | `Boolean` | Each exception during the conversion becomes a silent fail indexed in logs | `false ` | 
 | Supported source mime types | `String list` | List of all accepted mime types | 



## OOConvert <small> - Convert office file to PDF </small> {#OOConvert data-toc-label="OOConvert"}

Complete converter from office file to PDF format using OpenOffice / LibreOffice.

<b>Mandatory settings</b>

|Key      | Type    | Description | 
| - | - | - |
 | Target path of generated file | `String` | Path to use for generated files during the conversion | 


<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Temp folder path | `String` | Path to the temp folder | 
 | Output mime type | `String` | Mime type to set at the end of the conversion | `application/pdf ` | 
 | Delay to despair after an Office operation | `Long` | Delay in milliseconds | `15 * 1000 ` | 
 | Process annotation contents | `Boolean` | If annotations are asked to be migrated, you can filter here to process their content(s) or only their metadata | `false ` | 
 |  | DefaultOfficeManagerConfiguration |  | 
 | Scan recursive content | `Boolean` | Only convert terminal contents and not container ones | `false ` | 
 | Shutdown Office Manager at finishTask) | `Boolean` | At the end of the task force Office Manager to shutdown | `false ` | 
 | Supported mime-types | `String list` | Specify the list of all mime<br/>-types of documents which Fast2 will convert | 
 | Localhost port number | `Integer` |  | `8100 ` | 
 | Throw conversion exceptions | `Boolean` | If Fast2 performs document conversion, it can either fail silently or pop an error when the action has not been properly completed | `true ` | 
 | Mime-type : Check document before content | `Boolean` | You can assume the file extension is accurate, or ask Fast2 to check the content encoding to identify more precisely the document mime<br/>-type. By default, Fast2 will check at content level | `false ` | 
 | Delay to startup Office Manager | `Integer` | Delay in seconds | `0 ` | 
 | Shutdown Office Manager when exiting | `Boolean` | Force Office Manager to shutdown at the end of the workflow | `false ` | 
 | officeHome | `String` |  | 
 | Office Manager as singleton | `Boolean` | Use static singleton OfficeManager to reuse process between two campaigns | `false ` | 
 | Process all contents | `Boolean` | Fast2 will either only focus on the first encountered content, or process them all | `true ` | 
 | Stop cmd for LibreOffice / OpenOffice | `String` | Command to use to force LibreOffice or OpenOffice process to stop | 



## PdfAnnotationRenderer <small> - Renders annotations into a new PDF document </small> {#PdfAnnotationRenderer data-toc-label="PdfAnnotationRenderer"}

Requires itext-5.5.13, xmlworker-5.5.13 and jsoup-1.12.2 libs



<b>Optional settings</b>

|Key      | Type    | Description | 
| - | - | - |
 |  | `Boolean` |  | 
 |  | `Float` |  | 
 |  | `Float` |  | 
 |  | `Float` |  | 
 |  | `String` |  | 
 |  | `Boolean` |  | 
 |  | `Boolean` |  | 
 |  | `Float` |  | 
 |  | `Boolean` |  | 
 |  | `Float` |  | 
 |  | `String` |  | 
 | extraFont | `String/String map` |  | 



## PunnetXSLSerializer <small> - Export punnet metadata using XSL script </small> {#PunnetXSLSerializer data-toc-label="PunnetXSLSerializer"}

Serialize a punnet to any file (CSV, JSON, XML, custom format) using an XSL stylesheet.

<b>Mandatory settings</b>

|Key      | Type    | Description | 
| - | - | - |
 | XSL stylesheet path | `String` | Or you can enter your xsl:stylesheet in the content section | 
 | XSL Stylesheet content | `String` | Enter here your xsl:stylesheet content | 


<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | New document properties | `String/String map` | Specify here at least the `documentId` data. You can use punnet properties to resolve pattern <br/> <p> Ex/  Setting an entry with 'myKey' and 'myValue' will trigger Fast2 to look up for the metadata entitled 'myValue' in the punnet and its document(s). If this data is not found, the value will be set to 'myValue'.</p> | 
 | Append | `Boolean` | Attach output stream of you XSL script as a new document in the punnet. | `false ` | 
 | Replace | `Boolean` | Replace punnet documents by the new produced document (requires Append to be set) | `false ` | 
 | Encoding | `String` | Enter here your script file encoding. | `UTF-8 ` | 



## SanitizeTiff <small> - Tiff cleaner </small> {#SanitizeTiff data-toc-label="SanitizeTiff"}

Converts your tiff files to jpeg format.



<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Out mime type | `String` | The target mime type for your documents | `image/tiff ` | 
 | Out extension | `String` | The extensions to set to your documents | `tiff ` | 
 | Convert path | `String` |  | `convert -quiet ` | 
 | Supported source mime types | `String list` |  | 



## SplitPdfItext <small> - PDF splitter  </small> {#SplitPdfItext data-toc-label="SplitPdfItext"}



<b>Mandatory settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Split definition data name | `String` | Name of the document data for split definition | `splitDefinitions ` | 


<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Throw conversion exceptions | `Boolean` | If Fast2 performs document conversion, it can either fail silently or pop an error when the action has not been properly completed | `true ` | 
 | Mime-type : Check document before content | `Boolean` | You can assume the file extension is accurate, or ask Fast2 to check the content encoding to identify more precisely the document mime<br/>-type. By default, Fast2 will check at content level | `false ` | 
 | Process annotation contents | `Boolean` | If annotations are asked to be migrated, you can filter here to process their content(s) or only their metadata | `false ` | 
 | Scan recursive content | `Boolean` | Only convert terminal contents and not container ones | `false ` | 
 | Process all contents | `Boolean` | Fast2 will either only focus on the first encountered content, or process them all | `true ` | 
 | Supported mime-types | `String list` | Specify the list of all mime<br/>-types of documents which Fast2 will convert | 



## TesseractInvoker <small> - Transform your PDFs to make them searchable using OCR engine </small> {#TesseractInvoker data-toc-label="TesseractInvoker"}

Based on Tesseract solution, this task will parse each page of your images or PDF to extract text and create a new searchable PDF
Be careful if you are doing multi doc or multi content : if names are identicals it will overwrite contents 
(ex\ sample.tiff & sample.gif will both creates sample.pdf. The first doc will overwrote the 2nd one

<b>Mandatory settings</b>

|Key      | Type    | Description | 
| - | - | - |
 | Tesseract path | `String` | Complete path of your local Tesseract instance <br/> <p> Ex/  /usr/share/tesseract-ocr/4.00/tessdata</p> | 
 | Destination folder | `String` | Target file path for the locally<br/>-created files | 


<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Throw conversion exceptions | `Boolean` | If Fast2 performs document conversion, it can either fail silently or pop an error when the action has not been properly completed | `true ` | 
 | Mime-type : Check document before content | `Boolean` | You can assume the file extension is accurate, or ask Fast2 to check the content encoding to identify more precisely the document mime<br/>-type. By default, Fast2 will check at content level | `false ` | 
 | Process annotation contents | `Boolean` | If annotations are asked to be migrated, you can filter here to process their content(s) or only their metadata | `false ` | 
 | Scan recursive content | `Boolean` | Only convert terminal contents and not container ones | `false ` | 
 | Process all contents | `Boolean` | Fast2 will either only focus on the first encountered content, or process them all | `true ` | 
 | Supported mime-types | `String list` | Specify the list of all mime<br/>-types of documents which Fast2 will convert | 



## Text2PDFConverter <small> - Convert Text file to PDF </small> {#Text2PDFConverter data-toc-label="Text2PDFConverter"}

Convert your text files into PDF format.



<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Throw conversion exceptions | `Boolean` | If Fast2 performs document conversion, it can either fail silently or pop an error when the action has not been properly completed | `true ` | 
 | Mime-type : Check document before content | `Boolean` | You can assume the file extension is accurate, or ask Fast2 to check the content encoding to identify more precisely the document mime<br/>-type. By default, Fast2 will check at content level | `false ` | 
 | Process annotation contents | `Boolean` | If annotations are asked to be migrated, you can filter here to process their content(s) or only their metadata | `false ` | 
 | Image path | `String` |  | 
 | Scan recursive content | `Boolean` | Only convert terminal contents and not container ones | `false ` | 
 | Formatted page text provider | FormattedPageTextProvider |  | 
 | Process all contents | `Boolean` | Fast2 will either only focus on the first encountered content, or process them all | `true ` | 
 | Formatted page text converter | FormattedPageTextConverter |  | 
 | Supported mime-types | `String list` | Specify the list of all mime<br/>-types of documents which Fast2 will convert | 



## Tiff2PDFIText <small> - Converter from Tiff to PDF </small> {#Tiff2PDFIText data-toc-label="Tiff2PDFIText"}

This task uses the IText library to convert content of TIFF documents into PDF format



<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Keep image aspect | `Boolean` | Zoom image to fit in an A4 paper, but conserve aspect ratio | `true ` | 
 | Process annotation contents | `Boolean` | If annotations are asked to be migrated, you can filter here to process their content(s) or only their metadata | `false ` | 
 | Scan recursive content | `Boolean` | Only convert terminal contents and not container ones | `false ` | 
 | Adapt PDF size to source image | `Boolean` | Generate a PDF document with a size related to the original image size | `false ` | 
 | Ignore conversion exceptions | `Boolean` | Fast2 will either throw an error if the image has not properly been converted, or fail silently | `false ` | 
 | Supported mime-types | `String list` | Specify the list of all mime<br/>-types of documents which Fast2 will convert | 
 | Verbose logs | `Boolean` | Check this item to have more logs for fine<br/>-tuning stage | `false ` | 
 | imageSourceHeightProperty | `String` |  | 
 | Temp file cleaner | TempFileCleaner | Select here the module you want to clean the temporary files | 
 | Throw conversion exceptions | `Boolean` | If Fast2 performs document conversion, it can either fail silently or pop an error when the action has not been properly completed | `true ` | 
 | Mime-type : Check document before content | `Boolean` | You can assume the file extension is accurate, or ask Fast2 to check the content encoding to identify more precisely the document mime<br/>-type. By default, Fast2 will check at content level | `false ` | 
 | DPI correction | `Boolean` | Check this to correct the DPI related to the image dimensions | `false ` | 
 | Rotate landscapes | `Boolean` | If imge aspect is > 1.4, it will be rotated to fit in a A4 format | `false ` | 
 | Clean temporary files | `Boolean` | Remove the temporary input files. To use this option, a temp file cleaner must be set | `false ` | 
 | Process all contents | `Boolean` | Fast2 will either only focus on the first encountered content, or process them all | `true ` | 
 | imageSourceWidthProperty | `String` |  | 



## Tiff2PdfBox <small> - Convert TIFF to PDF </small> {#Tiff2PdfBox data-toc-label="Tiff2PdfBox"}

This task converts TIFF images into PDF documents using the Apache PDFBox lib



<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Add pdf dimensions to dataSet | `Boolean` | Store dimensions in document dataSet named contentHeight and contentWidth only for the first page | 
 | Force to re-encode tiffs | `Boolean` | Force to decompress and recompress tiffs before encapsulating in PDF, slower but could handle some exceptions | `false ` | 
 | Ignore conversion exceptions | `Boolean` | Fast2 will either throw an error if the image has not properly been converted, or fail silently | `false ` | 
 | Unsupported producers | `String list` | List of unsupported tiff software producers | 
 | Default DPI used for PDF transformation | `Integer` |  | `200 ` | 



## WkHtmlToPdfConverter <small> - Converter from Html To PDF </small> {#WkHtmlToPdfConverter data-toc-label="WkHtmlToPdfConverter"}

This task will be used to convert HTML content into a PDF document. Fast2 embeds the wkhtmltopdf command-line utility in order to carry out this conversion.

<b>Mandatory settings</b>

|Key      | Type    | Description | 
| - | - | - |
 | Destination folder | `String` | Target file path for the locally<br/>-created files | 
 | Converter path | `String` | Set here the path of the converter which will be used for the conversion | 


<b>Optional settings</b>

|Key      | Type    | Description |  Default value |
| - | - | - | - |
 | Ingore output file | `Boolean` | Converter does not takes output file instructions | `false ` | 
 | Process annotation contents | `Boolean` | If annotations are asked to be migrated, you can filter here to process their content(s) or only their metadata | `false ` | 
 | Ignore command return value | `Boolean` | Do not perform anything after conversion, whatever the command feedback | `false ` | 
 | Scan recursive content | `Boolean` | Only convert terminal contents and not container ones | `false ` | 
 | Destination folder for original files | `String` | Dump input file in a specific folder path. Set to null to disable dumps | 
 | Supported mime-types | `String list` | Specify the list of all mime<br/>-types of documents which Fast2 will convert | 
 | Protect path with double quotes | `Boolean` | Surround file paths with quotes when building command<br/>-line | `false ` | 
 | Timeout before stopping | `Integer` | Time to wait before killing the process. Value is in seconds | `3600 ` | 
 | Throw conversion exceptions | `Boolean` | If Fast2 performs document conversion, it can either fail silently or pop an error when the action has not been properly completed | `true ` | 
 | Mime-type : Check document before content | `Boolean` | You can assume the file extension is accurate, or ask Fast2 to check the content encoding to identify more precisely the document mime<br/>-type. By default, Fast2 will check at content level | `false ` | 
 | Conversion option | `String` | See application help for more details | 
 | List of error exit codes to skip | `String list` |  | 
 | Extension to append | `String` | The extension to add to the original file name before any conversion. This value should not start with a dot (ex : html) | 
 | Process all contents | `Boolean` | Fast2 will either only focus on the first encountered content, or process them all | `true ` | 
 | Cleanup HTML first | `Boolean` | Ask Fast2 to clean the HTML content regarding syntax and encoding | `true ` | 



