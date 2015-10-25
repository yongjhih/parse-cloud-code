# Twitch for Parse Cloud

![](art/parse-twitch.png)

Allow signInWithTwitch.

## Usage

Android:

```java
Map<String, ?> tokenMap = new HashMap<>();
String twitchToken = "{twitchToken}";
tokenMap.put("access_token", twitchToken);

// synchronious
ParseUser.become(ParseCloud.callFunction("signInWithTwitch", tokenMap));

// RxParse
// ParseObservable.callFunction("signInWithTwitch", tokenMap).flatMap(ParseObservable::become).subscribe(user -> {}, e -> {});

// Bolts
// ParseCloud.callFunctionInBackground().onSuccessTask(tokenTask -> {
//   return ParseUser.becomeInBackground(tokenTask.getResult());
// }).onSuccess(userTask -> {
//   System.out.println(userTask.getResult());
// });
```

JavaScript:

```js
var twitchToken = "{twitchToken}";
Parse.Cloud.run("signInWithTwitch", { access_token: twitchToken }).then(function(sessionToken) {
  return Parse.User.become(sessionToken);
}).then(function(user) {
  console.log(user);
}, function(e) {
  console.log(e);
});
```

curl for ShellScript:

```bash
#!/usr/bin/env bash

twitch_token="${1:-TWITCH_TOKEN}" # MODIFY ME
parse_app_id="" # MODIFY ME
parse_rest_key="" # MODIFY ME

curl -X POST \
 -H "X-Parse-Application-Id: ${parse_app_id}" \
 -H "X-Parse-REST-API-Key: ${parse_rest_key}" \
 -H "Content-Type: application/json" \
 -d "{\"access_token\": \"${twitch_token}\"}" \
 https://api.parse.com/1/functions/signInWithTwitch
```

## Installation

```bash
parse new
# ...

cp .../twitch.js cloud/twitch.js
parse deploy
```

## LICENSE

Copyright 2015 8tory, Inc.

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
