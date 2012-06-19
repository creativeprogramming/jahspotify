===============================================================================
Jah'Spotify Project
===============================================================================

## Introduction

Jah'Spotify is a Java wrapper built on top of the Spotify native APIs (libspotify)

Currently supports:

* retrieving library (all user playlists/folders)
* retrieve a playlist
* retrieve a folder (including/excluding sub-folders and playlists)
* retrieve an album
* retrieve a track
* retrieve an image
* add tracks to a queue (single queue currently supported)
* play tracks
* pause/skip functions
* dynamic playlist using echonest apis
* basic historical track list view
* very basic android app for remote control

In addition, all the above functions are accessible over a JSON based RESTful API (provided by the services and web
modules).

## To build

Jah'Spotify supports the Linux and Windows versions of libspotify (see below for more details on building on Windows).
You also need to download and install libspotify & request an API key from Spotify.  This can be done
on the http://developer.spotify.com website.  Generate the key and download the C code version of it.  Place this
in a file called AppKey.h in the native/src/main/native/inc directory.  You may want to place some #ifndef APPKEY
statements in this to prevent linking problems.

Next, to build the sources, check them out from git

git clone git://github.com/johanlindquist/jahspotify.git
cd jahspotify
mvn clean install

### Building on Windows

#### Before compiling

1. Download MinGW and put the bin folder in your PATH.
2. Download the OpenAL SDK from and copy the include folder to the MinGW include folder and rename it to AL
3. The native pom.xml has a reference to a local LibSpotify folder. Change this to your own Spotify folder. You'll get an error that the api.h file can't be found if you don't.
4. Add a reference to your OpenAL installation folder

You can find the OpenAL SDK at:

    http://connect.creativelabs.com/developer/Wiki/OpenAL%20SDK%20for%20Windows.aspx

## Running

Download and install MongoDB

You will also need to download a few more dependencies:

### Running on Windows

- phtread (http://sources.redhat.com/pthreads-win32/). pthreadGC2.dll needs to be in your path.
- I didn't have to add any paths to OpenAL but I installed the SDK. Let me know if you get a message complaining that not all dependencies are available.

---- Modules -----

* android
  provides a simple app for browsing playlists and queueing tracks
* api
  provides the basic operations for interacting with Jah'Spotify (and in turn libspotify)
* native
  contains all native & JNI code interacting with libspotify
* services
  provides all Jah'Spotify Spring services
* web
  provides the RESTful API (json based)
* executable-war
  provides a single, executable Jah'Spotify war file
* web-client
  provides java client for interacting with the RESTful API
* web-common
  provides the java beans which are serialized over the RESTful API
* storage
  provides basic storage implementations for caching media objects (tracks/images/etc)

## UI

## REST API

To run up the Jah'Spotify RESTful API

mvn jetty:run -Djahspotify.spotify.username=<your username> -Djahspotify.spotify.password=<your password>

NOTE: The username and password can also be specified in your Maven settings.xml

http://localhost:8080/jahspotify/system/status

All media can be retrieved using the Media Controller URL

http://localhost:8080/jahspotify/media/<URI>

Where the URI is any of the URIs specified below, in the more specialized controllers:

### URLs

Library retrieval
    http://localhost:8080/jahspotify/library/
Folder retrieval
    http://localhost:8080/jahspotify/folder/jahspotify:folder:9594c66fa67e43ca
Playlist retrieval
    http://localhost:8080/jahspotify/playlist/spotify:user:dummy-user:playlist:0s8KIfDTmZz5zupnkqF6FO
Album retrieval
    http://localhost:8080/jahspotify/album/spotify:album:3PogVmhNucYNfyywZvTd7F
Artist retrieval
    http://localhost:8080/jahspotify/artist/spotify:artist:7dGJo4pcD2V6oG8kP0tJRR
Track retrieval
    http://localhost:8080/jahspotify/track/spotify:track:7mliwEVqxIuwLmHdTXlBrx
Image retrieval
    http://localhost:8080/jahspotify/image/spotify:image:e99e74261d120029fecfde36ab1c07a0eb99e54d
Adding a track to the play queue
    http://localhost:8080/jahspotify/queue/jahspotify:queue:default/add/spotify:track:2eEUnqeLUjxkefHrIgqgAd
Retrieving play queue
    http://localhost:8080/jahspotify/queue/jahspotify:queue:default
Searching
    http://localhost:8080/jahspotify/search/?query=alika&numTracks=1

#### While playing:

Skip to next track in queue
    http://localhost:8080/jahspotify/player/skip
Pause playback
    http://localhost:8080/jahspotify/player/pause
Resume play
    http://localhost:8080/jahspotify/player/play
Stop play
    http://localhost:8080/jahspotify/player/stop
Play
    http://localhost:8080/jahspotify/player/play

There are other URLs - please examine the web module for them.

NOTE: You may have to setup your LD_LIBRARY_PATH to point to the libspotify & libjahspotify locations!

## Discussions and other:

For now, there is nothing concrete setup but try the issues page on github, contacting us on github.  Also found at times
on freenode - #jahspotify.

## Licensing

All Jah'Spotify code is released under the Apache 2.0 license

