# moment-fweek.js
This plugin provides fiscal weekly formatting for moment objects.

## How to use?
Call the `fweek` method on any moment object. It returns an object by default and can also return a string.
```javascript
moment("2013-04-01").fweek();
// {week:1, year:2013, nextYear:2014}
moment("2013-04-01").fweek().toString();
// W1 2013/14