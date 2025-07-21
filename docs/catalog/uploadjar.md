# Importing or Replacing JAR Files from the Fast2 UI (available from v2025.2.0)

## Overview

This feature allows you to import new JAR libraries or replace existing ones directly from the Fast2 user interface, without manual server intervention. The relevant workers are automatically restarted to apply the changes. **Note:** Due to server isolation, only embedded workers can be updated this way.

## User Scenarios

### 1. Uploading a Valid JAR

**Note:** You must be authenticated as ADMIN or SUPER ADMIN to upload a JAR.
  - Go to Servers Place → LIBRARIES tab
![Upload JAR](../assets/img/catalog/serversPlace.png){ width="100%" }
  - Click on `Import jar` top right button → Select a JAR that does not exist in `/worker-libs` → Either Cancel or Import the JAR
![Import JAR](../assets/img/catalog/importJar.png){ width="100%" }
  - Workers on the same server as the broker are restarted
  - The JAR is added to `/worker-libs`
  - Restarting worker and successfully added jar messages are displayed

### 2. Replacing an Existing JAR

**Note:** You must be authenticated as ADMIN or SUPER ADMIN to replace an existing JAR.
  - Navigate to Servers Place as in step 1 above
  - Select a JAR already present (different version) 
  - Workers are restarted
  - The old JAR is moved to `/worker-libs/versions` and renamed with `.old`
  - The new JAR is added `/worker-libs`
  - Restarting worker and successfully added jar messages are displayed

## Good things to know

  - If one or more campaigns are running, they are stopped before upload
  - Attempt to upload a non-.jar file will result in an error message

Keep in mind that to perform any operation, ensure you are logged in with the appropriate role (ADMIN or SUPER ADMIN) and use valid JAR files. Version management and campaign protection ensure Fast2 remains stable and available during library updates.
