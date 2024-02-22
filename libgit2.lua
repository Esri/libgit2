project "libgit2"

dofile(_BUILD_DIR .. "/static_library.lua")

configuration { "*" }

uuid "59734853-1767-435a-9969-849cd0d18240"

defines {
  "GIT_THREADS=1",
  "GIT_SHA1_COLLISIONDETECT=1",
  "SHA1DC_NO_STANDARD_INCLUDES=1",
  "LIBGIT2_NO_FEATURES_H",
  "GIT_REGEX_BUILTIN",

  -- The following are taken from libgit2/deps/pcre/{CMakeLists.txt, config.h.in}
  "LINK_SIZE=2",
  "PARENS_NEST_LIMIT=250",
  "MATCH_LIMIT=10000000",
  "MATCH_LIMIT_RECURSION=10000000",
  "NEWLINE=10",
  "NO_RECURSE=1",
  "POSIX_MALLOC_THRESHOLD=10",
  "BSR_ANYCRLF=1",
  "MAX_NAME_SIZE=32",
  "MAX_NAME_COUNT=10000",
}

includedirs {
  "include",
  "src",
  "deps/http-parser",
  "deps/pcre",
  _3RDPARTY_DIR .. "/zlib-ng",
}

files {
  "deps/http-parser/*.c",
  "deps/pcre/*.c",
  "src/*.c",
  "src/allocators/*.c",
  "src/hash/sha1/collisiondetect.c",
  "src/hash/sha1/sha1dc/*.c",
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

  excludes {
    -- use win32/rt_win32_thread.c to alias (rename) win32/thread.c without altering upstream source
    "src/win32/thread.c",
  }
end

if (_PLATFORM_WINUWP) then
end
