# Corona-Busted

This is a set of mocks we use when testing Corona SDK applications/games using Busted test framework.
They are by no means complete, they are adjusted to what we do, however we feel some people may find them useful.

Developing with unit tests at hand is so much easier...

If you think unit testing Corona apps/games isn't something you want to use, just try and wait.
I bet you'll find yourself saving a lot of time debuggin simple errors in feature A introduced by a small change in feature B.

## More info

You can find Busted here: https://github.com/Olivine-Labs/busted

Like I mentioned in the description, these files are adjusted to our build process, where in the end we get a single directory with all files.
This way we develop with a nice directory tree, but don't have to worry about directory handling in lua.
If you do it other way, you might need to adjust the 'require' calls, to include directory.

## Example

I have included an example test suite, which performs a simple transition on a rect.
Also there's an ant buildfile, which can run everything for you, but you may need to adjust PATH, LUA_PATH and LUA_CPATH variables to reflect your system.

# Contributions are welcome!

If you modify or create new mocks, please share with us. We will update the project as we go and create/update ours.
