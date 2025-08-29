# API documentation

Welcome to the **Fast2 API documentation**.  
This section provides a complete reference for interacting programmatically with Fast2 using its RESTful web services.

The API allows you to:

- Trigger and monitor migrations
- Manage configurations, workers, and migration jobs
- Query results and punnets data
- And many more...

All endpoints are documented with:

- Path and query parameters
- Request and response schemas
- Example calls in **cURL**

Before using the API, make sure you have:

- A valid authentication token (see [Authentication](#authentication))
- Network access to the Fast2 server

**Base URL:** `http://localhost:1789`

## Authentication

- **Bearer JWT** via `Authorization: Bearer <token>` (Bearer Token)

> All examples include cURL requests. Replace placeholders with real values.

## Tags

- **Catalog API** — Endpoint to retrieve catalog tasks
- **Job API** — Endpoint for managing jobs
- **Worker API** — API for managing workers
- **User API** — Endpoint for managing users
- **Shared Objects API** — Endpoint for managing shared objects
- **Email API** — Endpoint for managing emails
- **Map API** — Endpoint for managing maps
- **Queue API** — Endpoint for managing queues
- **Punnet API** — Endpoint to retrieve punnets
- **Broker API** — Endpoint for broker-worker communication
- **Campaign API** — Endpoint for managing campaigns
- **Authentication API** — Endpoint for managing authentications

---

## Authentication API

Endpoint for managing authentications

### changePassword

`POST /auth/change-password`

**Request Body**

- `application/json` — ChangePasswordRequest

**Responses**

| Status | Content-Type | Schema | Description |
| -----: | ------------ | ------ | ----------- |
|    200 | _/_          | object | OK          |

**Examples**

```bash
curl -X POST 'http://localhost:1789/auth/change-password' \
  -H 'Authorization: Bearer <token>'
  -H 'Content-Type: application/json'
  -d '{
  "/*": "TODO: replace with ChangePasswordRequest */"
}'
```

### isAuthenticated

`GET /auth/is-authenticated`

**Responses**

| Status | Content-Type | Schema  | Description |
| -----: | ------------ | ------- | ----------- |
|    200 | _/_          | boolean | OK          |

**Examples**

```bash
curl -X GET 'http://localhost:1789/auth/is-authenticated' \
  -H 'Authorization: Bearer <token>'
```

### getLockTimeDuration

`GET /auth/lock-time-duration`

**Responses**

| Status | Content-Type | Schema         | Description |
| -----: | ------------ | -------------- | ----------- |
|    200 | _/_          | integer(int32) | OK          |

**Examples**

```bash
curl -X GET 'http://localhost:1789/auth/lock-time-duration' \
  -H 'Authorization: Bearer <token>'
```

### authenticate

`POST /auth/login`

**Request Body**

- `application/json` — AuthenticationRequest

**Responses**

| Status | Content-Type | Schema | Description |
| -----: | ------------ | ------ | ----------- |
|    200 | _/_          | object | OK          |

**Examples**

```bash
curl -X POST 'http://localhost:1789/auth/login' \
  -H 'Authorization: Bearer <token>'
  -H 'Content-Type: application/json'
  -d '{
  "/*": "TODO: replace with AuthenticationRequest */"
}'
```

### getMaxFailedAttempts

`GET /auth/max-failed-attempts`

**Responses**

| Status | Content-Type | Schema         | Description |
| -----: | ------------ | -------------- | ----------- |
|    200 | _/_          | integer(int32) | OK          |

**Examples**

```bash
curl -X GET 'http://localhost:1789/auth/max-failed-attempts' \
  -H 'Authorization: Bearer <token>'
```

### getPublicKey

`GET /auth/public-key`

**Responses**

| Status | Content-Type | Schema | Description |
| -----: | ------------ | ------ | ----------- |
|    200 | _/_          | string | OK          |

**Examples**

```bash
curl -X GET 'http://localhost:1789/auth/public-key' \
  -H 'Authorization: Bearer <token>'
```

### refreshToken

`POST /auth/refresh-token`

**Responses**

| Status | Content-Type | Schema                 | Description |
| -----: | ------------ | ---------------------- | ----------- |
|    200 | _/_          | AuthenticationResponse | OK          |

**Examples**

```bash
curl -X POST 'http://localhost:1789/auth/refresh-token' \
  -H 'Authorization: Bearer <token>'
```

### getRemainingAttempts

`GET /auth/remaining-attempts`

**Parameters**

| Name    | In    | Required | Type   | Example | Description |
| ------- | ----- | :------: | ------ | ------- | ----------- |
| `email` | query |   yes    | string |         |             |

**Responses**

| Status | Content-Type | Schema         | Description |
| -----: | ------------ | -------------- | ----------- |
|    200 | _/_          | integer(int32) | OK          |

**Examples**

```bash
curl -X GET 'http://localhost:1789/auth/remaining-attempts?email=value' \
  -H 'Authorization: Bearer <token>'
```

### getRemainingLockTime

`GET /auth/remaining-lock-time`

**Parameters**

| Name    | In    | Required | Type   | Example | Description |
| ------- | ----- | :------: | ------ | ------- | ----------- |
| `email` | query |   yes    | string |         |             |

**Responses**

| Status | Content-Type | Schema         | Description |
| -----: | ------------ | -------------- | ----------- |
|    200 | _/_          | integer(int64) | OK          |

**Examples**

```bash
curl -X GET 'http://localhost:1789/auth/remaining-lock-time?email=value' \
  -H 'Authorization: Bearer <token>'
```

### resetPassword

`POST /auth/reset-password`

**Request Body**

- `application/json` — ResetPasswordRequest

**Responses**

| Status | Content-Type | Schema | Description |
| -----: | ------------ | ------ | ----------- |
|    200 | _/_          | object | OK          |

**Examples**

```bash
curl -X POST 'http://localhost:1789/auth/reset-password' \
  -H 'Authorization: Bearer <token>'
  -H 'Content-Type: application/json'
  -d '{
  "/*": "TODO: replace with ResetPasswordRequest */"
}'
```

---

## Broker API

Endpoint for broker-worker communication

### Download any content set in broker files directory

`DELETE /broker/contents`

**Parameters**

| Name   | In    | Required | Type   | Example | Description |
| ------ | ----- | :------: | ------ | ------- | ----------- |
| `path` | query |   yes    | string |         |             |

**Responses**

| Status | Content-Type | Schema | Description |
| -----: | ------------ | ------ | ----------- |
|    200 | —            | —      | OK          |

**Examples**

```bash
curl -X DELETE 'http://localhost:1789/broker/contents?path=value' \
  -H 'Authorization: Bearer <token>'
```

### Download any content set in broker files directory

`GET /broker/contents`

**Parameters**

| Name   | In    | Required | Type   | Example | Description |
| ------ | ----- | :------: | ------ | ------- | ----------- |
| `path` | query |   yes    | string |         |             |

**Responses**

| Status | Content-Type     | Schema         | Description |
| -----: | ---------------- | -------------- | ----------- |
|    200 | application/json | string(binary) | OK          |

**Examples**

```bash
curl -X GET 'http://localhost:1789/broker/contents?path=value' \
  -H 'Authorization: Bearer <token>'
```

### Download logs produced by the broker

`GET /broker/download-broker-logs`

**Responses**

| Status | Content-Type     | Schema              | Description |
| -----: | ---------------- | ------------------- | ----------- |
|    200 | application/json | array[string(byte)] | OK          |

**Examples**

```bash
curl -X GET 'http://localhost:1789/broker/download-broker-logs' \
  -H 'Authorization: Bearer <token>'
```

---

## Campaign API

Endpoint for managing campaigns

### Delete campaigns by names

`DELETE /campaigns/delete-by-names`

Deletes campaigns that match the list of specified campaign names and map version. Returns a multi-status response indicating the success or failure of deleting each campaign

**Parameters**

| Name                | In    | Required | Type            | Example                                  | Description                               |
| ------------------- | ----- | :------: | --------------- | ---------------------------------------- | ----------------------------------------- |
| `campaigns`         | query |   yes    | array[Campaign] | `['DefaultMap_Run1', 'DefaultMap_Run3']` | Campaign names to retrieve                |
| `mapVersionSerieId` | query |    no    | string          | `1`                                      | Map version series id to filter campaigns |

**Responses**

| Status | Content-Type     | Schema             | Description                       |
| -----: | ---------------- | ------------------ | --------------------------------- |
|    207 | application/json | MultiStatusContent | Server failed to delete campaigns |
|    200 | application/json | MultiStatusContent | Successfully deleted campaigns    |
|    400 | —                | —                  | Invalid request parameters        |

**Examples**

```bash
curl -X DELETE 'http://localhost:1789/campaigns/delete-by-names?campaigns=['DefaultMap_Run1', 'DefaultMap_Run3']&mapVersionSerieId=1' \
  -H 'Authorization: Bearer <token>'
```

### Delete campaigns by pattern

`DELETE /campaigns/delete-by-pattern`

Deletes campaigns that match the specified name pattern and map version. If no name pattern is provided, all campaigns will be selected. Returns a multi-status response indicating the success or failure of deleting each campaign

**Parameters**

| Name                | In    | Required | Type   | Example        | Description                               |
| ------------------- | ----- | :------: | ------ | -------------- | ----------------------------------------- |
| `namePattern`       | query |    no    | string | `DefaultMap_*` | Pattern to filter campaign names          |
| `mapVersionSerieId` | query |    no    | string | `1`            | Map version series id to filter campaigns |

**Responses**

| Status | Content-Type     | Schema             | Description                       |
| -----: | ---------------- | ------------------ | --------------------------------- |
|    207 | application/json | MultiStatusContent | Server failed to delete campaigns |
|    200 | application/json | MultiStatusContent | Successfully deleted campaigns    |
|    400 | —                | —                  | Invalid request parameters        |

**Examples**

```bash
curl -X DELETE 'http://localhost:1789/campaigns/delete-by-pattern?namePattern=DefaultMap_*&mapVersionSerieId=1' \
  -H 'Authorization: Bearer <token>'
```

### Download campaign exceptions

`GET /campaigns/download-exceptions`

Downloads all exceptions thrown during a specific campaign

**Parameters**

| Name        | In    | Required | Type          | Example | Description |
| ----------- | ----- | :------: | ------------- | ------- | ----------- |
| `campaigns` | query |   yes    | array[string] |         |             |
| `mapIds`    | query |   yes    | array[string] |         |             |

**Responses**

| Status | Content-Type | Schema | Description                          |
| -----: | ------------ | ------ | ------------------------------------ |
|    200 | —            | —      | Successfully downloaded exceptions   |
|    500 | —            | —      | Server failed to download exceptions |
|    400 | —            | —      | Invalid request parameters           |

**Examples**

```bash
curl -X GET 'http://localhost:1789/campaigns/download-exceptions?campaigns=value&mapIds=value' \
  -H 'Authorization: Bearer <token>'
```

### Get campaigns dto information by names

`GET /campaigns/dto/search-by-names`

Retrieves campaigns that match the list of specified campaign names, map version and map id

**Parameters**

| Name                | In    | Required | Type            | Example                                                               | Description                               |
| ------------------- | ----- | :------: | --------------- | --------------------------------------------------------------------- | ----------------------------------------- |
| `campaigns`         | query |   yes    | array[Campaign] | `['DefaultMap_Run1', 'DefaultMap_Run3']`                              | Campaign names to retrieve                |
| `mapVersionSerieId` | query |    no    | string          | `1`                                                                   | Map version series id to filter campaigns |
| `mapId`             | query |    no    | string          | `2ed1ac12-9406-466d-814a-d9d63c5850e3`                                | Map id to filter campaigns                |
| `paginateParams`    | query |   yes    | PaginateParams  | `{'from': 1, 'size': 20, 'orderBy': 'campaign', 'ascending': 'true'}` | Pagination parameters                     |

**Responses**

| Status | Content-Type     | Schema            | Description                      |
| -----: | ---------------- | ----------------- | -------------------------------- |
|    500 | —                | —                 | Failed to retrieve campaigns     |
|    200 | application/json | PaginateEntityDto | Successfully retrieved campaigns |
|    400 | —                | —                 | Invalid request parameters       |

**Examples**

```bash
curl -X GET 'http://localhost:1789/campaigns/dto/search-by-names?campaigns=['DefaultMap_Run1', 'DefaultMap_Run3']&mapVersionSerieId=1&mapId=2ed1ac12-9406-466d-814a-d9d63c5850e3&paginateParams={'from': 1, 'size': 20, 'orderBy': 'campaign', 'ascending': 'true'}' \
  -H 'Authorization: Bearer <token>'
```

### Get campaigns dto information by pattern

`GET /campaigns/dto/search-by-pattern`

Retrieves a list of campaigns dto that match the specified name pattern, map version and map id. If no name pattern is provided, all campaigns will be selected

**Parameters**

| Name                | In    | Required | Type           | Example                                                               | Description                               |
| ------------------- | ----- | :------: | -------------- | --------------------------------------------------------------------- | ----------------------------------------- |
| `namePattern`       | query |    no    | string         | `DefaultMap_*`                                                        | Pattern to filter campaign names          |
| `mapVersionSerieId` | query |    no    | string         | `1`                                                                   | Map version series id to filter campaigns |
| `mapId`             | query |    no    | string         | `2ed1ac12-9406-466d-814a-d9d63c5850e3`                                | Map id to filter campaigns                |
| `status`            | query |    no    | string         | `Started`                                                             | Campaign status to filter campaigns       |
| `paginateParams`    | query |   yes    | PaginateParams | `{'from': 1, 'size': 20, 'orderBy': 'campaign', 'ascending': 'true'}` | Pagination parameters                     |

**Responses**

| Status | Content-Type     | Schema            | Description                         |
| -----: | ---------------- | ----------------- | ----------------------------------- |
|    500 | —                | —                 | Server failed to retrieve campaigns |
|    200 | application/json | PaginateEntityDto | Successfully retrieved campaigns    |
|    400 | —                | —                 | Invalid request parameters          |

**Examples**

```bash
curl -X GET 'http://localhost:1789/campaigns/dto/search-by-pattern?namePattern=DefaultMap_*&mapVersionSerieId=1&mapId=2ed1ac12-9406-466d-814a-d9d63c5850e3&status=Started&paginateParams={'from': 1, 'size': 20, 'orderBy': 'campaign', 'ascending': 'true'}' \
  -H 'Authorization: Bearer <token>'
```

### Get campaign dto information

`GET /campaigns/dto/{campaign}`

Retrieves a campaign dto from its name

**Parameters**

| Name       | In   | Required | Type     | Example           | Description               |
| ---------- | ---- | :------: | -------- | ----------------- | ------------------------- |
| `campaign` | path |   yes    | Campaign | `DefaultMap_Run1` | Campaign name to retrieve |

**Responses**

| Status | Content-Type     | Schema      | Description                        |
| -----: | ---------------- | ----------- | ---------------------------------- |
|    200 | application/json | CampaignDto | Successfully retrieved campaign    |
|    400 | —                | —           | Invalid request parameters         |
|    404 | —                | —           | Campaign not found                 |
|    500 | —                | —           | Server failed to retrieve campaign |

**Examples**

```bash
curl -X GET 'http://localhost:1789/campaigns/dto/DefaultMap_Run1' \
  -H 'Authorization: Bearer <token>'
```

### Get campaigns information by name

`GET /campaigns/search-by-names`

Retrieves campaigns that match the list of specified campaign names, map version and map id

**Parameters**

| Name                | In    | Required | Type            | Example                                                               | Description                               |
| ------------------- | ----- | :------: | --------------- | --------------------------------------------------------------------- | ----------------------------------------- |
| `campaigns`         | query |   yes    | array[Campaign] | `['DefaultMap_Run1', 'DefaultMap_Run3']`                              | Campaign names to stop                    |
| `mapVersionSerieId` | query |    no    | string          | `1`                                                                   | Map version series id to filter campaigns |
| `mapId`             | query |    no    | string          | `2ed1ac12-9406-466d-814a-d9d63c5850e3`                                | Map id to filter campaigns                |
| `paginateParams`    | query |   yes    | PaginateParams  | `{'from': 1, 'size': 20, 'orderBy': 'campaign', 'ascending': 'true'}` | Pagination parameters                     |

**Responses**

| Status | Content-Type     | Schema            | Description                         |
| -----: | ---------------- | ----------------- | ----------------------------------- |
|    200 | application/json | PaginateEntityDto | Successfully retrieved campaigns    |
|    500 | —                | —                 | Server failed to retrieve campaigns |
|    400 | —                | —                 | Invalid request parameters          |

**Examples**

```bash
curl -X GET 'http://localhost:1789/campaigns/search-by-names?campaigns=['DefaultMap_Run1', 'DefaultMap_Run3']&mapVersionSerieId=1&mapId=2ed1ac12-9406-466d-814a-d9d63c5850e3&paginateParams={'from': 1, 'size': 20, 'orderBy': 'campaign', 'ascending': 'true'}' \
  -H 'Authorization: Bearer <token>'
```

### Get campaigns information by pattern

`GET /campaigns/search-by-pattern`

Retrieves campaigns that match the specified name pattern, map version and map id. If no name pattern is provided, all campaigns will be selected

**Parameters**

| Name                | In    | Required | Type           | Example                                                               | Description                               |
| ------------------- | ----- | :------: | -------------- | --------------------------------------------------------------------- | ----------------------------------------- |
| `namePattern`       | query |    no    | string         | `DefaultMap_*`                                                        | Pattern to filter campaign names          |
| `mapVersionSerieId` | query |    no    | string         | `1`                                                                   | Map version series id to filter campaigns |
| `mapId`             | query |    no    | string         | `2ed1ac12-9406-466d-814a-d9d63c5850e3`                                | Map id to filter campaigns                |
| `paginateParams`    | query |   yes    | PaginateParams | `{'from': 1, 'size': 20, 'orderBy': 'campaign', 'ascending': 'true'}` | Pagination parameters                     |

**Responses**

| Status | Content-Type     | Schema            | Description                         |
| -----: | ---------------- | ----------------- | ----------------------------------- |
|    200 | application/json | PaginateEntityDto | Successfully retrieved campaigns    |
|    500 | —                | —                 | Server failed to retrieve campaigns |
|    400 | —                | —                 | Invalid request parameters          |

**Examples**

```bash
curl -X GET 'http://localhost:1789/campaigns/search-by-pattern?namePattern=DefaultMap_*&mapVersionSerieId=1&mapId=2ed1ac12-9406-466d-814a-d9d63c5850e3&paginateParams={'from': 1, 'size': 20, 'orderBy': 'campaign', 'ascending': 'true'}' \
  -H 'Authorization: Bearer <token>'
```

### Stop campaigns by names

`POST /campaigns/stop-by-names`

Stops campaigns that match the specified list of campaign names and map version. Returns a multi-status response indicating the success or failure of stopping each campaign

**Parameters**

| Name                | In    | Required | Type            | Example                                  | Description                               |
| ------------------- | ----- | :------: | --------------- | ---------------------------------------- | ----------------------------------------- |
| `campaigns`         | query |   yes    | array[Campaign] | `['DefaultMap_Run1', 'DefaultMap_Run3']` | Campaign names to stop                    |
| `mapVersionSerieId` | query |    no    | string          | `1`                                      | Map version series id to filter campaigns |

**Responses**

| Status | Content-Type     | Schema             | Description                    |
| -----: | ---------------- | ------------------ | ------------------------------ |
|    207 | application/json | MultiStatusContent | Server failed to stop campaign |
|    200 | application/json | MultiStatusContent | Successfully stopped campaign  |
|    400 | —                | —                  | Invalid request parameters     |

**Examples**

```bash
curl -X POST 'http://localhost:1789/campaigns/stop-by-names?campaigns=['DefaultMap_Run1', 'DefaultMap_Run3']&mapVersionSerieId=1' \
  -H 'Authorization: Bearer <token>'
```

### Stop campaigns by pattern

`POST /campaigns/stop-by-pattern`

Stops campaigns that match the specified name pattern and map version. If no name pattern is provided, all campaigns will be selected. Returns a multi-status response indicating the success or failure of stopping each campaign

**Parameters**

| Name                | In    | Required | Type   | Example        | Description                               |
| ------------------- | ----- | :------: | ------ | -------------- | ----------------------------------------- |
| `namePattern`       | query |    no    | string | `DefaultMap_*` | Pattern to filter campaign names          |
| `mapVersionSerieId` | query |    no    | string | `1`            | Map version series id to filter campaigns |

**Responses**

| Status | Content-Type     | Schema             | Description                    |
| -----: | ---------------- | ------------------ | ------------------------------ |
|    207 | application/json | MultiStatusContent | Server failed to stop campaign |
|    200 | application/json | MultiStatusContent | Successfully stopped campaign  |
|    400 | —                | —                  | Invalid request parameters     |

**Examples**

```bash
curl -X POST 'http://localhost:1789/campaigns/stop-by-pattern?namePattern=DefaultMap_*&mapVersionSerieId=1' \
  -H 'Authorization: Bearer <token>'
```

### Delete a campaign

`DELETE /campaigns/{campaign}`

Deletes a campaign from its name

**Parameters**

| Name       | In   | Required | Type     | Example           | Description             |
| ---------- | ---- | :------: | -------- | ----------------- | ----------------------- |
| `campaign` | path |   yes    | Campaign | `DefaultMap_Run1` | Campaign name to delete |

**Responses**

| Status | Content-Type | Schema | Description                          |
| -----: | ------------ | ------ | ------------------------------------ |
|    200 | —            | —      | Successfully deleted campaign        |
|    400 | —            | —      | Invalid request parameters           |
|    404 | —            | —      | Campaign not found                   |
|    500 | —            | —      | Server failed to delete the campaign |

**Examples**

```bash
curl -X DELETE 'http://localhost:1789/campaigns/DefaultMap_Run1' \
  -H 'Authorization: Bearer <token>'
```

### deleteCampaignParameter

`DELETE /campaigns/{campaign}/parameter/{campaignParameter}`

**Parameters**

| Name                | In   | Required | Type     | Example           | Description            |
| ------------------- | ---- | :------: | -------- | ----------------- | ---------------------- |
| `campaign`          | path |   yes    | Campaign | `DefaultMap_Run1` | Campaign name          |
| `campaignParameter` | path |   yes    | string   |                   | Campaign parameter key |

**Responses**

| Status | Content-Type | Schema | Description |
| -----: | ------------ | ------ | ----------- |
|    200 | —            | —      | OK          |

**Examples**

```bash
curl -X DELETE 'http://localhost:1789/campaigns/DefaultMap_Run1/parameter/{campaignParameter}' \
  -H 'Authorization: Bearer <token>'
```

### deleteAllCampaignParameters

`DELETE /campaigns/{campaign}/parameters`

**Parameters**

| Name       | In   | Required | Type     | Example           | Description   |
| ---------- | ---- | :------: | -------- | ----------------- | ------------- |
| `campaign` | path |   yes    | Campaign | `DefaultMap_Run1` | Campaign name |

**Responses**

| Status | Content-Type | Schema | Description |
| -----: | ------------ | ------ | ----------- |
|    200 | —            | —      | OK          |

**Examples**

```bash
curl -X DELETE 'http://localhost:1789/campaigns/DefaultMap_Run1/parameters' \
  -H 'Authorization: Bearer <token>'
```

### getCampaignParameters

`GET /campaigns/{campaign}/parameters`

**Parameters**

| Name       | In   | Required | Type     | Example           | Description   |
| ---------- | ---- | :------: | -------- | ----------------- | ------------- |
| `campaign` | path |   yes    | Campaign | `DefaultMap_Run1` | Campaign name |

**Responses**

| Status | Content-Type     | Schema             | Description |
| -----: | ---------------- | ------------------ | ----------- |
|    200 | application/json | CampaignParameters | OK          |

**Examples**

```bash
curl -X GET 'http://localhost:1789/campaigns/DefaultMap_Run1/parameters' \
  -H 'Authorization: Bearer <token>'
```

### createCampaignParameters

`POST /campaigns/{campaign}/parameters`

**Parameters**

| Name       | In    | Required | Type           | Example                                | Description   |
| ---------- | ----- | :------: | -------------- | -------------------------------------- | ------------- |
| `mapId`    | query |   yes    | TaskFlowMapRef | `2ed1ac12-9406-466d-814a-d9d63c5850e3` | Map Id        |
| `campaign` | path  |   yes    | Campaign       | `DefaultMap_Run1`                      | Campaign name |

**Request Body**

- `application/json` — CampaignParameters

**Responses**

| Status | Content-Type | Schema | Description |
| -----: | ------------ | ------ | ----------- |
|    200 | —            | —      | OK          |

**Examples**

```bash
curl -X POST 'http://localhost:1789/campaigns/DefaultMap_Run1/parameters?mapId=2ed1ac12-9406-466d-814a-d9d63c5850e3' \
  -H 'Authorization: Bearer <token>'
  -H 'Content-Type: application/json'
  -d '{
  "/*": "TODO: replace with CampaignParameters */"
}'
```

### Resume a campaign

`POST /campaigns/{campaign}/resume`

Resumes a campaign from its name. Only stopped campaigns can be resumed

**Parameters**

| Name       | In   | Required | Type     | Example           | Description   |
| ---------- | ---- | :------: | -------- | ----------------- | ------------- |
| `campaign` | path |   yes    | Campaign | `DefaultMap_Run1` | Campaign name |

**Responses**

| Status | Content-Type     | Schema | Description                      |
| -----: | ---------------- | ------ | -------------------------------- |
|    400 | —                | —      | Campaign not stopped             |
|    404 | —                | —      | Campaign not found               |
|    500 | —                | —      | Server failed to resume campaign |
|    200 | application/json |        | Successfully resumed campaign    |

**Examples**

```bash
curl -X POST 'http://localhost:1789/campaigns/DefaultMap_Run1/resume' \
  -H 'Authorization: Bearer <token>'
```

### Retry punnets

`POST /campaigns/{campaign}/retry-punnets`

Retry punnets in any step for a specific campaign. You can filter the punnets to retry by status and metadata values

**Parameters**

| Name       | In    | Required | Type           | Example                                | Description                             |
| ---------- | ----- | :------: | -------------- | -------------------------------------- | --------------------------------------- |
| `campaign` | path  |   yes    | Campaign       | `DefaultMap_Run1`                      | Campaign name of the punnets to retry   |
| `mapId`    | query |   yes    | TaskFlowMapRef | `2ed1ac12-9406-466d-814a-d9d63c5850e3` | Map id related to the campaign          |
| `stepId`   | query |   yes    | TaskStepId     | `14737a87-e217-4c9c-ae55-31b6bc71e39d` | Step id containing the punnets to retry |
| `status`   | query |    no    | array[string]  | `ProcessedException`                   | Status to filter punnets to retry       |

**Responses**

| Status | Content-Type | Schema | Description                    |
| -----: | ------------ | ------ | ------------------------------ |
|    500 | —            | —      | Server failed to retry punnets |
|    400 | —            | —      | Invalid request parameters     |
|    200 | —            | —      | Successfully retried campaign  |

**Examples**

```bash
curl -X POST 'http://localhost:1789/campaigns/DefaultMap_Run1/retry-punnets?mapId=2ed1ac12-9406-466d-814a-d9d63c5850e3&stepId=14737a87-e217-4c9c-ae55-31b6bc71e39d&status=ProcessedException' \
  -H 'Authorization: Bearer <token>'
```

### Start a campaign

`POST /campaigns/{campaign}/start`

Starts a campaign from its name and a map id. Can be a new campaign or a rerun

**Parameters**

| Name          | In    | Required | Type           | Example                                | Description   |
| ------------- | ----- | :------: | -------------- | -------------------------------------- | ------------- |
| `campaign`    | path  |   yes    | Campaign       | `DefaultMap_Run1`                      | Campaign name |
| `mapId`       | query |   yes    | TaskFlowMapRef | `2ed1ac12-9406-466d-814a-d9d63c5850e3` | Map Id        |
| `newCampaign` | query |    no    | boolean        | `True`                                 | New campaign  |

**Responses**

| Status | Content-Type     | Schema   | Description                     |
| -----: | ---------------- | -------- | ------------------------------- |
|    400 | —                | —        | Invalid request parameters      |
|    404 | —                | —        | Map not found                   |
|    200 | application/json | Campaign | Successfully started campaign   |
|    500 | —                | —        | Server failed to start campaign |

**Examples**

```bash
curl -X POST 'http://localhost:1789/campaigns/DefaultMap_Run1/start?mapId=2ed1ac12-9406-466d-814a-d9d63c5850e3&newCampaign=True' \
  -H 'Authorization: Bearer <token>'
```

### Get campaign stats

`GET /campaigns/{campaign}/stats`

Retrieves stats of specified campaign

**Parameters**

| Name       | In   | Required | Type     | Example           | Description               |
| ---------- | ---- | :------: | -------- | ----------------- | ------------------------- |
| `campaign` | path |   yes    | Campaign | `DefaultMap_Run1` | Campaign name to retrieve |

**Responses**

| Status | Content-Type     | Schema       | Description                              |
| -----: | ---------------- | ------------ | ---------------------------------------- |
|    500 | —                | —            | Server failed to retrieve campaign stats |
|    200 | application/json | CampaignStat | Successfully retrieved campaign stats    |
|    400 | —                | —            | Invalid request parameters               |
|    404 | —                | —            | Campaign or stats not found              |

**Examples**

```bash
curl -X GET 'http://localhost:1789/campaigns/DefaultMap_Run1/stats' \
  -H 'Authorization: Bearer <token>'
```

### Get campaign status

`GET /campaigns/{campaign}/status`

Retrieves status of specified campaign

**Parameters**

| Name       | In   | Required | Type     | Example           | Description               |
| ---------- | ---- | :------: | -------- | ----------------- | ------------------------- |
| `campaign` | path |   yes    | Campaign | `DefaultMap_Run1` | Campaign name to retrieve |

**Responses**

| Status | Content-Type     | Schema | Description                               |
| -----: | ---------------- | ------ | ----------------------------------------- |
|    404 | —                | —      | Campaign or status not found              |
|    200 | application/json | string | Successfully retrieved campaign status    |
|    400 | —                | —      | Invalid request parameters                |
|    500 | —                | —      | Server failed to retrieve campaign status |

**Examples**

```bash
curl -X GET 'http://localhost:1789/campaigns/DefaultMap_Run1/status' \
  -H 'Authorization: Bearer <token>'
```

### Download step result

`GET /campaigns/{campaign}/step/{stepId}/download-result`

Downloads step result for a specific campaign. You can filter the punnets to download by status and metadata values

**Parameters**

| Name       | In    | Required | Type           | Example                                | Description                          |
| ---------- | ----- | :------: | -------------- | -------------------------------------- | ------------------------------------ |
| `campaign` | path  |   yes    | Campaign       | `DefaultMap_Run1`                      | Campaign name of the step            |
| `mapId`    | query |   yes    | TaskFlowMapRef | `2ed1ac12-9406-466d-814a-d9d63c5850e3` | Map id related to the campaign       |
| `stepId`   | path  |   yes    | TaskStepId     | `14737a87-e217-4c9c-ae55-31b6bc71e39d` | Step id to download result           |
| `status`   | query |    no    | array[string]  | `ProcessedException`                   | Status to filter punnets to download |

**Responses**

| Status | Content-Type | Schema | Description                           |
| -----: | ------------ | ------ | ------------------------------------- |
|    200 | —            | —      | Successfully downloaded step result   |
|    500 | —            | —      | Server failed to download step result |
|    400 | —            | —      | Invalid request parameters            |

**Examples**

```bash
curl -X GET 'http://localhost:1789/campaigns/DefaultMap_Run1/step/14737a87-e217-4c9c-ae55-31b6bc71e39d/download-result?mapId=2ed1ac12-9406-466d-814a-d9d63c5850e3&status=ProcessedException' \
  -H 'Authorization: Bearer <token>'
```

### Pause a step

`POST /campaigns/{campaign}/step/{stepId}/pause`

Pause a step by providing the campaign name, map ID, and step ID. These parameters define the exact context of the task to pause.

**Parameters**

| Name       | In    | Required | Type           | Example                                | Description                                     |
| ---------- | ----- | :------: | -------------- | -------------------------------------- | ----------------------------------------------- |
| `campaign` | path  |   yes    | Campaign       | `DefaultMap_Run1`                      | The campaign name to identify the task context  |
| `mapId`    | query |   yes    | TaskFlowMapRef | `2ed1ac12-9406-466d-814a-d9d63c5850e3` | The map Id related to the campaign              |
| `stepId`   | path  |   yes    | TaskStepId     | `14737a87-e217-4c9c-ae55-31b6bc71e39d` | The step Id defining the specific task to pause |

**Responses**

| Status | Content-Type     | Schema | Description                |
| -----: | ---------------- | ------ | -------------------------- |
|    204 | application/json |        | Successfully paused step   |
|    400 | —                | —      | Invalid request parameters |
|    404 | —                | —      | Campaign not found         |
|    500 | —                | —      | Failed to pause step       |

**Examples**

```bash
curl -X POST 'http://localhost:1789/campaigns/DefaultMap_Run1/step/14737a87-e217-4c9c-ae55-31b6bc71e39d/pause?mapId=2ed1ac12-9406-466d-814a-d9d63c5850e3' \
  -H 'Authorization: Bearer <token>'
```

### Resume a step

`POST /campaigns/{campaign}/step/{stepId}/resume`

Resume a step by providing the campaign name, map ID, and step ID. These parameters define the exact context of the task to resume.

**Parameters**

| Name       | In    | Required | Type           | Example                                | Description                                      |
| ---------- | ----- | :------: | -------------- | -------------------------------------- | ------------------------------------------------ |
| `campaign` | path  |   yes    | Campaign       | `DefaultMap_Run1`                      | The campaign name to identify the task context   |
| `mapId`    | query |   yes    | TaskFlowMapRef | `2ed1ac12-9406-466d-814a-d9d63c5850e3` | The map Id related to the campaign               |
| `stepId`   | path  |   yes    | TaskStepId     | `14737a87-e217-4c9c-ae55-31b6bc71e39d` | The step Id defining the specific task to resume |

**Responses**

| Status | Content-Type     | Schema | Description                |
| -----: | ---------------- | ------ | -------------------------- |
|    500 | —                | —      | Failed to resume step      |
|    400 | —                | —      | Invalid request parameters |
|    404 | —                | —      | Campaign not found         |
|    204 | application/json |        | Successfully resumed step  |

**Examples**

```bash
curl -X POST 'http://localhost:1789/campaigns/DefaultMap_Run1/step/14737a87-e217-4c9c-ae55-31b6bc71e39d/resume?mapId=2ed1ac12-9406-466d-814a-d9d63c5850e3' \
  -H 'Authorization: Bearer <token>'
```

### Stop a campaign

`POST /campaigns/{campaign}/stop`

Stop a campaign from its name

**Parameters**

| Name       | In   | Required | Type     | Example           | Description   |
| ---------- | ---- | :------: | -------- | ----------------- | ------------- |
| `campaign` | path |   yes    | Campaign | `DefaultMap_Run1` | Campaign name |

**Responses**

| Status | Content-Type     | Schema | Description                   |
| -----: | ---------------- | ------ | ----------------------------- |
|    200 | application/json |        | Successfully stopped campaign |
|    400 | —                | —      | Campaign not started          |
|    500 | —                | —      | Failed to resume campaign     |
|    404 | —                | —      | Campaign not found            |

**Examples**

```bash
curl -X POST 'http://localhost:1789/campaigns/DefaultMap_Run1/stop' \
  -H 'Authorization: Bearer <token>'
```

---

## Catalog API

Endpoint to retrieve catalog tasks

### getCatalog

`GET /catalog`

**Parameters**

| Name         | In    | Required | Type          | Example | Description |
| ------------ | ----- | :------: | ------------- | ------- | ----------- |
| `name`       | query |    no    | string        |         |             |
| `classNames` | query |    no    | array[string] |         |             |
| `allTask`    | query |    no    | boolean       |         |             |

**Responses**

| Status | Content-Type     | Schema                 | Description |
| -----: | ---------------- | ---------------------- | ----------- |
|    200 | application/json | array[AccessibleClass] | OK          |

**Examples**

```bash
curl -X GET 'http://localhost:1789/catalog?name=value&classNames=value&allTask=true' \
  -H 'Authorization: Bearer <token>'
```

### getCatalogDto

`GET /catalog/dto`

**Parameters**

| Name         | In    | Required | Type          | Example | Description |
| ------------ | ----- | :------: | ------------- | ------- | ----------- |
| `name`       | query |    no    | string        |         |             |
| `classNames` | query |    no    | array[string] |         |             |
| `allTask`    | query |    no    | boolean       |         |             |

**Responses**

| Status | Content-Type     | Schema                    | Description |
| -----: | ---------------- | ------------------------- | ----------- |
|    200 | application/json | array[AccessibleClassDto] | OK          |

**Examples**

```bash
curl -X GET 'http://localhost:1789/catalog/dto?name=value&classNames=value&allTask=true' \
  -H 'Authorization: Bearer <token>'
```

---

## Email API

Endpoint for managing emails

### createEmail

`POST /emails`

**Request Body**

- `application/json` — EmailSettings

**Responses**

| Status | Content-Type     | Schema        | Description |
| -----: | ---------------- | ------------- | ----------- |
|    200 | application/json | EmailSettings | OK          |

**Examples**

```bash
curl -X POST 'http://localhost:1789/emails' \
  -H 'Authorization: Bearer <token>'
  -H 'Content-Type: application/json'
  -d '{
  "/*": "TODO: replace with EmailSettings */"
}'
```

### updateEmail

`PUT /emails`

**Request Body**

- `application/json` — EmailSettings

**Responses**

| Status | Content-Type     | Schema        | Description |
| -----: | ---------------- | ------------- | ----------- |
|    200 | application/json | EmailSettings | OK          |

**Examples**

```bash
curl -X PUT 'http://localhost:1789/emails' \
  -H 'Authorization: Bearer <token>'
  -H 'Content-Type: application/json'
  -d '{
  "/*": "TODO: replace with EmailSettings */"
}'
```

### deleteEmails_1

`DELETE /emails/delete-by-names`

**Parameters**

| Name     | In    | Required | Type          | Example | Description |
| -------- | ----- | :------: | ------------- | ------- | ----------- |
| `emails` | query |   yes    | array[string] |         |             |

**Request Body**

- `application/json` — PaginateParams

**Responses**

| Status | Content-Type     | Schema                   | Description |
| -----: | ---------------- | ------------------------ | ----------- |
|    200 | application/json | MultiStatusContentString | OK          |

**Examples**

```bash
curl -X DELETE 'http://localhost:1789/emails/delete-by-names?emails=value' \
  -H 'Authorization: Bearer <token>'
  -H 'Content-Type: application/json'
  -d '{
  "/*": "TODO: replace with PaginateParams */"
}'
```

### deleteEmails

`DELETE /emails/delete-by-pattern`

**Parameters**

| Name          | In    | Required | Type   | Example | Description |
| ------------- | ----- | :------: | ------ | ------- | ----------- |
| `namePattern` | query |    no    | string |         |             |

**Request Body**

- `application/json` — PaginateParams

**Responses**

| Status | Content-Type     | Schema                   | Description |
| -----: | ---------------- | ------------------------ | ----------- |
|    200 | application/json | MultiStatusContentString | OK          |

**Examples**

```bash
curl -X DELETE 'http://localhost:1789/emails/delete-by-pattern?namePattern=value' \
  -H 'Authorization: Bearer <token>'
  -H 'Content-Type: application/json'
  -d '{
  "/*": "TODO: replace with PaginateParams */"
}'
```

### getEmailsByNames

`GET /emails/search-by-names`

**Parameters**

| Name             | In    | Required | Type           | Example | Description |
| ---------------- | ----- | :------: | -------------- | ------- | ----------- |
| `emails`         | query |   yes    | array[string]  |         |             |
| `paginateParams` | query |   yes    | PaginateParams |         |             |

**Responses**

| Status | Content-Type     | Schema                         | Description |
| -----: | ---------------- | ------------------------------ | ----------- |
|    200 | application/json | PaginateEntityDtoEmailSettings | OK          |

**Examples**

```bash
curl -X GET 'http://localhost:1789/emails/search-by-names?emails=value&paginateParams=value' \
  -H 'Authorization: Bearer <token>'
```

### getEmails

`GET /emails/search-by-pattern`

**Parameters**

| Name             | In    | Required | Type           | Example | Description |
| ---------------- | ----- | :------: | -------------- | ------- | ----------- |
| `namePattern`    | query |    no    | string         |         |             |
| `paginateParams` | query |   yes    | PaginateParams |         |             |

**Responses**

| Status | Content-Type     | Schema                         | Description |
| -----: | ---------------- | ------------------------------ | ----------- |
|    200 | application/json | PaginateEntityDtoEmailSettings | OK          |

**Examples**

```bash
curl -X GET 'http://localhost:1789/emails/search-by-pattern?namePattern=value&paginateParams=value' \
  -H 'Authorization: Bearer <token>'
```

### deleteEmail

`DELETE /emails/{email}`

**Parameters**

| Name    | In   | Required | Type   | Example | Description |
| ------- | ---- | :------: | ------ | ------- | ----------- |
| `email` | path |   yes    | string |         |             |

**Responses**

| Status | Content-Type | Schema | Description |
| -----: | ------------ | ------ | ----------- |
|    200 | —            | —      | OK          |

**Examples**

```bash
curl -X DELETE 'http://localhost:1789/emails/{email}' \
  -H 'Authorization: Bearer <token>'
```

### getEmail

`GET /emails/{email}`

**Parameters**

| Name    | In   | Required | Type   | Example | Description |
| ------- | ---- | :------: | ------ | ------- | ----------- |
| `email` | path |   yes    | string |         |             |

**Responses**

| Status | Content-Type     | Schema        | Description |
| -----: | ---------------- | ------------- | ----------- |
|    200 | application/json | EmailSettings | OK          |

**Examples**

```bash
curl -X GET 'http://localhost:1789/emails/{email}' \
  -H 'Authorization: Bearer <token>'
```

---

## Job API

Endpoint for managing jobs

### Create a job

`POST /jobs`

Creates a new job for a map with its cron expression

**Request Body**

- `application/json` — JobSettings

**Responses**

| Status | Content-Type     | Schema      | Description                 |
| -----: | ---------------- | ----------- | --------------------------- |
|    200 | application/json | JobSettings | Successfully created job    |
|    400 | —                | —           | Invalid request parameters  |
|    409 | —                | —           | Job name already taken      |
|    500 | —                | —           | Server failed to create job |

**Examples**

```bash
curl -X POST 'http://localhost:1789/jobs' \
  -H 'Authorization: Bearer <token>'
  -H 'Content-Type: application/json'
  -d '{
  "/*": "TODO: replace with JobSettings */"
}'
```

### Update a job

`PUT /jobs`

Updates a job. The job must have a name and an Id are required

**Request Body**

- `application/json` — JobSettings

**Responses**

| Status | Content-Type     | Schema      | Description                 |
| -----: | ---------------- | ----------- | --------------------------- |
|    500 | —                | —           | Server failed to update job |
|    404 | —                | —           | Provided job not found      |
|    400 | —                | —           | Invalid request parameters  |
|    409 | —                | —           | Job name already taken      |
|    200 | application/json | JobSettings | Successfully updated job    |

**Examples**

```bash
curl -X PUT 'http://localhost:1789/jobs' \
  -H 'Authorization: Bearer <token>'
  -H 'Content-Type: application/json'
  -d '{
  "/*": "TODO: replace with JobSettings */"
}'
```

### Delete jobs by name

`DELETE /jobs/delete-by-name`

Deletes jobs that match the list of specified job names. Returns a multi-status response indicating the success or failure of deleting each job

**Parameters**

| Name       | In    | Required | Type          | Example          | Description         |
| ---------- | ----- | :------: | ------------- | ---------------- | ------------------- |
| `jobNames` | query |   yes    | array[string] | `['123', '456']` | Job names to delete |

**Responses**

| Status | Content-Type     | Schema             | Description                       |
| -----: | ---------------- | ------------------ | --------------------------------- |
|    200 | application/json | MultiStatusContent | Successfully deleted jobs         |
|    400 | —                | —                  | Invalid request parameters        |
|    207 | application/json | MultiStatusContent | Server failed to delete campaigns |

**Examples**

```bash
curl -X DELETE 'http://localhost:1789/jobs/delete-by-name?jobNames=['123', '456']' \
  -H 'Authorization: Bearer <token>'
```

### Delete jobs by pattern

`DELETE /jobs/delete-by-pattern`

Deletes jobs that match the specified name pattern. If no name pattern is provided, all jobs will be selected. Returns a multi-status response indicating the success or failure of deleting each job

**Parameters**

| Name          | In    | Required | Type   | Example | Description                 |
| ------------- | ----- | :------: | ------ | ------- | --------------------------- |
| `namePattern` | query |    no    | string | `Job_*` | Pattern to filter job names |

**Responses**

| Status | Content-Type     | Schema             | Description                       |
| -----: | ---------------- | ------------------ | --------------------------------- |
|    200 | application/json | MultiStatusContent | Successfully deleted jobs         |
|    400 | —                | —                  | Invalid request parameters        |
|    207 | application/json | MultiStatusContent | Server failed to delete campaigns |

**Examples**

```bash
curl -X DELETE 'http://localhost:1789/jobs/delete-by-pattern?namePattern=Job_*' \
  -H 'Authorization: Bearer <token>'
```

### Get jobs by name

`GET /jobs/search-by-names`

Retrieves jobs that match the list of specified job names

**Parameters**

| Name             | In    | Required | Type           | Example                                                              | Description           |
| ---------------- | ----- | :------: | -------------- | -------------------------------------------------------------------- | --------------------- |
| `jobNames`       | query |   yes    | array[string]  | `['123', '456']`                                                     | Job names to retrieve |
| `paginateParams` | query |   yes    | PaginateParams | `{'from': 0, 'size': 20, 'orderBy': 'jobName', 'ascending': 'true'}` | Pagination parameters |

**Responses**

| Status | Content-Type     | Schema     | Description                    |
| -----: | ---------------- | ---------- | ------------------------------ |
|    400 | —                | —          | Invalid request parameters     |
|    500 | —                | —          | Server failed to retrieve jobs |
|    200 | application/json | JobDetails | Successfully retrieved jobs    |

**Examples**

```bash
curl -X GET 'http://localhost:1789/jobs/search-by-names?jobNames=['123', '456']&paginateParams={'from': 0, 'size': 20, 'orderBy': 'jobName', 'ascending': 'true'}' \
  -H 'Authorization: Bearer <token>'
```

### Get jobs by pattern

`GET /jobs/search-by-pattern`

Retrieves jobs that match the specified name pattern. If no name pattern is provided, all jobs will be selected

**Parameters**

| Name             | In    | Required | Type           | Example                                                              | Description                 |
| ---------------- | ----- | :------: | -------------- | -------------------------------------------------------------------- | --------------------------- |
| `namePattern`    | query |    no    | string         | `Job_*`                                                              | Pattern to filter job names |
| `paginateParams` | query |   yes    | PaginateParams | `{'from': 0, 'size': 20, 'orderBy': 'jobName', 'ascending': 'true'}` | Pagination parameters       |

**Responses**

| Status | Content-Type     | Schema     | Description                    |
| -----: | ---------------- | ---------- | ------------------------------ |
|    400 | —                | —          | Invalid request parameters     |
|    500 | —                | —          | Server failed to retrieve jobs |
|    200 | application/json | JobDetails | Successfully retrieved jobs    |

**Examples**

```bash
curl -X GET 'http://localhost:1789/jobs/search-by-pattern?namePattern=Job_*&paginateParams={'from': 0, 'size': 20, 'orderBy': 'jobName', 'ascending': 'true'}' \
  -H 'Authorization: Bearer <token>'
```

### isCronValidFromString

`GET /jobs/validateCron`

**Parameters**

| Name             | In    | Required | Type   | Example | Description |
| ---------------- | ----- | :------: | ------ | ------- | ----------- |
| `cronExpression` | query |   yes    | string |         |             |

**Responses**

| Status | Content-Type     | Schema  | Description |
| -----: | ---------------- | ------- | ----------- |
|    200 | application/json | boolean | OK          |

**Examples**

```bash
curl -X GET 'http://localhost:1789/jobs/validateCron?cronExpression=value' \
  -H 'Authorization: Bearer <token>'
```

### Delete a job

`DELETE /jobs/{jobName}`

Deletes a job from its name

**Parameters**

| Name      | In   | Required | Type   | Example | Description         |
| --------- | ---- | :------: | ------ | ------- | ------------------- |
| `jobName` | path |   yes    | string | `myJob` | The name of the job |

**Responses**

| Status | Content-Type | Schema | Description                 |
| -----: | ------------ | ------ | --------------------------- |
|    400 | —            | —      | Invalid request parameters  |
|    404 | —            | —      | Job not found               |
|    200 | —            | —      | Successfully deleted job    |
|    500 | —            | —      | Server failed to delete job |

**Examples**

```bash
curl -X DELETE 'http://localhost:1789/jobs/myJob' \
  -H 'Authorization: Bearer <token>'
```

### Get job from name

`GET /jobs/{jobName}`

Retrieves a job from its name

**Parameters**

| Name      | In   | Required | Type   | Example | Description         |
| --------- | ---- | :------: | ------ | ------- | ------------------- |
| `jobName` | path |   yes    | string | `myJob` | The name of the job |

**Responses**

| Status | Content-Type     | Schema     | Description                   |
| -----: | ---------------- | ---------- | ----------------------------- |
|    500 | —                | —          | Server failed to retrieve job |
|    400 | —                | —          | Invalid request parameters    |
|    404 | —                | —          | Job not found                 |
|    200 | application/json | JobDetails | Successfully retrieved job    |

**Examples**

```bash
curl -X GET 'http://localhost:1789/jobs/myJob' \
  -H 'Authorization: Bearer <token>'
```

---

## Map API

Endpoint for managing maps

### Create a map

`POST /maps`

Creates a new map with an id and a unique name

**Request Body**

- `application/json` — string

**Responses**

| Status | Content-Type     | Schema | Description                 |
| -----: | ---------------- | ------ | --------------------------- |
|    409 | —                | —      | Map name already taken      |
|    500 | —                | —      | Server failed to create map |
|    400 | —                | —      | Invalid request parameters  |
|    200 | application/json | string | Successfully created map    |

**Examples**

```bash
curl -X POST 'http://localhost:1789/maps' \
  -H 'Authorization: Bearer <token>'
  -H 'Content-Type: application/json'
  -d '{
  "/*": "TODO: replace with string */"
}'
```

### Save a map

`PUT /maps`

Saves a whole map including step configurations

**Request Body**

- `application/json` — string

**Responses**

| Status | Content-Type     | Schema | Description                                                                                       |
| -----: | ---------------- | ------ | ------------------------------------------------------------------------------------------------- |
|    500 | —                | —      | Server failed to save map                                                                         |
|    200 | application/json | string | Successfully saved maps                                                                           |
|    409 | —                | —      | New map name already taken                                                                        |
|    400 | —                | —      | Invalid request parameters                                                                        |
|    404 | —                | —      | Map not found from provided mapId or map versions weren't matching between provided and found map |

**Examples**

```bash
curl -X PUT 'http://localhost:1789/maps' \
  -H 'Authorization: Bearer <token>'
  -H 'Content-Type: application/json'
  -d '{
  "/*": "TODO: replace with string */"
}'
```

### Delete maps by Ids

`DELETE /maps/delete-by-ids`

Deletes maps that match the list of specified map Ids

**Parameters**

| Name     | In    | Required | Type                  | Example                                                                            | Description                   |
| -------- | ----- | :------: | --------------------- | ---------------------------------------------------------------------------------- | ----------------------------- |
| `mapIds` | query |   yes    | array[TaskFlowMapRef] | `['2ed1ac12-9406-466d-814a-d9d63c5850e3', '8f654448-f2d7-4c8a-95dc-e6b1a90a5ca5']` | Map ids of the maps to delete |

**Responses**

| Status | Content-Type     | Schema         | Description                  |
| -----: | ---------------- | -------------- | ---------------------------- |
|    200 | application/json | TaskFlowMapRef | Successfully deleted maps    |
|    500 | —                | —              | Server failed to delete maps |
|    400 | —                | —              | Invalid request parameters   |

**Examples**

```bash
curl -X DELETE 'http://localhost:1789/maps/delete-by-ids?mapIds=['2ed1ac12-9406-466d-814a-d9d63c5850e3', '8f654448-f2d7-4c8a-95dc-e6b1a90a5ca5']' \
  -H 'Authorization: Bearer <token>'
```

### Delete maps by pattern

`DELETE /maps/delete-by-pattern`

Deletes maps that match the specified name pattern. If no name pattern is provided, all maps will be selected

**Parameters**

| Name          | In    | Required | Type   | Example        | Description                 |
| ------------- | ----- | :------: | ------ | -------------- | --------------------------- |
| `namePattern` | query |    no    | string | `DefaultMap_*` | Pattern to filter map names |

**Responses**

| Status | Content-Type     | Schema         | Description                  |
| -----: | ---------------- | -------------- | ---------------------------- |
|    200 | application/json | TaskFlowMapRef | Successfully deleted maps    |
|    500 | —                | —              | Server failed to delete maps |
|    400 | —                | —              | Invalid request parameters   |

**Examples**

```bash
curl -X DELETE 'http://localhost:1789/maps/delete-by-pattern?namePattern=DefaultMap_*' \
  -H 'Authorization: Bearer <token>'
```

### Delete maps by version

`DELETE /maps/delete-by-version`

Deletes maps summary that match the specified map version Ids

**Parameters**

| Name                | In    | Required | Type           | Example                                | Description                               |
| ------------------- | ----- | :------: | -------------- | -------------------------------------- | ----------------------------------------- |
| `mapVersionSerieId` | query |   yes    | TaskFlowMapRef | `2ed1ac12-9406-466d-814a-d9d63c5850e3` | The mapVersionSerieId attached to the map |

**Request Body**

- `application/json` — PaginateParams

**Responses**

| Status | Content-Type     | Schema         | Description                  |
| -----: | ---------------- | -------------- | ---------------------------- |
|    200 | application/json | TaskFlowMapRef | Successfully deleted maps    |
|    500 | —                | —              | Server failed to delete maps |
|    400 | —                | —              | Invalid request parameters   |

**Examples**

```bash
curl -X DELETE 'http://localhost:1789/maps/delete-by-version?mapVersionSerieId=2ed1ac12-9406-466d-814a-d9d63c5850e3' \
  -H 'Authorization: Bearer <token>'
  -H 'Content-Type: application/json'
  -d '{
  "/*": "TODO: replace with PaginateParams */"
}'
```

### Download map

`GET /maps/download/{mapId}`

Downloads map file from provided map id

**Parameters**

| Name    | In   | Required | Type           | Example                                | Description                       |
| ------- | ---- | :------: | -------------- | -------------------------------------- | --------------------------------- |
| `mapId` | path |   yes    | TaskFlowMapRef | `2ed1ac12-9406-466d-814a-d9d63c5850e3` | The map Id of the map to download |

**Responses**

| Status | Content-Type     | Schema                | Description                    |
| -----: | ---------------- | --------------------- | ------------------------------ |
|    500 | —                | —                     | Server failed to download maps |
|    200 | application/json | StreamingResponseBody | Successfully downloaded maps   |
|    400 | —                | —                     | Invalid request parameters     |

**Examples**

```bash
curl -X GET 'http://localhost:1789/maps/download/2ed1ac12-9406-466d-814a-d9d63c5850e3' \
  -H 'Authorization: Bearer <token>'
```

### Assert map name availability

`GET /maps/name-availability`

Checks that provided map name is available

**Parameters**

| Name      | In    | Required | Type   | Example      | Description                        |
| --------- | ----- | :------: | ------ | ------------ | ---------------------------------- |
| `mapName` | query |   yes    | string | `DefaultMap` | The map name to check availability |

**Responses**

| Status | Content-Type     | Schema  | Description                                |
| -----: | ---------------- | ------- | ------------------------------------------ |
|    200 | application/json | boolean | Successfully checked map name availability |
|    500 | —                | —       | Server failed to check map name            |
|    400 | —                | —       | Invalid request parameters                 |

**Examples**

```bash
curl -X GET 'http://localhost:1789/maps/name-availability?mapName=DefaultMap' \
  -H 'Authorization: Bearer <token>'
```

### Get maps by Ids

`GET /maps/search-by-ids`

Retrieves maps that match the list of specified map Ids

**Parameters**

| Name             | In    | Required | Type                  | Example                                                                            | Description                     |
| ---------------- | ----- | :------: | --------------------- | ---------------------------------------------------------------------------------- | ------------------------------- |
| `mapIds`         | query |   yes    | array[TaskFlowMapRef] | `['2ed1ac12-9406-466d-814a-d9d63c5850e3', '8f654448-f2d7-4c8a-95dc-e6b1a90a5ca5']` | Map ids of the maps to retrieve |
| `paginateParams` | query |   yes    | PaginateParams        | `{'from': 0, 'size': 20, 'orderBy': 'mapName', 'ascending': 'true'}`               | Pagination parameters           |

**Responses**

| Status | Content-Type     | Schema | Description                    |
| -----: | ---------------- | ------ | ------------------------------ |
|    400 | —                | —      | Invalid request parameters     |
|    200 | application/json | string | Successfully retrieved maps    |
|    500 | —                | —      | Server failed to retrieve maps |

**Examples**

```bash
curl -X GET 'http://localhost:1789/maps/search-by-ids?mapIds=['2ed1ac12-9406-466d-814a-d9d63c5850e3', '8f654448-f2d7-4c8a-95dc-e6b1a90a5ca5']&paginateParams={'from': 0, 'size': 20, 'orderBy': 'mapName', 'ascending': 'true'}' \
  -H 'Authorization: Bearer <token>'
```

### Get maps by pattern

`GET /maps/search-by-pattern`

Retrieves maps that match the specified name pattern. If no name pattern is provided, all maps will be selected

**Parameters**

| Name             | In    | Required | Type           | Example                                                              | Description                 |
| ---------------- | ----- | :------: | -------------- | -------------------------------------------------------------------- | --------------------------- |
| `namePattern`    | query |    no    | string         | `DefaultMap_*`                                                       | Pattern to filter map names |
| `paginateParams` | query |   yes    | PaginateParams | `{'from': 0, 'size': 20, 'orderBy': 'mapName', 'ascending': 'true'}` | Pagination parameters       |

**Responses**

| Status | Content-Type     | Schema | Description                    |
| -----: | ---------------- | ------ | ------------------------------ |
|    200 | application/json | string | Successfully retrieved maps    |
|    400 | —                | —      | Invalid request parameters     |
|    500 | —                | —      | Server failed to retrieve maps |

**Examples**

```bash
curl -X GET 'http://localhost:1789/maps/search-by-pattern?namePattern=DefaultMap_*&paginateParams={'from': 0, 'size': 20, 'orderBy': 'mapName', 'ascending': 'true'}' \
  -H 'Authorization: Bearer <token>'
```

### Get maps by version Id

`GET /maps/search-by-version`

Retrieves maps summary that match the list of specified map Ids

**Parameters**

| Name                | In    | Required | Type           | Example                                                              | Description                               |
| ------------------- | ----- | :------: | -------------- | -------------------------------------------------------------------- | ----------------------------------------- |
| `mapVersionSerieId` | query |   yes    | TaskFlowMapRef | `2ed1ac12-9406-466d-814a-d9d63c5850e3`                               | The mapVersionSerieId attached to the map |
| `paginateParams`    | query |   yes    | PaginateParams | `{'from': 0, 'size': 20, 'orderBy': 'mapName', 'ascending': 'true'}` | Pagination parameters                     |

**Responses**

| Status | Content-Type     | Schema | Description                          |
| -----: | ---------------- | ------ | ------------------------------------ |
|    400 | —                | —      | Invalid request parameters           |
|    200 | application/json | string | Successfully retrieved maps          |
|    404 | —                | —      | Provided mapVersionSerieId not found |
|    500 | —                | —      | Server failed to retrieve maps       |

**Examples**

```bash
curl -X GET 'http://localhost:1789/maps/search-by-version?mapVersionSerieId=2ed1ac12-9406-466d-814a-d9d63c5850e3&paginateParams={'from': 0, 'size': 20, 'orderBy': 'mapName', 'ascending': 'true'}' \
  -H 'Authorization: Bearer <token>'
```

### Get maps summaries by Id

`GET /maps/summary/search-by-ids`

Retrieves maps summaries that match the list of specified map Ids

**Parameters**

| Name             | In    | Required | Type                  | Example                                                                            | Description                     |
| ---------------- | ----- | :------: | --------------------- | ---------------------------------------------------------------------------------- | ------------------------------- |
| `mapIds`         | query |   yes    | array[TaskFlowMapRef] | `['2ed1ac12-9406-466d-814a-d9d63c5850e3', '8f654448-f2d7-4c8a-95dc-e6b1a90a5ca5']` | Map ids of the maps to retrieve |
| `paginateParams` | query |   yes    | PaginateParams        | `{'from': 0, 'size': 20, 'orderBy': 'mapName', 'ascending': 'true'}`               | Pagination parameters           |

**Responses**

| Status | Content-Type     | Schema             | Description                    |
| -----: | ---------------- | ------------------ | ------------------------------ |
|    200 | application/json | TaskFlowMapSummary | Successfully retrieved maps    |
|    400 | —                | —                  | Invalid request parameters     |
|    500 | —                | —                  | Server failed to retrieve maps |

**Examples**

```bash
curl -X GET 'http://localhost:1789/maps/summary/search-by-ids?mapIds=['2ed1ac12-9406-466d-814a-d9d63c5850e3', '8f654448-f2d7-4c8a-95dc-e6b1a90a5ca5']&paginateParams={'from': 0, 'size': 20, 'orderBy': 'mapName', 'ascending': 'true'}' \
  -H 'Authorization: Bearer <token>'
```

### Get maps summaries by pattern

`GET /maps/summary/search-by-pattern`

Retrieves maps summaries that match the specified name pattern. If no name pattern is provided, all maps will be selected

**Parameters**

| Name             | In    | Required | Type           | Example                                                              | Description                 |
| ---------------- | ----- | :------: | -------------- | -------------------------------------------------------------------- | --------------------------- |
| `namePattern`    | query |    no    | string         | `DefaultMap_*`                                                       | Pattern to filter map names |
| `paginateParams` | query |   yes    | PaginateParams | `{'from': 0, 'size': 20, 'orderBy': 'mapName', 'ascending': 'true'}` | Pagination parameters       |

**Responses**

| Status | Content-Type     | Schema             | Description                    |
| -----: | ---------------- | ------------------ | ------------------------------ |
|    200 | application/json | TaskFlowMapSummary | Successfully retrieved maps    |
|    400 | —                | —                  | Invalid request parameters     |
|    500 | —                | —                  | Server failed to retrieve maps |

**Examples**

```bash
curl -X GET 'http://localhost:1789/maps/summary/search-by-pattern?namePattern=DefaultMap_*&paginateParams={'from': 0, 'size': 20, 'orderBy': 'mapName', 'ascending': 'true'}' \
  -H 'Authorization: Bearer <token>'
```

### Upload a map

`POST /maps/upload/{mapName}`

Created a new map from file and associates it with the given map name

**Parameters**

| Name      | In   | Required | Type   | Example | Description                |
| --------- | ---- | :------: | ------ | ------- | -------------------------- |
| `mapName` | path |   yes    | string |         | The map name to associates |

**Request Body**

- `multipart/form-data` — object

**Responses**

| Status | Content-Type     | Schema | Description                  |
| -----: | ---------------- | ------ | ---------------------------- |
|    409 | —                | —      | Map name already taken       |
|    400 | —                | —      | Invalid request parameters   |
|    200 | application/json | string | Successfully uploaded map    |
|    500 | —                | —      | Server failed to upload maps |

**Examples**

```bash
curl -X POST 'http://localhost:1789/maps/upload/{mapName}' \
  -H 'Authorization: Bearer <token>'
  -H 'Content-Type: multipart/form-data'
  -F 'file=@/path/to/file'
```

### Delete a map from its Id

`DELETE /maps/{mapId}`

Deletes one map from provided map Id

**Parameters**

| Name    | In   | Required | Type           | Example                                | Description                          |
| ------- | ---- | :------: | -------------- | -------------------------------------- | ------------------------------------ |
| `mapId` | path |   yes    | TaskFlowMapRef | `2ed1ac12-9406-466d-814a-d9d63c5850e3` | Map Id attached to the map to delete |

**Responses**

| Status | Content-Type | Schema | Description                  |
| -----: | ------------ | ------ | ---------------------------- |
|    500 | —            | —      | Server failed to delete maps |
|    400 | —            | —      | Invalid request parameters   |
|    404 | —            | —      | Map not found                |
|    200 | —            | —      | Successfully deleted maps    |

**Examples**

```bash
curl -X DELETE 'http://localhost:1789/maps/2ed1ac12-9406-466d-814a-d9d63c5850e3' \
  -H 'Authorization: Bearer <token>'
```

### Get a map from its id

`GET /maps/{mapId}`

Retrieves one map from its map Id

**Parameters**

| Name    | In   | Required | Type           | Example                                | Description                    |
| ------- | ---- | :------: | -------------- | -------------------------------------- | ------------------------------ |
| `mapId` | path |   yes    | TaskFlowMapRef | `2ed1ac12-9406-466d-814a-d9d63c5850e3` | The map Id attached to the map |

**Responses**

| Status | Content-Type     | Schema | Description                       |
| -----: | ---------------- | ------ | --------------------------------- |
|    404 | —                | —      | Map not found from provided mapId |
|    400 | —                | —      | Invalid request parameters        |
|    500 | —                | —      | Server failed to retrieve map     |
|    200 | application/json | string | Successfully retrieved map        |

**Examples**

```bash
curl -X GET 'http://localhost:1789/maps/2ed1ac12-9406-466d-814a-d9d63c5850e3' \
  -H 'Authorization: Bearer <token>'
```

---

## Punnet API

Endpoint to retrieve punnets

### Get index mapping campaign

`GET /punnets/mapping`

Retrieves all field mappings (structure of documents) for the OpenSearch index related to the specified campaign

**Parameters**

| Name       | In    | Required | Type     | Example           | Description   |
| ---------- | ----- | :------: | -------- | ----------------- | ------------- |
| `campaign` | query |   yes    | Campaign | `DefaultMap_Run1` | Campaign name |

**Responses**

| Status | Content-Type     | Schema          | Description                           |
| -----: | ---------------- | --------------- | ------------------------------------- |
|    500 | —                | —               | Server failed to retrieve mapping     |
|    200 | application/json | PunnetDataModel | Successfully retrieved fields mapping |
|    400 | —                | —               | Invalid request parameters            |

**Examples**

```bash
curl -X GET 'http://localhost:1789/punnets/mapping?campaign=DefaultMap_Run1' \
  -H 'Authorization: Bearer <token>'
```

### Get all punnet contexts

`GET /punnets/punnet-contexts`

Retrieves all punnet contexts from a campaign and a stepId. You can filter results by punnet metadata

**Parameters**

| Name             | In    | Required | Type           | Example                                                               | Description                           |
| ---------------- | ----- | :------: | -------------- | --------------------------------------------------------------------- | ------------------------------------- |
| `campaign`       | query |   yes    | Campaign       | `DefaultMap_Run1`                                                     | Campaign name                         |
| `stepId`         | query |   yes    | TaskStepId     | `14737a87-e217-4c9c-ae55-31b6bc71e39d`                                | The step Id that processed the punnet |
| `paginateParams` | query |   yes    | PaginateParams | `{'from': 1, 'size': 20, 'orderBy': 'campaign', 'ascending': 'true'}` | Pagination parameters                 |

**Responses**

| Status | Content-Type     | Schema         | Description                               |
| -----: | ---------------- | -------------- | ----------------------------------------- |
|    500 | —                | —              | Server failed to retrieve punnet contexts |
|    200 | application/json | PaginateParams | Successfully retrieve punnet contexts     |
|    400 | —                | —              | Invalid request parameters                |

**Examples**

```bash
curl -X GET 'http://localhost:1789/punnets/punnet-contexts?campaign=DefaultMap_Run1&stepId=14737a87-e217-4c9c-ae55-31b6bc71e39d&paginateParams={'from': 1, 'size': 20, 'orderBy': 'campaign', 'ascending': 'true'}' \
  -H 'Authorization: Bearer <token>'
```

### Get values of a metadata

`GET /punnets/values`

Retrieves all values of a given metadata

**Parameters**

| Name       | In    | Required | Type           | Example                                | Description                           |
| ---------- | ----- | :------: | -------------- | -------------------------------------- | ------------------------------------- |
| `campaign` | query |   yes    | Campaign       | `DefaultMap_Run1`                      | Campaign name                         |
| `mapId`    | query |   yes    | TaskFlowMapRef | `2ed1ac12-9406-466d-814a-d9d63c5850e3` | Map Id reference                      |
| `stepId`   | query |   yes    | TaskStepId     | `14737a87-e217-4c9c-ae55-31b6bc71e39d` | The step Id that processed the punnet |
| `field`    | query |   yes    | string         | `metadata1`                            | The metadata key to retrieve values   |

**Responses**

| Status | Content-Type     | Schema        | Description                      |
| -----: | ---------------- | ------------- | -------------------------------- |
|    500 | —                | —             | Server failed to retrieve values |
|    400 | —                | —             | Invalid request parameters       |
|    200 | application/json | CategoryValue | Successfully retrieved values    |

**Examples**

```bash
curl -X GET 'http://localhost:1789/punnets/values?campaign=DefaultMap_Run1&mapId=2ed1ac12-9406-466d-814a-d9d63c5850e3&stepId=14737a87-e217-4c9c-ae55-31b6bc71e39d&field=metadata1' \
  -H 'Authorization: Bearer <token>'
```

### Get punnet context from its id

`GET /punnets/{punnetContextId}`

Retrieves PunnetContext information from its PunnetContextId

**Parameters**

| Name              | In   | Required | Type            | Example                                                                                                                                                                                           | Description               |
| ----------------- | ---- | :------: | --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------- |
| `punnetContextId` | path |   yes    | PunnetContextId | `{'stepId': 'e22ac1be-fced-4eb3-5af5-b59e9b4a4333', 'campaign': 'DefaultMap_Run1', 'taskFlowMapRef': '2ed1ac12-9406-466d-814a-d9d63c5850e3', 'uniqueId': '847dfcd8-7ee3-4d9f-f76b-c0808df99a08'}` | PunnetContextId reference |

**Responses**

| Status | Content-Type    | Schema        | Description                              |
| -----: | --------------- | ------------- | ---------------------------------------- |
|    404 | —               | —             | PunnetContextId did not exist            |
|    200 | application/xml | PunnetContext | Successfully retrieve punnet             |
|    400 | —               | —             | Invalid request parameters               |
|    500 | —               | —             | Server failed to transform punnet as xml |

**Examples**

```bash
curl -X GET 'http://localhost:1789/punnets/{'stepId': 'e22ac1be-fced-4eb3-5af5-b59e9b4a4333', 'campaign': 'DefaultMap_Run1', 'taskFlowMapRef': '2ed1ac12-9406-466d-814a-d9d63c5850e3', 'uniqueId': '847dfcd8-7ee3-4d9f-f76b-c0808df99a08'}' \
  -H 'Authorization: Bearer <token>'
```

### Get punnet exception

`GET /punnets/{punnetContextId}/exception`

Retrieves exception of any punnet from its PunnetContextId

**Parameters**

| Name              | In   | Required | Type            | Example                                                                                                                                                                                           | Description               |
| ----------------- | ---- | :------: | --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------- |
| `punnetContextId` | path |   yes    | PunnetContextId | `{'stepId': 'e22ac1be-fced-4eb3-5af5-b59e9b4a4333', 'campaign': 'DefaultMap_Run1', 'taskFlowMapRef': '2ed1ac12-9406-466d-814a-d9d63c5850e3', 'uniqueId': '847dfcd8-7ee3-4d9f-f76b-c0808df99a08'}` | PunnetContextId reference |

**Responses**

| Status | Content-Type     | Schema        | Description                         |
| -----: | ---------------- | ------------- | ----------------------------------- |
|    404 | —                | —             | PunnetContextId not found           |
|    200 | application/json | PunnetContext | Successfully retrieved exception    |
|    400 | —                | —             | Invalid request parameters          |
|    500 | —                | —             | Server failed to retrieve exception |

**Examples**

```bash
curl -X GET 'http://localhost:1789/punnets/{'stepId': 'e22ac1be-fced-4eb3-5af5-b59e9b4a4333', 'campaign': 'DefaultMap_Run1', 'taskFlowMapRef': '2ed1ac12-9406-466d-814a-d9d63c5850e3', 'uniqueId': '847dfcd8-7ee3-4d9f-f76b-c0808df99a08'}/exception' \
  -H 'Authorization: Bearer <token>'
```

### Get next punnets

`GET /punnets/{punnetContextId}/history/next`

Retrieves next PunnetContext information from a PunnetContextId. Finding several punnets comes from a duplication of punnets in the map. Can be empty if punnet context does not have any next punnet context

**Parameters**

| Name              | In   | Required | Type            | Example                                                                                                                                                                                           | Description               |
| ----------------- | ---- | :------: | --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------- |
| `punnetContextId` | path |   yes    | PunnetContextId | `{'stepId': 'e22ac1be-fced-4eb3-5af5-b59e9b4a4333', 'campaign': 'DefaultMap_Run1', 'taskFlowMapRef': '2ed1ac12-9406-466d-814a-d9d63c5850e3', 'uniqueId': '847dfcd8-7ee3-4d9f-f76b-c0808df99a08'}` | PunnetContextId reference |

**Responses**

| Status | Content-Type     | Schema        | Description                               |
| -----: | ---------------- | ------------- | ----------------------------------------- |
|    500 | —                | —             | Server failed to retrieve punnet contexts |
|    200 | application/json | PunnetContext | Successfully retrieved punnet contexts    |
|    400 | —                | —             | Invalid request parameters                |

**Examples**

```bash
curl -X GET 'http://localhost:1789/punnets/{'stepId': 'e22ac1be-fced-4eb3-5af5-b59e9b4a4333', 'campaign': 'DefaultMap_Run1', 'taskFlowMapRef': '2ed1ac12-9406-466d-814a-d9d63c5850e3', 'uniqueId': '847dfcd8-7ee3-4d9f-f76b-c0808df99a08'}/history/next' \
  -H 'Authorization: Bearer <token>'
```

### Get previous punnet

`GET /punnets/{punnetContextId}/history/previous`

Retrieves previous PunnetContext information from a PunnetContextId. Unlike the next route, it is only possible to find a single punnet context. Can be null if punnet context does not have any previous punnet context

**Parameters**

| Name              | In   | Required | Type            | Example                                                                                                                                                                                           | Description               |
| ----------------- | ---- | :------: | --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------- |
| `punnetContextId` | path |   yes    | PunnetContextId | `{'stepId': 'e22ac1be-fced-4eb3-5af5-b59e9b4a4333', 'campaign': 'DefaultMap_Run1', 'taskFlowMapRef': '2ed1ac12-9406-466d-814a-d9d63c5850e3', 'uniqueId': '847dfcd8-7ee3-4d9f-f76b-c0808df99a08'}` | PunnetContextId reference |

**Responses**

| Status | Content-Type     | Schema        | Description                                  |
| -----: | ---------------- | ------------- | -------------------------------------------- |
|    200 | application/json | PunnetContext | Successfully retrieved the punnet context    |
|    400 | —                | —             | Invalid request parameters                   |
|    500 | —                | —             | Server failed to retrieve the punnet context |

**Examples**

```bash
curl -X GET 'http://localhost:1789/punnets/{'stepId': 'e22ac1be-fced-4eb3-5af5-b59e9b4a4333', 'campaign': 'DefaultMap_Run1', 'taskFlowMapRef': '2ed1ac12-9406-466d-814a-d9d63c5850e3', 'uniqueId': '847dfcd8-7ee3-4d9f-f76b-c0808df99a08'}/history/previous' \
  -H 'Authorization: Bearer <token>'
```

### Get punnet logs

`GET /punnets/{punnetContextId}/logs`

Retrieves logs of any punnet from its PunnetContextId

**Parameters**

| Name              | In   | Required | Type            | Example                                                                                                                                                                                           | Description               |
| ----------------- | ---- | :------: | --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------- |
| `punnetContextId` | path |   yes    | PunnetContextId | `{'stepId': 'e22ac1be-fced-4eb3-5af5-b59e9b4a4333', 'campaign': 'DefaultMap_Run1', 'taskFlowMapRef': '2ed1ac12-9406-466d-814a-d9d63c5850e3', 'uniqueId': '847dfcd8-7ee3-4d9f-f76b-c0808df99a08'}` | PunnetContextId reference |

**Responses**

| Status | Content-Type     | Schema   | Description                    |
| -----: | ---------------- | -------- | ------------------------------ |
|    500 | —                | —        | Server failed to retrieve logs |
|    400 | —                | —        | Invalid request parameters     |
|    200 | application/json | LogEvent | Successfully retrieved logs    |

**Examples**

```bash
curl -X GET 'http://localhost:1789/punnets/{'stepId': 'e22ac1be-fced-4eb3-5af5-b59e9b4a4333', 'campaign': 'DefaultMap_Run1', 'taskFlowMapRef': '2ed1ac12-9406-466d-814a-d9d63c5850e3', 'uniqueId': '847dfcd8-7ee3-4d9f-f76b-c0808df99a08'}/logs' \
  -H 'Authorization: Bearer <token>'
```

### Get punnet as xml

`GET /punnets/{punnetContextId}/xml`

Retrieves a punnet from its PunnetContextId and prints it as an XML file

**Parameters**

| Name              | In   | Required | Type            | Example                                                                                                                                                                                           | Description               |
| ----------------- | ---- | :------: | --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------- |
| `punnetContextId` | path |   yes    | PunnetContextId | `{'stepId': 'e22ac1be-fced-4eb3-5af5-b59e9b4a4333', 'campaign': 'DefaultMap_Run1', 'taskFlowMapRef': '2ed1ac12-9406-466d-814a-d9d63c5850e3', 'uniqueId': '847dfcd8-7ee3-4d9f-f76b-c0808df99a08'}` | PunnetContextId reference |

**Responses**

| Status | Content-Type    | Schema | Description                              |
| -----: | --------------- | ------ | ---------------------------------------- |
|    404 | —               | —      | PunnetContextId not found                |
|    400 | —               | —      | Invalid request parameters               |
|    200 | application/xml |        | Successfully retrieve punnet             |
|    500 | —               | —      | Server failed to transform punnet as xml |

**Examples**

```bash
curl -X GET 'http://localhost:1789/punnets/{'stepId': 'e22ac1be-fced-4eb3-5af5-b59e9b4a4333', 'campaign': 'DefaultMap_Run1', 'taskFlowMapRef': '2ed1ac12-9406-466d-814a-d9d63c5850e3', 'uniqueId': '847dfcd8-7ee3-4d9f-f76b-c0808df99a08'}/xml' \
  -H 'Authorization: Bearer <token>'
```

---

## Queue API

Endpoint for managing queues

### getQueues

`GET /queues`

**Parameters**

| Name             | In    | Required | Type           | Example | Description |
| ---------------- | ----- | :------: | -------------- | ------- | ----------- |
| `paginateParams` | query |   yes    | PaginateParams |         |             |

**Responses**

| Status | Content-Type     | Schema                         | Description |
| -----: | ---------------- | ------------------------------ | ----------- |
|    200 | application/json | PaginateEntityDtoQueueSettings | OK          |

**Examples**

```bash
curl -X GET 'http://localhost:1789/queues?paginateParams=value' \
  -H 'Authorization: Bearer <token>'
```

### createQueue

`POST /queues`

**Request Body**

- `application/json` — QueueSettings

**Responses**

| Status | Content-Type     | Schema        | Description |
| -----: | ---------------- | ------------- | ----------- |
|    200 | application/json | QueueSettings | OK          |

**Examples**

```bash
curl -X POST 'http://localhost:1789/queues' \
  -H 'Authorization: Bearer <token>'
  -H 'Content-Type: application/json'
  -d '{
  "/*": "TODO: replace with QueueSettings */"
}'
```

### updateQueue

`PUT /queues`

**Request Body**

- `application/json` — QueueSettings

**Responses**

| Status | Content-Type     | Schema        | Description |
| -----: | ---------------- | ------------- | ----------- |
|    200 | application/json | QueueSettings | OK          |

**Examples**

```bash
curl -X PUT 'http://localhost:1789/queues' \
  -H 'Authorization: Bearer <token>'
  -H 'Content-Type: application/json'
  -d '{
  "/*": "TODO: replace with QueueSettings */"
}'
```

### deleteQueues_1

`DELETE /queues/delete-by-ids`

**Parameters**

| Name       | In    | Required | Type           | Example | Description |
| ---------- | ----- | :------: | -------------- | ------- | ----------- |
| `queueIds` | query |   yes    | array[QueueId] |         |             |

**Responses**

| Status | Content-Type     | Schema                    | Description |
| -----: | ---------------- | ------------------------- | ----------- |
|    200 | application/json | MultiStatusContentQueueId | OK          |

**Examples**

```bash
curl -X DELETE 'http://localhost:1789/queues/delete-by-ids?queueIds=value' \
  -H 'Authorization: Bearer <token>'
```

### deleteQueues

`DELETE /queues/delete-by-pattern`

**Parameters**

| Name          | In    | Required | Type   | Example | Description |
| ------------- | ----- | :------: | ------ | ------- | ----------- |
| `namePattern` | query |    no    | string |         |             |

**Responses**

| Status | Content-Type     | Schema                    | Description |
| -----: | ---------------- | ------------------------- | ----------- |
|    200 | application/json | MultiStatusContentQueueId | OK          |

**Examples**

```bash
curl -X DELETE 'http://localhost:1789/queues/delete-by-pattern?namePattern=value' \
  -H 'Authorization: Bearer <token>'
```

### deleteQueue

`DELETE /queues/{queueId}`

**Parameters**

| Name      | In   | Required | Type    | Example | Description |
| --------- | ---- | :------: | ------- | ------- | ----------- |
| `queueId` | path |   yes    | QueueId |         |             |

**Responses**

| Status | Content-Type | Schema | Description |
| -----: | ------------ | ------ | ----------- |
|    200 | —            | —      | OK          |

**Examples**

```bash
curl -X DELETE 'http://localhost:1789/queues/{queueId}' \
  -H 'Authorization: Bearer <token>'
```

### getQueue

`GET /queues/{queueId}`

**Parameters**

| Name      | In   | Required | Type    | Example | Description |
| --------- | ---- | :------: | ------- | ------- | ----------- |
| `queueId` | path |   yes    | QueueId |         |             |

**Responses**

| Status | Content-Type     | Schema        | Description |
| -----: | ---------------- | ------------- | ----------- |
|    200 | application/json | QueueSettings | OK          |

**Examples**

```bash
curl -X GET 'http://localhost:1789/queues/{queueId}' \
  -H 'Authorization: Bearer <token>'
```

---

## Shared Objects API

Endpoint for managing shared objects

### Delete shared objects by names

`DELETE /shared-objects/delete-by-names`

Deletes shared objects that match the list of specified shared objects names. Returns a multi-status response indicating the success or failure of deleting each shared objects

**Parameters**

| Name                | In    | Required | Type          | Example                              | Description                   |
| ------------------- | ----- | :------: | ------------- | ------------------------------------ | ----------------------------- |
| `sharedObjectNames` | query |   yes    | array[string] | `['SharedObject1', 'SharedObject2']` | Shared object names to delete |

**Request Body**

- `application/json` — PaginateParams

**Responses**

| Status | Content-Type     | Schema             | Description                            |
| -----: | ---------------- | ------------------ | -------------------------------------- |
|    400 | —                | —                  | Invalid request parameters             |
|    207 | application/json | MultiStatusContent | Server failed to delete shared objects |
|    200 | application/json | MultiStatusContent | Successfully deleted shared objects    |

**Examples**

```bash
curl -X DELETE 'http://localhost:1789/shared-objects/delete-by-names?sharedObjectNames=['SharedObject1', 'SharedObject2']' \
  -H 'Authorization: Bearer <token>'
  -H 'Content-Type: application/json'
  -d '{
  "/*": "TODO: replace with PaginateParams */"
}'
```

### Delete shared objects by pattern

`DELETE /shared-objects/delete-by-pattern`

Deletes shared objects that match the specified name pattern. If no name pattern is provided, all shared objects will be selected. Returns a multi-status response indicating the success or failure of deleting each shared object

**Parameters**

| Name          | In    | Required | Type   | Example     | Description                      |
| ------------- | ----- | :------: | ------ | ----------- | -------------------------------- |
| `namePattern` | query |    no    | string | `Injector*` | Pattern to filter shared objects |

**Request Body**

- `application/json` — PaginateParams

**Responses**

| Status | Content-Type     | Schema             | Description                            |
| -----: | ---------------- | ------------------ | -------------------------------------- |
|    207 | application/json | MultiStatusContent | Server failed to delete shared objects |
|    200 | application/json | MultiStatusContent | Successfully deleted shared objects    |
|    400 | —                | —                  | Invalid request parameters             |

**Examples**

```bash
curl -X DELETE 'http://localhost:1789/shared-objects/delete-by-pattern?namePattern=Injector*' \
  -H 'Authorization: Bearer <token>'
  -H 'Content-Type: application/json'
  -d '{
  "/*": "TODO: replace with PaginateParams */"
}'
```

### Get shared objects by names

`GET /shared-objects/search-by-names`

Retrieves shared objects that match the list of specified shared object names

**Parameters**

| Name                | In    | Required | Type           | Example                                                           | Description                                                 |
| ------------------- | ----- | :------: | -------------- | ----------------------------------------------------------------- | ----------------------------------------------------------- |
| `sharedObjectNames` | query |   yes    | array[string]  | `['SharedObject1', 'SharedObject2']`                              | Shared object names to retrieve                             |
| `mapId`             | query |    no    | TaskFlowMapRef |                                                                   | Identifier of the map from which to retrieve shared objects |
| `paginateParams`    | query |   yes    | PaginateParams | `{'from': 0, 'size': 20, 'orderBy': 'name', 'ascending': 'true'}` | Pagination parameters                                       |

**Responses**

| Status | Content-Type     | Schema                         | Description                             |
| -----: | ---------------- | ------------------------------ | --------------------------------------- |
|    500 | —                | —                              | Server failed to retrieve shared object |
|    400 | —                | —                              | Invalid request parameters              |
|    200 | application/json | PaginateObjectConfigurationMap | Successfully retrieved shared object    |

**Examples**

```bash
curl -X GET 'http://localhost:1789/shared-objects/search-by-names?sharedObjectNames=['SharedObject1', 'SharedObject2']&mapId=value&paginateParams={'from': 0, 'size': 20, 'orderBy': 'name', 'ascending': 'true'}' \
  -H 'Authorization: Bearer <token>'
```

### Get shared objects by pattern

`GET /shared-objects/search-by-pattern`

Retrieves shared objects that match the specified name pattern. If no name pattern is provided, all shared objects will be selected

**Parameters**

| Name             | In    | Required | Type           | Example                                                           | Description                                                 |
| ---------------- | ----- | :------: | -------------- | ----------------------------------------------------------------- | ----------------------------------------------------------- |
| `namePattern`    | query |    no    | string         | `Injector*`                                                       | Pattern to filter shared objects                            |
| `mapId`          | query |    no    | TaskFlowMapRef |                                                                   | Identifier of the map from which to retrieve shared objects |
| `paginateParams` | query |   yes    | PaginateParams | `{'from': 0, 'size': 20, 'orderBy': 'name', 'ascending': 'true'}` | Pagination parameters                                       |

**Responses**

| Status | Content-Type     | Schema                         | Description                           |
| -----: | ---------------- | ------------------------------ | ------------------------------------- |
|    400 | —                | —                              | Invalid request parameters            |
|    500 | —                | —                              | Server failed to update shared object |
|    200 | application/json | PaginateObjectConfigurationMap | Successfully retrieved shared object  |

**Examples**

```bash
curl -X GET 'http://localhost:1789/shared-objects/search-by-pattern?namePattern=Injector*&mapId=value&paginateParams={'from': 0, 'size': 20, 'orderBy': 'name', 'ascending': 'true'}' \
  -H 'Authorization: Bearer <token>'
```

### Delete a shared object

`DELETE /shared-objects/{sharedObjectName}`

Deletes a shared object from its name

**Parameters**

| Name               | In   | Required | Type   | Example          | Description        |
| ------------------ | ---- | :------: | ------ | ---------------- | ------------------ |
| `sharedObjectName` | path |   yes    | string | `mySharedObject` | Shared object name |

**Responses**

| Status | Content-Type | Schema | Description                               |
| -----: | ------------ | ------ | ----------------------------------------- |
|    400 | —            | —      | Invalid request parameters                |
|    500 | —            | —      | Server failed to delete the shared object |
|    200 | —            | —      | Successfully deleted the shared object    |
|    404 | —            | —      | Shared object not found                   |

**Examples**

```bash
curl -X DELETE 'http://localhost:1789/shared-objects/mySharedObject' \
  -H 'Authorization: Bearer <token>'
```

### Get specific shared object

`GET /shared-objects/{sharedObjectName}`

Retrieve one shared object configuration from its name

**Parameters**

| Name               | In   | Required | Type   | Example          | Description        |
| ------------------ | ---- | :------: | ------ | ---------------- | ------------------ |
| `sharedObjectName` | path |   yes    | string | `mySharedObject` | Shared object name |

**Responses**

| Status | Content-Type     | Schema                 | Description                             |
| -----: | ---------------- | ---------------------- | --------------------------------------- |
|    200 | application/json | ObjectConfigurationMap | Successfully retrieved shared object    |
|    500 | —                | —                      | Server failed to retrieve shared object |
|    400 | —                | —                      | Invalid request parameters              |
|    404 | —                | —                      | Shared object not found                 |

**Examples**

```bash
curl -X GET 'http://localhost:1789/shared-objects/mySharedObject' \
  -H 'Authorization: Bearer <token>'
```

### Create a shared object

`POST /shared-objects/{sharedObjectName}`

Creates a shared object from its object configuration and a provided name

**Parameters**

| Name               | In   | Required | Type   | Example          | Description        |
| ------------------ | ---- | :------: | ------ | ---------------- | ------------------ |
| `sharedObjectName` | path |   yes    | string | `mySharedObject` | Shared object name |

**Request Body**

- `application/json` — ObjectConfiguration

**Responses**

| Status | Content-Type     | Schema                 | Description                           |
| -----: | ---------------- | ---------------------- | ------------------------------------- |
|    500 | —                | —                      | Server failed to create shared object |
|    400 | —                | —                      | Invalid request parameters            |
|    201 | application/json | ObjectConfigurationMap | Successfully created shared object    |

**Examples**

```bash
curl -X POST 'http://localhost:1789/shared-objects/mySharedObject' \
  -H 'Authorization: Bearer <token>'
  -H 'Content-Type: application/json'
  -d '{
  "/*": "TODO: replace with ObjectConfiguration */"
}'
```

### Update a shared object

`PUT /shared-objects/{sharedObjectName}`

Updates the configuration or the name of a shared object

**Parameters**

| Name               | In   | Required | Type   | Example          | Description        |
| ------------------ | ---- | :------: | ------ | ---------------- | ------------------ |
| `sharedObjectName` | path |   yes    | string | `mySharedObject` | Shared object name |

**Request Body**

- `application/json` — ObjectConfiguration

**Responses**

| Status | Content-Type     | Schema                 | Description                           |
| -----: | ---------------- | ---------------------- | ------------------------------------- |
|    200 | application/json | ObjectConfigurationMap | Successfully updated shared object    |
|    400 | —                | —                      | Invalid request parameters            |
|    500 | —                | —                      | Server failed to update shared object |

**Examples**

```bash
curl -X PUT 'http://localhost:1789/shared-objects/mySharedObject' \
  -H 'Authorization: Bearer <token>'
  -H 'Content-Type: application/json'
  -d '{
  "/*": "TODO: replace with ObjectConfiguration */"
}'
```

---

## User API

Endpoint for managing users

### Delete all users

`DELETE /users`

Deletes all users

**Parameters**

| Name            | In     | Required | Type   | Example | Description |
| --------------- | ------ | :------: | ------ | ------- | ----------- |
| `Authorization` | header |   yes    | string |         |             |

**Request Body**

- `application/json` — array[string]

**Responses**

| Status | Content-Type | Schema | Description               |
| -----: | ------------ | ------ | ------------------------- |
|    200 | —            | —      | Successfully created user |

**Examples**

```bash
curl -X DELETE 'http://localhost:1789/users' \
  -H 'Authorization: Bearer <token>'
  -H 'Content-Type: application/json'
  -d '{
  "/*": "TODO: replace with array[string] */"
}'
```

### Get number of users per role

`GET /users/count-by-role`

Retrieves the number of users for each role

**Responses**

| Status | Content-Type | Schema | Description                        |
| -----: | ------------ | ------ | ---------------------------------- |
|    200 | —            | —      | Successfully found number of users |

**Examples**

```bash
curl -X GET 'http://localhost:1789/users/count-by-role' \
  -H 'Authorization: Bearer <token>'
```

### Check if user exists

`GET /users/does-user-exist/{userEmail}`

Checks if a user with the given email exists

**Parameters**

| Name        | In   | Required | Type   | Example | Description |
| ----------- | ---- | :------: | ------ | ------- | ----------- |
| `userEmail` | path |   yes    | string |         |             |

**Responses**

| Status | Content-Type | Schema  | Description |
| -----: | ------------ | ------- | ----------- |
|    200 | _/_          | boolean | OK          |

**Examples**

```bash
curl -X GET 'http://localhost:1789/users/does-user-exist/{userEmail}' \
  -H 'Authorization: Bearer <token>'
```

### Update current user

`PATCH /users/me`

Updates information of the currently authenticated user

**Request Body**

- `application/json` — UpdateUserDto

**Responses**

| Status | Content-Type | Schema | Description               |
| -----: | ------------ | ------ | ------------------------- |
|    200 | —            | —      | Successfully updated user |

**Examples**

```bash
curl -X PATCH 'http://localhost:1789/users/me' \
  -H 'Authorization: Bearer <token>'
  -H 'Content-Type: application/json'
  -d '{
  "/*": "TODO: replace with UpdateUserDto */"
}'
```

### Create a user or an admin

`POST /users/register`

Creates a user from its password, firstname, lastname and email. You cannot create super admin with this endpoint

**Request Body**

- `application/json` — RegisterRequest

**Responses**

| Status | Content-Type | Schema | Description                                                       |
| -----: | ------------ | ------ | ----------------------------------------------------------------- |
|    200 | —            | —      | Successfully created user                                         |
|    403 | —            | —      | User creation is restricted to a single user in the configuration |
|    500 | —            | —      | Server failed to create user                                      |
|    409 | —            | —      | An account with this email already exists                         |

**Examples**

```bash
curl -X POST 'http://localhost:1789/users/register' \
  -H 'Authorization: Bearer <token>'
  -H 'Content-Type: application/json'
  -d '{
  "/*": "TODO: replace with RegisterRequest */"
}'
```

### Create a super admin

`POST /users/register-super-admin`

Creates a user from its password, firstname, lastname and email

**Request Body**

- `application/json` — RegisterRequest

**Responses**

| Status | Content-Type | Schema | Description                                                       |
| -----: | ------------ | ------ | ----------------------------------------------------------------- |
|    200 | —            | —      | Successfully created user                                         |
|    403 | —            | —      | User creation is restricted to a single user in the configuration |
|    500 | —            | —      | Server failed to create user                                      |
|    409 | —            | —      | An account with this email already exists                         |

**Examples**

```bash
curl -X POST 'http://localhost:1789/users/register-super-admin' \
  -H 'Authorization: Bearer <token>'
  -H 'Content-Type: application/json'
  -d '{
  "/*": "TODO: replace with RegisterRequest */"
}'
```

### Register a worker

`POST /users/register-worker`

Creates a worker as member to allow broker communication

**Parameters**

| Name               | In     | Required | Type   | Example | Description |
| ------------------ | ------ | :------: | ------ | ------- | ----------- |
| `X-Register-Token` | header |   yes    | string |         |             |

**Request Body**

- `application/json` — RegisterRequest

**Responses**

| Status | Content-Type | Schema | Description                                                       |
| -----: | ------------ | ------ | ----------------------------------------------------------------- |
|    200 | —            | —      | Successfully created user                                         |
|    403 | —            | —      | User creation is restricted to a single user in the configuration |
|    500 | —            | —      | Server failed to create user                                      |
|    409 | —            | —      | An account with this email already exists                         |

**Examples**

```bash
curl -X POST 'http://localhost:1789/users/register-worker' \
  -H 'Authorization: Bearer <token>'
  -H 'Content-Type: application/json'
  -d '{
  "/*": "TODO: replace with RegisterRequest */"
}'
```

### getUsersByPattern

`GET /users/search-by-pattern`

**Parameters**

| Name             | In    | Required | Type           | Example | Description |
| ---------------- | ----- | :------: | -------------- | ------- | ----------- |
| `namePattern`    | query |    no    | string         |         |             |
| `paginateParams` | query |   yes    | PaginateParams |         |             |

**Responses**

| Status | Content-Type | Schema                   | Description |
| -----: | ------------ | ------------------------ | ----------- |
|    200 | _/_          | PaginateEntityDtoUserDto | OK          |

**Examples**

```bash
curl -X GET 'http://localhost:1789/users/search-by-pattern?namePattern=value&paginateParams=value' \
  -H 'Authorization: Bearer <token>'
```

### Check admin existence

`GET /users/super-admin-exists`

Checks if super admin is registered

**Responses**

| Status | Content-Type | Schema | Description              |
| -----: | ------------ | ------ | ------------------------ |
|    200 | —            | —      | Successfully found admin |

**Examples**

```bash
curl -X GET 'http://localhost:1789/users/super-admin-exists' \
  -H 'Authorization: Bearer <token>'
```

### Delete a user

`DELETE /users/{userEmail}`

Deletes a user from its email

**Parameters**

| Name        | In   | Required | Type   | Example | Description |
| ----------- | ---- | :------: | ------ | ------- | ----------- |
| `userEmail` | path |   yes    | string |         |             |

**Responses**

| Status | Content-Type | Schema | Description               |
| -----: | ------------ | ------ | ------------------------- |
|    200 | —            | —      | Successfully deleted user |

**Examples**

```bash
curl -X DELETE 'http://localhost:1789/users/{userEmail}' \
  -H 'Authorization: Bearer <token>'
```

### Get a user

`GET /users/{userEmail}`

Retrieves user information from its email

**Parameters**

| Name        | In   | Required | Type   | Example | Description |
| ----------- | ---- | :------: | ------ | ------- | ----------- |
| `userEmail` | path |   yes    | string |         |             |

**Responses**

| Status | Content-Type | Schema | Description                 |
| -----: | ------------ | ------ | --------------------------- |
|    200 | —            | —      | Successfully retrieved user |

**Examples**

```bash
curl -X GET 'http://localhost:1789/users/{userEmail}' \
  -H 'Authorization: Bearer <token>'
```

### Update another user

`PATCH /users/{userEmail}`

Admin updates any user's information

**Parameters**

| Name        | In   | Required | Type   | Example | Description |
| ----------- | ---- | :------: | ------ | ------- | ----------- |
| `userEmail` | path |   yes    | string |         |             |

**Request Body**

- `application/json` — UpdateUserDto

**Responses**

| Status | Content-Type | Schema | Description               |
| -----: | ------------ | ------ | ------------------------- |
|    200 | —            | —      | Successfully updated user |

**Examples**

```bash
curl -X PATCH 'http://localhost:1789/users/{userEmail}' \
  -H 'Authorization: Bearer <token>'
  -H 'Content-Type: application/json'
  -d '{
  "/*": "TODO: replace with UpdateUserDto */"
}'
```

---

## Worker API

API for managing workers

### deleteWorkers

`DELETE /workers`

**Parameters**

| Name        | In    | Required | Type            | Example | Description |
| ----------- | ----- | :------: | --------------- | ------- | ----------- |
| `workerIds` | query |    no    | array[WorkerId] |         |             |

**Responses**

| Status | Content-Type     | Schema                     | Description |
| -----: | ---------------- | -------------------------- | ----------- |
|    200 | application/json | MultiStatusContentWorkerId | OK          |

**Examples**

```bash
curl -X DELETE 'http://localhost:1789/workers?workerIds=value' \
  -H 'Authorization: Bearer <token>'
```

### getWorkers

`GET /workers`

**Parameters**

| Name             | In    | Required | Type            | Example | Description |
| ---------------- | ----- | :------: | --------------- | ------- | ----------- |
| `workerIds`      | query |    no    | array[WorkerId] |         |             |
| `paginateParams` | query |   yes    | PaginateParams  |         |             |

**Responses**

| Status | Content-Type     | Schema                      | Description |
| -----: | ---------------- | --------------------------- | ----------- |
|    200 | application/json | PaginateEntityDtoWorkerInfo | OK          |

**Examples**

```bash
curl -X GET 'http://localhost:1789/workers?workerIds=value&paginateParams=value' \
  -H 'Authorization: Bearer <token>'
```

### spawnWorker

`POST /workers`

**Responses**

| Status | Content-Type | Schema | Description |
| -----: | ------------ | ------ | ----------- |
|    200 | —            | —      | OK          |

**Examples**

```bash
curl -X POST 'http://localhost:1789/workers' \
  -H 'Authorization: Bearer <token>'
```

### getLibraries

`GET /workers/libraries`

**Parameters**

| Name             | In    | Required | Type           | Example | Description |
| ---------------- | ----- | :------: | -------------- | ------- | ----------- |
| `paginateParams` | query |   yes    | PaginateParams |         |             |

**Responses**

| Status | Content-Type     | Schema                      | Description |
| -----: | ---------------- | --------------------------- | ----------- |
|    200 | application/json | PaginateEntityDtoJarInfoDto | OK          |

**Examples**

```bash
curl -X GET 'http://localhost:1789/workers/libraries?paginateParams=value' \
  -H 'Authorization: Bearer <token>'
```

### getLibraryVersions

`GET /workers/library-versions/{libraryName}`

**Parameters**

| Name          | In   | Required | Type   | Example | Description |
| ------------- | ---- | :------: | ------ | ------- | ----------- |
| `libraryName` | path |   yes    | string |         |             |

**Responses**

| Status | Content-Type     | Schema                      | Description |
| -----: | ---------------- | --------------------------- | ----------- |
|    200 | application/json | PaginateEntityDtoJarInfoDto | OK          |

**Examples**

```bash
curl -X GET 'http://localhost:1789/workers/library-versions/{libraryName}' \
  -H 'Authorization: Bearer <token>'
```

### restartWorkers

`POST /workers/restart`

**Parameters**

| Name        | In    | Required | Type            | Example | Description |
| ----------- | ----- | :------: | --------------- | ------- | ----------- |
| `workerIds` | query |    no    | array[WorkerId] |         |             |

**Responses**

| Status | Content-Type     | Schema                     | Description |
| -----: | ---------------- | -------------------------- | ----------- |
|    200 | application/json | MultiStatusContentWorkerId | OK          |

**Examples**

```bash
curl -X POST 'http://localhost:1789/workers/restart?workerIds=value' \
  -H 'Authorization: Bearer <token>'
```

### restartWorkerById

`POST /workers/restart/{workerId}`

**Parameters**

| Name       | In   | Required | Type     | Example | Description |
| ---------- | ---- | :------: | -------- | ------- | ----------- |
| `workerId` | path |   yes    | WorkerId |         |             |

**Responses**

| Status | Content-Type | Schema | Description |
| -----: | ------------ | ------ | ----------- |
|    200 | —            | —      | OK          |

**Examples**

```bash
curl -X POST 'http://localhost:1789/workers/restart/{workerId}' \
  -H 'Authorization: Bearer <token>'
```

### uploadLibrary

`POST /workers/upload-library`

**Request Body**

- `multipart/form-data` — object

**Responses**

| Status | Content-Type | Schema | Description |
| -----: | ------------ | ------ | ----------- |
|    200 | —            | —      | OK          |

**Examples**

```bash
curl -X POST 'http://localhost:1789/workers/upload-library' \
  -H 'Authorization: Bearer <token>'
  -H 'Content-Type: multipart/form-data'
  -F 'file=@/path/to/file'
```

### deleteWorkerById

`DELETE /workers/{workerId}`

**Parameters**

| Name       | In   | Required | Type     | Example | Description |
| ---------- | ---- | :------: | -------- | ------- | ----------- |
| `workerId` | path |   yes    | WorkerId |         |             |

**Responses**

| Status | Content-Type | Schema | Description |
| -----: | ------------ | ------ | ----------- |
|    200 | —            | —      | OK          |

**Examples**

```bash
curl -X DELETE 'http://localhost:1789/workers/{workerId}' \
  -H 'Authorization: Bearer <token>'
```

### getWorkerById

`GET /workers/{workerId}`

**Parameters**

| Name       | In   | Required | Type     | Example | Description |
| ---------- | ---- | :------: | -------- | ------- | ----------- |
| `workerId` | path |   yes    | WorkerId |         |             |

**Responses**

| Status | Content-Type     | Schema     | Description |
| -----: | ---------------- | ---------- | ----------- |
|    200 | application/json | WorkerInfo | OK          |

**Examples**

```bash
curl -X GET 'http://localhost:1789/workers/{workerId}' \
  -H 'Authorization: Bearer <token>'
```

### getWorkerLogs

`GET /workers/{workerId}/logs`

**Parameters**

| Name       | In    | Required | Type           | Example | Description |
| ---------- | ----- | :------: | -------------- | ------- | ----------- |
| `workerId` | path  |   yes    | WorkerId       |         |             |
| `results`  | query |    no    | integer(int32) |         |             |

**Responses**

| Status | Content-Type     | Schema          | Description |
| -----: | ---------------- | --------------- | ----------- |
|    200 | application/json | array[LogEvent] | OK          |

**Examples**

```bash
curl -X GET 'http://localhost:1789/workers/{workerId}/logs?results=value' \
  -H 'Authorization: Bearer <token>'
```

---

## Error Handling

The API uses conventional HTTP status codes. 4xx indicates client errors (validation, authentication, missing resources), 5xx indicates server errors. Response bodies may include additional context where applicable.

## Pagination

Many listing endpoints accept a `paginateParams` object with fields `from`, `size`, `orderBy`, `ascending` to page results.
