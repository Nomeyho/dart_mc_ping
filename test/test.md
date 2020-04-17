# Retrieve a list of server IPs for the tests

1. Go to `https://minecraftservers.org/index/1`

2. Run the following code from the console:
```
const IP = [];
for(const element of document.getElementsByClassName('icon ip')) {
    IP.push(element.nextSibling.data);
}
console.log(IP);
```

3. Update `dart_mc_ping_test.dart`
