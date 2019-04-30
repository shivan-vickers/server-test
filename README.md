# Google Assistant + IFTTT to Open Files on Your Computer

### Intro

Just something simple, made for fun.

Starts a server on your computer which will listen for web requests and open a file from your start menu that matches the body of the request.

You'll need to create an IFTTT account and create an applet that sends a web request to your IP when you say something to Google Assistant. You'll also have to forward port 8080 on your router, or start the server on a port that's already open.

I can post details on how to do this at some point in the future, if there's interest.

### Disclaimer!

This was just made to see if I could, there's no security at this stage. I really don't recommend leaving it on all day with the port open on your router. It wouldn't be a challenge for someone to hack in and run arbitrary code on your computer.

### More Cool Possibilities

Now that it can send web requests as a response to any of the available triggers you can do almost anything with IFTTT. You could really easily expand on the code here to, for example, start a script to perform a series of tasks, or to get IFTTT respond to a text or email instead of Google Assistant.

If you've got the time and patience, you could go further by creating a series of applets that respond to each other. After IFTTT sends the web request to the server to open something on my computer, the server could respond by sending a web request to IFTTT which can then send me a text to let me know whether or not the application opened.

IFTTT is pretty amazing!
