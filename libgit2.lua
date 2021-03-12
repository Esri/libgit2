project "libgit2"

dofile(_BUILD_DIR .. "/static_library.lua")

configuration { "*" }

uuid "59734853-1767-435a-9969-849cd0d18240"

defines {
  "GIT_THREADS=1",
  "GIT_SHA1_COLLISIONDETECT=1",
  "SHA1DC_NO_STANDARD_INCLUDES=1",
  "LIBGIT2_NO_FEATURES_H",
}

includedirs {
  "include",
  "src",
  "deps/http-parser",
  "deps/regex",
  _3RDPARTY_DIR .. "/zlib",
}

files {
  "deps/http-parser/*.c",
  "deps/regex/regex.c",
  "src/*.c",
  "src/hash/sha1dc/*.c",
  "src/streams/*.c",
  "src/transports/*.c",
  "src/xdiff/*.c",
}

if (_PLATFORM_ANDROID) then
end

if (_PLATFORM_COCOA) then
end

if (_PLATFORM_IOS) then
end

if (_PLATFORM_LINUX) then
  defines {
    "SHA1DC_CUSTOM_INCLUDE_SHA1_C=\\\"common.h\\\"",
    "SHA1DC_CUSTOM_INCLUDE_UBC_CHECK_C=\\\"common.h\\\"",
  }

  files {
    "src/unix/*.c",
  }
end

if (_PLATFORM_MACOS) then
  defines {
    "SHA1DC_CUSTOM_INCLUDE_SHA1_C=\\\"common.h\\\"",
    "SHA1DC_CUSTOM_INCLUDE_UBC_CHECK_C=\\\"common.h\\\"",
  }

  files {
    "src/unix/*.c",
  }
end

if (_PLATFORM_WINDOWS) then
  defines {
    "SHA1DC_CUSTOM_INCLUDE_SHA1_C=\"common.h\"",
    "SHA1DC_CUSTOM_INCLUDE_UBC_CHECK_C=\"common.h\"",
  }

  files {
    "src/win32/*.c",
  }
end

if (_PLATFORM_WINUWP) then
end
