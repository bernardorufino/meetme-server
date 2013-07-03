# MeetMe Server

## API for managing groups

Creating a new group providing new user data
```
/groups/create?user=Joao&lat=-23.210079&lon=-45.876911
```
Will return data necessary to handling future requests
```
{"group":{"password":"p0m6"},"user":{"id":8}}
```

Joining this recently created group with new user is done via the password received above
```
/groups/join/p0m6?user=Samuel&lat=-3.730712&lon=-38.526134
```
Again, it returns useful data
```
{"user":{"id":9}}
```

Retrieving locations of the group
```
/groups/retrieve/p0m6
```
Returns
```
{"group": {
	"updated_at": "2013-07-02T21:38:46Z",
	"users": [{
		"id":8,
		"name":"Joao",
		"latitude":-23.210079,
		"longitute":-45.876911
	},{
		"id":9,
		"name":"Samuel",
		"latitude":-3.730712,
		"longitute":-38.526134
	}]
}}
```

Updating it's location is via the user id, returned by the first request to create new group or to join existing group
```
/groups/update/p0m6?user=8&lat=-8.053849&lon=-34.885540
```
Above request will return
```
true
```
Or, if group doesn't exist
```
nogroup
```
Or, if user doesn't exist
```
nouser
```

Groups not updated in an interval of 8 hours are marked for exclusion, and cannot be retrieved later.
